import requests

#Naam van de room
WEBEX_ROOM = 'DEVASC_JONAS_VERMESEN_2SNE'
#API URL
url = 'https://webexapis.com/v1/rooms'
token = 'Uw auth token'

headers = {
 #token invullen 
 'Authorization': 'Bearer {}'.format(token),
 #shit opvragen in json format
 'Content-Type': 'application/json'
}
#JSON format om te verzenden
params={'title': WEBEX_ROOM}
#aanmaken van de room
res = requests.post(url, headers=headers, json=params)
# print to terminal
print(res.json())

session = requests.Session()

header = {
    'Authorization': 'Bearer {}'.format(token)
}

session.headers.update(header)

#vraag alle rooms op
rooms = session.get(url)
#parsen naar JSON
rooms_json = rooms.json()
#zoeken naar het ID van de juist aangemaakte room.
room_id = None
for i in rooms_json["items"]:
    if i["title"] == WEBEX_ROOM:
        room_id = i["id"]

#email van persoon om toe te voegen aan de aangemaakte room
person_email = 'wim.leppens@pxl.be'
#de Juiste api aanspreken
new_url = 'https://webexapis.com/v1/memberships'
headers01 = {
 'Authorization': 'Bearer {}'.format(token),
 'Content-Type': 'application/json'
}
#JSON voor wim toe te voegen aan de room
params01 = {'roomId': room_id, 'personEmail': person_email}
#Voeg wim toe
res = requests.post(new_url, headers=headers01, json=params01)
#print to terminal
print(res.json())
