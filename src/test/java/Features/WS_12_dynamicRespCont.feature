Feature: Array Match

  Scenario:
    * def act =
    """
{
  "per_page": 6,
  "total": 12,
  "ad": {
    "company": "StatusCode Weekly",
    "text": "A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things.",
    "url": "http://statuscode.org/"
  },
  "data": [
    {
      "last_name": "Bluth",
      "id": 1,
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/calebogden/128.jpg",
      "first_name": "George",
      "email": "george.bluth@reqres.in"
    },
    {
      "last_name": "Weaver",
      "id": 2,
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg",
      "first_name": "Janet",
      "email": "janet.weaver@reqres.in"
    },
    {
      "last_name": "Wong",
      "id": 3,
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/olegpogodaev/128.jpg",
      "first_name": "Emma",
      "email": "emma.wong@reqres.in"
    },
    {
      "last_name": "Holt",
      "id": 4,
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/marcoramires/128.jpg",
      "first_name": "Eve",
      "email": "eve.holt@reqres.in"
    },
    {
      "last_name": "Morris",
      "id": 5,
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/stephenmoon/128.jpg",
      "first_name": "Charles",
      "email": "charles.morris@reqres.in"
    },
    {
      "last_name": "Ramos",
      "id": 6,
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/bigmancho/128.jpg",
      "first_name": "Tracey",
      "email": "tracey.ramos@reqres.in"
    }
  ],
  "page": 1,
  "total_pages": 2
}
    """
    * def exp = ["George","Janet","Emma","Eve","Charles","Tracey"]
    * match $act.data[*].first_name == exp

    ##Gelen cevaptaki alanları tek tek kontrol ediyor. Burada Db'den değerleri çekip bir array de oluşturalbilir.
