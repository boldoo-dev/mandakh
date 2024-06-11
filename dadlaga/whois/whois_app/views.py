from django.shortcuts import render
from django.http import JsonResponse
import json
from datetime import datetime
from django.views.decorators.csrf import csrf_exempt
from whois.settings import sendResponse, connectDB, disconnectDB


def index(request):
    return render(request, 'index.html', {'aichitsu': 'Hello world'})
# hamaaralgui


def gettime(request):
    ognoo = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    res = {"date": ognoo}
    return res
# gettime


def get_personal_details(request):
    jsons = json.loads(request.body)
    action = jsons['action']
    try:
        asuulttoo = jsons["asuulttoo"]
    except Exception as e:
        action = action
        data = [{"error": str(e) + " key error"}]
        result = sendResponse(404, data, action)
        return result
    try:

        myCon = connectDB()
        cursor = myCon.cursor()
        query = F"""SELECT  pid, fname, lname, headline, address, phone, email, linkedin, github, facebook, summary
                    FROM whois.t_person
                    ORDER BY random() LIMIT {asuulttoo}"""
        cursor.execute(query)
        columns = cursor.description
        respRow = [{columns[index][0]: column
                    for index, column in enumerate(value)} for value in cursor.fetchall()]

        cursor.close()
        disconnectDB(myCon)

        data = respRow
        result = sendResponse(200, data, action)
        return result
    except Exception as e:
        pass
# get_personal_details


@csrf_exempt
def home(request):
    if request.method == "POST":
        try:
            jsons = json.loads(request.body)
        except json.JSONDecodeError:
            action = "wrong json"
            data = []
            result = sendResponse(404, data, action)
            return JsonResponse(json.loads(result))
        if 'action' in jsons:
            action = jsons['action']
            if action == 'gettime':
                result = gettime(request)
                return JsonResponse(json.loads(result))
            elif action == "get_personal_details":
                result = get_personal_details(request)
                return JsonResponse(json.loads(result))
            else:
                action = "action not found"
                data = []
                result = sendResponse(404, data, action)
                return JsonResponse(json.loads(result))
        else:
            action = "no action"
            data = []
            result = sendResponse(404, data, action)
            return JsonResponse(json.loads(result))
    else:
        action = "method buruu"
        data = []
        result = sendResponse(405, data, action)
        return JsonResponse(json.loads(result))
