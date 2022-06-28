import React from "react";
import Tile from "./tile";

class Board extends React.Component {
    constructor(props) {
        super(props)
    }

    render(){
        const grid = this.props.board.grid.map((row, rowIdx) => {
            return <div className="gridRow" key={rowIdx}>
                {row.map((tile, colIdx) => {
                    return <Tile key={colIdx} tileObj={tile} updateGame={this.props.updateGame} />
                })}
            </div>
        })
        // debugger
        return (
            <div className="grid">
                {grid}
            </div>
        )
    }
}

export default Board