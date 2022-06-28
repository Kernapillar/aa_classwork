import React from "react";


class Tile extends React.Component {
    constructor(props){
        super(props)
        this.state = {
            class: "unexplored",
            show: ""
        }
        this.handleClick = this.handleClick.bind(this);
    }

    tileState() {
        const explored = this.props.tileObj.explored
        const bombed = this.props.tileObj.bombed
        const flagged = this.props.tileObj.flagged

        if (flagged) {
            this.setState({
                class: "flagged",
                show: "🚩"
            })
        } else if (bombed) {
            this.setState({
                class: "bombed",
                show: "💣"
            })
        } else if (explored) {
            if (this.props.tileObj.adjacentBombCount()=== 0 ) {
                this.setState({ class: "explored" }) 
            } else {
                this.setState({
                    class: "explored",
                    show: this.props.tileObj.adjacentBombCount()
                })
            }
        }

    }

    
    handleClick(e){
        let flagged = false;
        if (e.altKey) {
            flagged = true;
        }
        this.props.updateGame(this.props.tileObj, flagged)
    }

    render() {
        const tile = this.props.tileObj
        const explored = this.props.tileObj.explored
        const bombed = this.props.tileObj.bombed
        const flagged = this.props.tileObj.flagged

        let tileClass, text, count

        if(explored){
            if(bombed){
                tileClass = "bombed"
                text = "💣"
            } else {
                tileClass = "explored"
                count = tile.adjacentBombCount()
                text = (count > 0 ? `${count}` : "" );
            }
        } else if (tile.flagged) {

            tileClass = 'flagged';
            text =  "🚩";
          } else {
            tileClass = 'unexplored';
          }      
        return (
            <div onClick={this.handleClick} className={tileClass}>{text}</div>
        )
    }


}

export default Tile