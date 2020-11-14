import React, { Component } from 'react'
import MovieRow from './MovieRow.js'
import PersonRow from './PersonRow.js'
import './button.css';

class App extends React.Component {
    constructor(props) {
        super(props)
        this.state = {}
        
        this.searchMovies()
        // handles the Top-Rated Movies button click
        this.topRatedMovies = this.topRatedMovies.bind(this)
        // handles the Popular Movies button click
        this.popularMovies = this.popularMovies.bind(this)
        // handles the Upcoming Movies button click
        this.upcomingMovies = this.upcomingMovies.bind(this)
        // handles the Now Playing Movies button click
        this.nowPlayingMovies = this.nowPlayingMovies.bind(this)
        // handles the Popular People button click
        this.popularPeople = this.popularPeople.bind(this)
    }

    // Display Popular People by clicking the button Popular People
    async popularPeople() {
        // fetch movie data
        let getPopularPeople = await (await fetch(`https://api.themoviedb.org/3/person/popular?api_key=c99164fa43270779d9e3dc71c2f0ca9c&language=en-US&page=1`, {
            method: `GET`,
            headers: {
                'authorization': 'BaseAuth W1lcmxsa='
            }
        })).json();
        // keep person rows
        var personRows = []
        // keep person known for movies
        var personKnownForStats = []

        // loop through all the people
        getPopularPeople.results.forEach((person) => {
            // person profile src
            person.profile_src = "https://image.tmdb.org/t/p/w185" + person.profile_path
            // get all movies in which the actor has participated
            person.known_for.forEach((movie) => {
                if(movie.original_name != undefined && movie.original_name != "") {
                    personKnownForStats.push(movie.original_name)
                } else if (movie.original_title != undefined && movie.original_title != "") {
                    personKnownForStats.push(movie.original_title)
                }
                
            })

            let personRow = <PersonRow key={person.id} person={person} genre={personKnownForStats} />
            personRows.push(personRow)

            // clear array and take the next movie genres
            personKnownForStats = []
        })
        this.setState( { rows: personRows })
    };

    // Display Now Playing Movies by clicking the button Now Playing Movies
    async nowPlayingMovies() {
        // fetch movie data
        let nowPlayingMovies = await (await fetch(`https://api.themoviedb.org/3/movie/now_playing?api_key=c99164fa43270779d9e3dc71c2f0ca9c&language=en-US&page=1`, {
            method: `GET`,
            headers: {
                'authorization': 'BaseAuth W1lcmxsa='
            }
        })).json();
        // fetch movie genre list
        let genreList = await (await fetch(`https://api.themoviedb.org/3/genre/movie/list?api_key=c99164fa43270779d9e3dc71c2f0ca9c&language=en-US`, {
            method: `GET`,
            headers: {
                'authorization': 'BaseAuth W1lcmxsa='
            }
        })).json();
        /// keep movie rows
        var movieRows = []
        // keep movie genres
        var movieGenres = []

        // loop through all the movies
        nowPlayingMovies.results.forEach((movie) => {
            // trailer data
            let trailerData = null
            // movie poster src
            movie.poster_src = "https://image.tmdb.org/t/p/w185" + movie.poster_path
            // get all genres for a particular movie
            genreList.genres.forEach((genre) => {
                // push the genres in an array
                if (movie.genre_ids.includes(genre.id)) {
                    movieGenres.push(genre.name)
                }
            })

            let movieRow = <MovieRow key={movie.id} movie={movie} genre={movieGenres} trailerData={trailerData} />
            movieRows.push(movieRow)

            // clear array and take the next movie genres
            movieGenres = []
        })
        this.setState( { rows: movieRows })
    };

    // Display Latest Movies by clicking the button Latest Movies
    async upcomingMovies() {
        // fetch movie data
        let upcomingMovies = await (await fetch(`https://api.themoviedb.org/3/movie/upcoming?api_key=c99164fa43270779d9e3dc71c2f0ca9c&language=en-US&page=1`, {
            method: `GET`,
            headers: {
                'authorization': 'BaseAuth W1lcmxsa='
            }
        })).json();
        // fetch movie genre list
        let genreList = await (await fetch(`https://api.themoviedb.org/3/genre/movie/list?api_key=c99164fa43270779d9e3dc71c2f0ca9c&language=en-US`, {
            method: `GET`,
            headers: {
                'authorization': 'BaseAuth W1lcmxsa='
            }
        })).json();
        /// keep movie rows
        var movieRows = []
        // keep movie genres
        var movieGenres = []

        // loop through all the movies
        upcomingMovies.results.forEach((movie) => {
            // trailer data
            let trailerData = null
            // movie poster src
            movie.poster_src = "https://image.tmdb.org/t/p/w185" + movie.poster_path
            // get all genres for a particular movie
            genreList.genres.forEach((genre) => {
                // push the genres in an array
                if (movie.genre_ids.includes(genre.id)) {
                    movieGenres.push(genre.name)
                }
            })

            let movieRow = <MovieRow key={movie.id} movie={movie} genre={movieGenres} trailerData={trailerData} />
            movieRows.push(movieRow)

            // clear array and take the next movie genres
            movieGenres = []
        })
        this.setState( { rows: movieRows })
    };

    // Display Popular Movies by clicking the button Popular Movies
    async popularMovies() {
        // fetch movie data
        let popularMovies = await (await fetch(`https://api.themoviedb.org/3/movie/popular?api_key=c99164fa43270779d9e3dc71c2f0ca9c&language=en-US&page=1`, {
            method: `GET`,
            headers: {
                'authorization': 'BaseAuth W1lcmxsa='
            }
        })).json();
        // fetch movie genre list
        let genreList = await (await fetch(`https://api.themoviedb.org/3/genre/movie/list?api_key=c99164fa43270779d9e3dc71c2f0ca9c&language=en-US`, {
            method: `GET`,
            headers: {
                'authorization': 'BaseAuth W1lcmxsa='
            }
        })).json();
        /// keep movie rows
        var movieRows = []
        // keep movie genres
        var movieGenres = []

        // loop through all the movies
        popularMovies.results.forEach((movie) => {
            // trailer data
            let trailerData = null
            // movie poster src
            movie.poster_src = "https://image.tmdb.org/t/p/w185" + movie.poster_path
            // get all genres for a particular movie
            genreList.genres.forEach((genre) => {
                // push the genres in an array
                if (movie.genre_ids.includes(genre.id)) {
                    movieGenres.push(genre.name)
                }
            })

            let movieRow = <MovieRow key={movie.id} movie={movie} genre={movieGenres} trailerData={trailerData} />
            movieRows.push(movieRow)

            // clear array and take the next movie genres
            movieGenres = []
        })
        this.setState( { rows: movieRows })
    };

    // Display Top-Rated Movies by clicking the button Top-Rated Movies
    async topRatedMovies() {
        // fetch movie data
        let topRatedMovies = await (await fetch(`https://api.themoviedb.org/3/movie/top_rated?api_key=c99164fa43270779d9e3dc71c2f0ca9c&language=en-US&page=1`, {
            method: `GET`,
            headers: {
                'authorization': 'BaseAuth W1lcmxsa='
            }
        })).json();
        // fetch movie genre list
        let genreList = await (await fetch(`https://api.themoviedb.org/3/genre/movie/list?api_key=c99164fa43270779d9e3dc71c2f0ca9c&language=en-US`, {
            method: `GET`,
            headers: {
                'authorization': 'BaseAuth W1lcmxsa='
            }
        })).json();
        /// keep movie rows
        var movieRows = []
        // keep movie genres
        var movieGenres = []

        // loop through all the movies
        topRatedMovies.results.forEach((movie) => {
            // trailer data
            let trailerData = null
            // movie poster src
            movie.poster_src = "https://image.tmdb.org/t/p/w185" + movie.poster_path
            // get all genres for a particular movie
            genreList.genres.forEach((genre) => {
                // push the genres in an array
                if (movie.genre_ids.includes(genre.id)) {
                    movieGenres.push(genre.name)
                }
            })

            let movieRow = <MovieRow key={movie.id} movie={movie} genre={movieGenres} trailerData={trailerData} />
            movieRows.push(movieRow)

            // clear array and take the next movie genres
            movieGenres = []
        })
        this.setState( { rows: movieRows })
    };

    async searchMovies(searchQuery) {
        let data = await (await fetch(`https://api.themoviedb.org/3/search/movie?&api_key=c99164fa43270779d9e3dc71c2f0ca9c&query=` + searchQuery, {
            method: `GET`,
            headers: {
                'authorization': 'BaseAuth W1lcmxsa='
            }
        })).json();
        let genreList = await (await fetch(`https://api.themoviedb.org/3/genre/movie/list?api_key=c99164fa43270779d9e3dc71c2f0ca9c&language=en-US`, {
            method: `GET`,
            headers: {
                'authorization': 'BaseAuth W1lcmxsa='
            }
        })).json();
        
        var movieRows = []
        var movieGenres = []

        data.results.forEach((movie) => {
            // take the trailer data
            let trailerData = null
            // movie poster src
            movie.poster_src = "https://image.tmdb.org/t/p/w185" + movie.poster_path
            // get all genres for a particular movie
            genreList.genres.forEach((genre) => {
                // push the genres in an array
                if (movie.genre_ids.includes(genre.id)) {
                    movieGenres.push(genre.name)
                }
            })
            
            let movieRow = <MovieRow key={movie.id} movie={movie} genre={movieGenres} trailerData={trailerData} />
            movieRows.push(movieRow)

            // clear array and take the next movie genres
            movieGenres = []
        })
        this.setState( { rows: movieRows })
    };

    searchChangeHandler(event) {
        const boundObject = this
        const searchInput = event.target.value
        boundObject.searchMovies(searchInput)
    }


    render() {
        return (
            <div className="App">
                <div>

                    <input style={{
                        fontSize: 24,
                        display: 'block',
                        width: '25%',
                        marginLeft: 420
                    }}
                        onChange={this.searchChangeHandler.bind(this)}
                        placeholder="Enter movie name" />

                    {/* Show Top-Rated Movies Movies (by clicking) */}
                    <button className="btn btn_highlight" 
                            onClick={this.topRatedMovies}
                            style={{marginLeft: 20, 
                                    marginTop: 10}}
                            >Top-Rated Movies
                    </button>

                    {/* Show Popular Movies (by clicking) */}
                    <button className="btn btn_highlight" 
                            onClick={this.popularMovies}
                            style={{marginLeft: 20, 
                                    marginTop: 10}}
                            >Popular Movies
                    </button>

                    {/* Show Upcoming Movies (by clicking) */}
                    <button className="btn btn_highlight" 
                            onClick={this.upcomingMovies}
                            style={{marginLeft: 20, 
                                    marginTop: 10}}
                            >Upcoming Movies
                    </button>

                    {/* Show Now Playing Movies (by clicking) */}
                    <button className="btn btn_highlight" 
                            onClick={this.nowPlayingMovies}
                            style={{marginLeft: 20, 
                                    marginTop: 10}}
                            >Now Playing Movies
                    </button>

                    {/* Show Popular People (by clicking) */}
                    <button className="btn btn_highlight" 
                            onClick={this.popularPeople}
                            style={{marginLeft: 20, 
                                    marginTop: 10}}
                            >Popular People
                    </button>

                    {/* Pass and display movie rows */}
                    {this.state.rows}
                </div>
            </div>
        );
    }
}

export default App