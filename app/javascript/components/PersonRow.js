import React from 'react'
import './button.css';

class PersonRow extends React.Component {

    render() {
        return <table key={this.props.person.id}>
            <tbody>
                <tr>
                    <td>
                        {/* Person Profle */}
                        <img 
                            alt="poster" 
                            src={this.props.person.profile_src} 
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
                        {/* Person Name */}
                        <h3 style={{marginTop: 23}}>{this.props.person.name}</h3>
                        {/* Famous For */}
                        <p>Movies:<br /><strong>{this.props.genre.join(", ")}</strong></p>
                        {/* Movie Release Date */}
                        <p>{this.props.person.known_for_department}</p>
                        <hr className="new1" />
                        {/* Person Popularity */}
                        <h6>Popularity: {this.props.person.popularity}</h6>
                    </td>
                </tr>
            </tbody>
        </table>
    }
}

export default PersonRow