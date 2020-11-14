from tmdbv3api import TMDb
from tmdbv3api import Movie
from tmdbv3api import Discover

import mysql.connector

mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Password123@",
        database="movies"
    )

mycursor = mydb.cursor()

tmdb = TMDb()
tmdb.api_key = '05cc17ca0628a5f323435aca06f0a782'

tmdb.language = 'en'
tmdb.debug = True

movie = Movie()

discover = Discover()

for i in range(1, 10):
    
    movie = discover.discover_movies({
        'primary_release_date.gte': '2020-01-20',
        'primary_release_date.lte': '2020-07-18',
        'page': i
        })

    print(movie)
    for p in movie:
        print(p.id)
        print(p.title)
        print(p.overview)
        if p.poster_path:
            poster_path = "https://image.tmdb.org/t/p/w500" + p.poster_path
        else:
            poster_path = "NULL"
        print(p.release_date)
        sql = "INSERT INTO Movies (TITLE, OVERVIEW, POSTER, RELEASE_DATE) VALUES (%s, %s, %s, %s)"
        val = (p.title, p.overview, poster_path, p.release_date)
        mycursor.execute(sql, val)
        mydb.commit()
        print(mycursor.rowcount, "record inserted.")
