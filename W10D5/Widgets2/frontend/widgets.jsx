import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock";
import Tabs from "./tabs"
import Autocomplete from "./autocomplete"

document.addEventListener("DOMContentLoaded", ()=> {

    const root = document.getElementById('root');
    ReactDOM.render(<Main />, root)

})

class Main extends React.Component {
    render() {

        const memes = [
            {
            title: "someBody",
            content: "once told me"
        },
        {
            title: "theWorld",
            content: "was gonna roll me"
        },
        {
            title: "iAint",
            content: "the sharpest tool in the shed"
        }
        ];

        const names = ["Adam", "Alec", "Alex", "Anthonie", "Charlie", "Evie", "Danny", "Cindy", "Lucy" ]
        return (
            <>
                <div className="clock">
                    <Clock />
                </div>
                {/* <div className="tabs">
                    <Tabs lyrics={memes} />
                </div> */}
                <div className="autocomplete">
                    <Autocomplete names={names}/>
                </div>
                
            </>
        )
    }
}