import React from "react";


class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = {time: new Date()}
        this.tick = this.tick.bind(this);
    }

    parseDate(date) {
        return `${date.toLocaleTimeString()}`;
    }
    
    tick() {
        this.setState(
            {time: new Date()
        })
    }
    
    componentDidMount() {
        this.tickInterval = setInterval(this.tick, 1000);
    }
    componentWillUnmount() {
        clearInterval(this.tickInterval)
    }
    
    render() {
        return  <div id="clock">
                    <h1> Tick me baby 1 more time  </h1>
                    <h1>{this.parseDate(this.state.time)}</h1>
                </div>
    }
}
    
    
export default Clock;