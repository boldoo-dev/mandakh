from flask import Flask, render_template, request, jsonify, redirect, url_for, flash, session
from neo4j import GraphDatabase
import os
from functools import wraps
from flask_cors import CORS
from flask_paginate import Pagination, get_page_parameter
from datetime import datetime
import bcrypt

app = Flask(__name__)
CORS(app)

app.secret_key = 'your_unique_and_secret_key_here'


URI = 'bolt://localhost:7687'
AUTH = ('neo4j', 'admin123')


def get_driver():
    return GraphDatabase.driver(uri=URI, auth=AUTH)




@app.route('/login', methods=['GET', 'POST'])
def login():
    if not session: 
        if request.method == 'POST':
            email = request.form['email']
            password = request.form['password']

            with get_driver() as driver:
                user, b, c = driver.execute_query(f'''MATCH(p:User)
                                                    WHERE p.email ='{email}'
                                                    RETURN p.email as email, p.password as storedPass, p.userRole as role
                                                ''')

                if not user:
                    flash('Мэйл буруу байна.')
                    return redirect(url_for('login'))
                    # login_user(user_obj)

                if bcrypt.checkpw(password.encode('utf-8'), user[0]['storedPass'].encode('utf-8')):
                    session['role'] = user[0]['role']
                    flash(f"Амжилттай нэвтэрлээ. {user[0]['email']}")
                    return redirect(url_for('index'))

                flash('нууц үг бууу байна.')
                return redirect(url_for('login'))
        return render_template('login/login.html')
    return redirect(url_for('index'))


@app.route('/logout')
def logout():
    session.clear()
    flash("You have been logged out.")
    return redirect(url_for('index'))


@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if not session :
        if request.method == 'POST':
            email = request.form['email']
            password = request.form['password']
            repeat_password = request.form['repeat_password']
            userRole = request.form['userRole']

            if password != repeat_password:
                flash("Password таарахгүй байна")
                return redirect(url_for('signup'))

            hashed_password = bcrypt.hashpw(password.encode(
                'utf-8'), bcrypt.gensalt()).decode('utf-8')
            with get_driver() as driver:
                user, b, c = driver.execute_query(f'''MATCH(p:User)
                                                    WHERE p.email ='{email}'
                                                    RETURN p.email
                                                ''')
                if user is None:
                    flash('Бүртгэлтэй байна."')
                    return redirect(url_for('signup'))
                    # login_user(user_obj)

                query = '''Create (p:User{email:$email,
                                        password:$hashed_password,
                                        userRole:$userRole})
                                return p                    '''
                res, b, c = driver.execute_query(
                    query, email=email, hashed_password=hashed_password, userRole=userRole)

                flash("Амжилттай бүртгэгдлээ.", "success")
                return redirect(url_for('login'))
        elif request.method == 'GET':
            return render_template('login/signup.html')
    return redirect(url_for('index'))

@app.route('/search', methods=['POST', 'GET'])
def search():
    limit = 3
    page = int(request.args.get('page', 1))
    start = (page-1)*limit

    search_term = request.form.get(
        'search') if request.method == 'POST' else request.args.get('search')

    startyear = request.form.get(
        'start-year') if request.method == 'POST' else request.args.get('startyear')

    endyear = request.form.get(
        'end-year') if request.method == 'POST' else request.args.get('endyear')

    with get_driver() as con:
        if endyear and startyear:

            queryMovieYear = f'''
                        MATCH (m:Movie)
                        WHERE m.released >= {int(startyear[:4])} AND m.released <= {int(endyear[:4])}
                        RETURN m.title AS title,
                            m.released AS released,
                            m.image AS image,
                            m.tagline AS tagline
                        order by m.released asc'''
            movieYear, summary, keys = con.execute_query(queryMovieYear)

            pn = Pagination(page=page, per_page=limit, total=len(
                movieYear), css_framework='tailwind')

            paginateMovieSearch = f'''
                        MATCH (m:Movie)
                        WHERE m.released >= {int(startyear[:4])} AND m.released <= {int(endyear[:4])}
                        RETURN m.title AS title,
                            m.released AS released,
                            m.image AS image,
                            m.tagline AS tagline
                        order by m.released asc
                        skip {start} limit {limit}'''
            pageyearSearch, summary, keys = con.execute_query(
                paginateMovieSearch)

            return render_template('search.html', moviedata=pageyearSearch, countmovie=len(movieYear), pn=pn, pnPeople=pn, startyear=startyear[:4], endyear=endyear[:4], search_term=search_term)

        if search_term:
            queryMovie = f'''
                        MATCH(m:Movie)
                        WHERE toLower(m.title) CONTAINS toLower('{search_term}')
                        return
                            m.title as title,
                            m.released as released,
                            m.image as image,
                            m.tagline as tagline'''

            movie, summary, keys = con.execute_query(queryMovie)
            pn = Pagination(page=page, per_page=limit, total=len(
                movie), css_framework='tailwind')

            paginateMovie = f'''
                        MATCH(m:Movie)
                        WHERE toLower(m.title) CONTAINS toLower('{search_term}')
                        return
                            m.title as title,
                            m.released as released,
                            m.image as image,
                            m.tagline as tagline skip {start} limit {limit}'''
            pagemovie, summary, keys = con.execute_query(paginateMovie)

            # movie

            queryPeople = f'''
                        MATCH(m:Person)-[r]-(p)
                        WHERE toLower(m.name) CONTAINS toLower('{search_term}')
                        return
                            m.name as name,
                            m.born as born,
                            COLLECT(r.roles) as role ,
                            COLLECT(p.title)  as title,
                            COLLECT(type(r))  as rel'''

            people, summary, keys = con.execute_query(queryPeople)
            pnPeople = Pagination(page=page, per_page=limit, total=len(
                people), css_framework='tailwind')

            paginatepeople = f'''
                        MATCH(m:Person)-[r]-(p)
                        WHERE toLower(m.name) CONTAINS toLower('{search_term}')
                        return
                            m.name as name,
                            m.born as born,
                            COLLECT(r.roles) as role ,
                            COLLECT(p.title)  as title,
                            COLLECT(type(r))  as rel skip {start} limit {limit}'''
            pageperson, summary, keys = con.execute_query(paginatepeople)
            # people
            return render_template('search.html', data=pageperson, count=len(people), search_term=search_term, pnPeople=pnPeople,
                                   pn=pn, moviedata=pagemovie, countmovie=len(movie))

    return render_template('search.html', data=[], count=0, search_term=search_term)


@app.route('/', methods=['GET'])
def index():
    if request.method == 'GET':
        with get_driver() as driver:
            records, summary, keys = driver.execute_query(
                "match(m:Movie) return m.title as title, m.released as released, m.img as img, m.tagline as tagline limit 6"
            )
        return render_template('index.html', data=records, count=len(records), key=keys)

# index


@app.route('/movies')
def movies():
    limit = 6
    page = int(request.args.get('page', 1))
    start = (page-1)*limit
    with get_driver() as driver:
        rec, summary, keys = driver.execute_query(
            f"match(m:Movie) return m.title as title, m.released as released, m.img as img, m.tagline as tagline, id(m) as id"
        )
        pn = Pagination(page=page, per_page=limit, total=len(
            rec), css_framework='tailwind')

        records, summary, keys = driver.execute_query(
            f'''match(m:Movie) return m.title as title, m.released as released, m.img as img, m.tagline as tagline , id(m) as id skip {
                start} limit {limit}'''
        )

    return render_template('movie/movies.html', data=records, pn=pn, count=len(rec))
# movies


@app.route('/director')
def director():
    limit = 6
    page = int(request.args.get('page', 1))
    start = (page-1)*limit
    with get_driver() as driver:
        rec, summary, keys = driver.execute_query(
            "match(p:Person)-[r:DIRECTED]-() return distinct p.name as name, p.born as born, id(p) as id"
        )
        pn = Pagination(page=page, per_page=limit, total=len(
            rec), css_framework='tailwind')
        records, summary, keys = driver.execute_query(
            f'''match(p:Person)-[r:DIRECTED]-() return distinct p.name as name, p.born as born, p.img as img, id(p) as id skip {
                start} limit {limit}'''
        )

    return render_template('person/director.html', data=records, count=len(rec), pn=pn)
# director`~`


@app.route('/writer')
def writer():
    limit = 6
    page = int(request.args.get('page', 1))
    start = (page-1)*limit
    with get_driver() as driver:
        rec, summary, keys = driver.execute_query(
            "match(p:Person)-[r:WROTE]-() return distinct p.name as name, p.born as born, id(p) as id"
        )

        pn = Pagination(page=page, per_page=limit, total=len(
            rec), css_framework='tailwind')
        records, summary, keys = driver.execute_query(
            f'''match(p:Person)-[r:WROTE]-() return distinct p.name as name, p.born as born, p.img as img, id(p) as id skip {
                start} limit {limit}'''
        )
    return render_template('person/writer.html', data=records, count=len(rec), pn=pn)
# writer


@app.route('/writer/<int:writer_id>')
def writer_detail(writer_id):
    with get_driver() as driver:
        writer, summary, keys = driver.execute_query(
            f'''MATCH(p:Person)-[:WROTE]-(m:Movie)
                    WHERE id(p)={writer_id}
                RETURN
                    p.name as name,
                    p.born as born,
                    COLLECT(m.title) as movie,
                    p.img as img
                '''
        )
    if writer is None:
        return "director not found", 404

    return render_template('person/writer_detail.html', person=writer[0])
# writer detail


@app.route('/acter')
def acter():
    limit = 6
    page = int(request.args.get('page', 1))
    start = (page-1)*limit
    with get_driver() as driver:
        rec, summary, keys = driver.execute_query(
            "match(p:Person)-[r:ACTED_IN]-() return distinct p.name as name, p.born as born"
        )

        pn = Pagination(page=page, per_page=limit, total=len(
            rec), css_framework='tailwind')

        records, summary, keys = driver.execute_query(
            f'''match(p:Person)-[r:ACTED_IN]-() return distinct p.name as name, p.born as born, p.img as img, id(p) as id skip {
                start} limit {limit}'''
        )
    return render_template('person/acter.html', data=records, pn=pn, count=len(rec))
# actor


@app.route('/acter/<int:acter_id>')
def acter_detail(acter_id):
    with get_driver() as driver:
        acter, summary, keys = driver.execute_query(
            f'''MATCH(p:Person)-[:ACTED_IN]-(m:Movie)
                    WHERE id(p)={acter_id}
                RETURN
                    p.name as name,
                    p.born as born,
                    COLLECT(m.title) as movies,
                    p.img as img
                '''
        )
    if acter is None:
        return "director not found", 404

    return render_template('person/acter_detail.html', person=acter[0])
# acter detail


@app.route('/movie/<int:movie_id>')
def movie_detail(movie_id):
    with get_driver() as driver:
        movie, summary, keys = driver.execute_query(
            f'''MATCH (m:Movie)
                    WHERE id(m) = {movie_id}
                    OPTIONAL MATCH (m)-[:ACTED_IN]-(cast:Person)
                    OPTIONAL MATCH (m)-[:DIRECTED]-(director:Person)
                    optional  MATCH (m)-[:WROTE]-(writer:Person)
                    optional  MATCH (m)-[r:REVIEWED]-(p:Person)
                RETURN
                    m.title AS title,
                    m.released AS released,
                    m.img AS img,
                    m.tagline AS tagline,
                    COLLECT(DISTINCT id(cast)) AS cast_id,
                    COLLECT(DISTINCT id(director)) AS director_id,
                    COLLECT(DISTINCT id(writer)) AS writer_id,
                    COLLECT(DISTINCT id(p)) AS review_id,
                    COLLECT(DISTINCT cast.name) AS cast,
                    COLLECT(DISTINCT director.name) AS director,
                    COLLECT(DISTINCT writer.name) AS writer,
                    COLLECT(DISTINCT r.summary) as review,
                    COLLECT(DISTINCT p.name) as reviewedPerson'''
        )
    if movie is None:
        return "Movie not found", 404

    return render_template('movie/movie_detail.html', movie=movie[0])
# movie detail


@app.route('/director/<int:director_id>')
def director_detail(director_id):
    with get_driver() as driver:
        director, summary, keys = driver.execute_query(
            f'''MATCH(p:Person)
                    WHERE id(p)={director_id}
                    OPTIONAL MATCH(p)-[:DIRECTED]-(director:Movie)
                    OPTIONAL MATCH(p)-[:WROTE]-(writer:Movie)
                    OPTIONAL MATCH(p)-[:ACTED_IN]-(acter:Movie)
                    OPTIONAL MATCH(p)-[:PRODUCED]-(producer:Movie)
                RETURN
                    p.name as name,
                    p.born as born,
                    p.img as img,
                    COLLECT(DISTINCT director.title) as dmovies,
                    COLLECT(DISTINCT writer.title) as wmovies,
                    COLLECT(DISTINCT acter.title) as amovies,
                    COLLECT(DISTINCT producer.title) as pmovies'''
        )
    if director is None:
        return "director not found", 404

    return render_template('person/director_detail.html', person=director[0])
# director detail


@app.route('/producer')
def producer():
    limit = 6
    page = int(request.args.get('page', 1))
    start = (page-1)*limit
    with get_driver() as driver:
        rec, summary, keys = driver.execute_query(
            "match(p:Person)-[r:PRODUCED]-() return distinct p.name as name, p.born as born"
        )

        pn = Pagination(page=page, per_page=limit, total=len(
            rec), css_framework='tailwind')

        records, summary, keys = driver.execute_query(
            f'''match(p:Person)-[r:PRODUCED]-() return distinct p.name as name, p.born as born, p.img as img, id(p) as id skip {
                start} limit {limit}'''
        )
    return render_template('person/producer.html', data=records, pn=pn, count=len(rec))
# producer


@app.route('/producer/<int:producer_id>')
def producer_detail(producer_id):
    with get_driver() as driver:
        producer, summary, keys = driver.execute_query(
            f'''MATCH(p:Person)
                    WHERE id(p)={producer_id}
                    OPTIONAL MATCH(p)-[:PRODUCED]-(m:Movie)
                RETURN
                    p.name as name,
                    p.born as born,
                    COLLECT(DISTINCT m.title) as movies,
                    p.img as img'''
        )
    if producer is None:
        return "director not found", 404

    return render_template('person/producer_detail.html', person=producer[0])
# producer detail


@app.route('/review')
def review():
    limit = 9
    page = int(request.args.get('page', 1))
    start = (page-1)*limit
    with get_driver() as driver:
        rec, summary, keys = driver.execute_query('''
                match(p:Person)-[r:REVIEWED]-(m:Movie)
                return
                    p.name as name,
                    p.born as born,
                    p.img as img,
                    COLLECT(DISTINCT r.summary) as summary,
                    COLLECT(DISTINCT r.rating) as rating,
                    COLLECT(DISTINCT m.title) as title'''
                                                  )
        pn = Pagination(page=page, per_page=limit, total=len(
            rec), css_framework='tailwind')

        records, summary, keys = driver.execute_query(
            f'''match(p:Person)-[r:REVIEWED]-(m:Movie)
                return
                    p.name as name,
                    p.born as born,
                    p.img as img,
                    COLLECT(DISTINCT r.summary) as summary,
                    COLLECT(DISTINCT r.rating) as rating,
                    COLLECT(DISTINCT m.title) as title
                skip {start} limit {limit}'''
        )
    return render_template('person/review.html', data=records, pn=pn, count=len(rec))
# review


if __name__ == '__main__':
    app.run(debug=True, port=3001)
