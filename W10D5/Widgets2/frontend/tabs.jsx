import React from "react";

class Tabs extends React.Component {
    constructor (props){
        super(props)
        this.state = {
            selectedIdx: 0
        }
    }



    render() {
        const titles = this.props.lyrics.map((lyric) => { return <h1>{lyric.title}</h1> })
        return (
            <>
                <ul>
                    {titles}

                </ul>
                <article> {this.props.lyrics[this.state.selectedIdx].content} </article>

            
            </>
    )}
}


export default Tabs;