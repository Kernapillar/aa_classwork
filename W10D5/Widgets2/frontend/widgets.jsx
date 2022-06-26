import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock";
import Tabs from "./tabs"

document.addEventListener("DOMContentLoaded", ()=> {

    const root = document.getElementById('root');
    ReactDOM.render(<Main />, root)

})

class Main extends React.Component {
    render() {
        // const memes = [
        //    { someBody: "once told me"}, 
        //     {theWorld: "was gonna roll me"}, 
        //     {iAint: "the sharpest tool in the shed"}
        //      ];

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
        return (
            <>
                <div className="clock">
                    <Clock />
                </div>
                <div className="tabs">
                    <Tabs lyrics={memes} />
                </div>
                
            </>
        )
    }
}