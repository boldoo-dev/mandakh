from flask import Flask, render_template, request, jsonify, redirect
from neo4j import GraphDatabase
import os
from flask_cors import CORS
from flask_paginate import Pagination, get_page_parameter

app = Flask(__name__)
CORS(app)


MOVIE_IMG = os.path.join('static', 'movies')

app.config['UPLOAD_FOLDER'] = MOVIE_IMG
file_path = os.path.join(app.config['UPLOAD_FOLDER'], 'bold')


URI = 'bolt://localhost:7687'
AUTH = ('neo4j', 'admin123')


def get_driver():
    return GraphDatabase.driver(uri=URI, auth=AUTH)


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

            print(f'############################3{movieYear}')

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

    return render_template('search.html', data=[], count=0, search_term=search_term
                           )


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
            f"match(m:Movie) return m.title as title, m.released as released, m.img as img, m.tagline as tagline"
        )
        pn = Pagination(page=page, per_page=limit, total=len(
            rec), css_framework='tailwind')

        records, summary, keys = driver.execute_query(
            f'''match(m:Movie) return m.title as title, m.released as released, m.img as img, m.tagline as tagline  skip {
                start} limit {limit}'''
        )

    return render_template('movies.html', data=records, pn=pn, count=len(rec))
# movies


@app.route('/director')
def director():
    limit = 6
    page = int(request.args.get('page', 1))
    start = (page-1)*limit
    with get_driver() as driver:
        rec, summary, keys = driver.execute_query(
            "match(p:Person)-[r:DIRECTED]-() return distinct p.name as name, p.born as born"
        )
        pn = Pagination(page=page, per_page=limit, total=len(
            rec), css_framework='tailwind')
        records, summary, keys = driver.execute_query(
            f'''match(p:Person)-[r:DIRECTED]-() return distinct p.name as name, p.born as born, p.img as img skip {
                start} limit {limit}'''
        )

    return render_template('director.html', data=records, count=len(rec), pn=pn)
# director


@app.route('/writer')
def writer():
    limit = 6
    page = int(request.args.get('page', 1))
    start = (page-1)*limit
    with get_driver() as driver:
        rec, summary, keys = driver.execute_query(
            "match(p:Person)-[r:WROTE]-() return distinct p.name as name, p.born as born"
        )

        pn = Pagination(page=page, per_page=limit, total=len(
            rec), css_framework='tailwind')
        records, summary, keys = driver.execute_query(
            f'''match(p:Person)-[r:WROTE]-() return distinct p.name as name, p.born as born, p.img as img skip {
                start} limit {limit}'''
        )
    return render_template('writer.html', data=records, count=len(rec), pn=pn)
# writer


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
            f'''match(p:Person)-[r:ACTED_IN]-() return distinct p.name as name, p.born as born, p.img as img skip {
                start} limit {limit}'''
        )
    return render_template('acter.html', data=records, pn=pn, count=len(rec))
# actor


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
            f'''match(p:Person)-[r:PRODUCED]-() return distinct p.name as name, p.born as born, p.img as img skip {
                start} limit {limit}'''
        )
    return render_template('producer.html', data=records, pn=pn, count=len(rec))
# actor


@app.route('/review')
def review():
    limit = 9
    page = int(request.args.get('page', 1))
    start = (page-1)*limit
    with get_driver() as driver:
        rec, summary, keys = driver.execute_query(
            '             match(p:Person)-[r:REVIEWED]-(m:Movie) return distinct p.name as name, r.summary as summary,r.rating as rating, m.title as title'
        )
        pn = Pagination(page=page, per_page=limit, total=len(
            rec), css_framework='tailwind')

        records, summary, keys = driver.execute_query(
            f'''match(p:Person)-[r:REVIEWED]-(m:Movie) return distinct p.name as name, r.summary as summary,r.rating as rating, m.title as title skip {
                start} limit {limit}'''
        )
    return render_template('review.html', data=records, pn=pn, count=len(rec))
# review


if __name__ == '__main__':
    app.run(debug=True, port=3001)
