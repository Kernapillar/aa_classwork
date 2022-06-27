import React from "react";

class Autocomplete extends React.Component {
    constructor(props) {
        super(props);
        this.state = {inputVal:""}
        this.autoCompUpdate = this.autoCompUpdate.bind(this);
        this.setInput = this.setInput.bind(this)

    }

    isMatching(word, input) {
        if (word.slice(0, input.length) === input) return true;
        return false
    }

    autoCompUpdate(e){
        this.setState({
            inputVal: e.target.value
        })
    }

    setInput(e) {
        this.setState({
            inputVal: e.target.innerText
        }
        )
    }

    render() {
        const matches = this.props.names.map((word) => {if (this.isMatching(word, this.state.inputVal)) {
            return <li key={word} onClick={this.setInput}>{word}</li>
        }})
        return(
            <>
                <input type="text" value={this.state.inputVal} onChange={this.autoCompUpdate}/>
                <ul>
                    {matches}
                </ul>
            </>
        )
    }


}

export default Autocomplete