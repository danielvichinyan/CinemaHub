import React from 'react'
import './button.css';

class MovieRow extends React.Component {
    // Open the TMDB Page of a movie (new tab)
    viewMovie() {
        const url = "https://www.themoviedb.org/movie/" + this.props.movie.id
        window.open(url, "_blank")
    }

    // Open the YouTube trailer page of a movie (new tab)
    viewTrailer() {
        const url = "https://www.youtube.com/results?search_query=" + this.props.movie.title + " Movie Trailer"
        window.open(url, "_blank")
    }   

    render() {
        return <table key={this.props.movie.id}>
            <tbody>
                <tr>
                    <td>
                        {/* Movie Poster */}
                        <img 
                            alt="poster" 
                            src={this.props.movie.poster_src} 
                            style={{
                                width: 160,
                                borderRadius: 6,
                                marginTop: 10,
                                marginLeft: 20,
                                marginBottom: 12,
                                marginRight: 10
                            }}/>
                    </td>

                    <td>
                        {/* Movie Title */}
                        <h3 style={{marginTop: 23}}>{this.props.movie.title}</h3>
                        {/* Movie Genres */}
                        <p>{this.props.genre.join(", ")}</p>
                        {/* Movie Release Date */}
                        <p>({this.props.movie.release_date})</p>
                        <hr className="new1" />
                        {/* Movie Average Rating */}
                        <h6>Rating: {this.props.movie.vote_average}/10</h6>
                        {/* Movie Overview */}
                        <p>{this.props.movie.overview}</p>
                        {/* View TMDB Button */}
                        <input  type="button" 
                                onClick={this.viewMovie.bind(this)} 
                                value="View TMDB" 
                                className="btn btn_highlight"
                                style={{
                                    marginRight: 10
                                }} />
                        {/* View Trailer Button */}
                        <input  type="button" 
                                onClick={this.viewTrailer.bind(this)} 
                                value="View Trailer"
                                className="btn btn_dark" />
                    </td>
                </tr>
            </tbody>
        </table>
    }
}

export default MovieRow