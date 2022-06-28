import React from 'react'
import * as Minesweeper from './minesweeper'
import Board from './board'

class Game extends React.Component {
 constructor(props) {
    super(props);
        this.state = {
            board: new Minesweeper.Board(10, 25),
            modal: "hide"
        }

        this.updateGame = this.updateGame.bind(this);
        this.playAgain = this.playAgain.bind(this);
    }

    updateGame(tileObj, flagging) {
        if (flagging){
            tileObj.toggleFlag()
        } else {
            tileObj.explore()
        }
        this.setState({
            board: this.state.board 
        })
        if (this.state.board.won()|| this.state.board.lost()){
            this.gameOver()
        }
    }

    gameOver(){
        const screen = document.getElementById('modal-screen')
        if(this.state.board.won()) {
            this.setState({modal: "show"})
        } else if(this.state.board.lost()) {
            this.setState({modal: "show"})
            
        }
    }

    playAgain(e) {
        e.preventDefault()
        console.log("playAgain")
        const newBoard = new Game()

        this.setState({
            board: new Minesweeper.Board(10, 25),
            modal: "hide"
        })
    }

    wonLost(){
        const screen = document.getElementById('modal-screen')
        if(this.state.board.won()) {
            return <div className="modal-content">You Won!</div>
        } else if(this.state.board.lost()) {
            return <div className='modal-content'>You Lost!
             <button onClick={this.playAgain}>Play Again</button>
             </div>
            
        }
    }


    render() {
        
        return (
            <>
                <h1>Minesweeper</h1>
                <div className={`modal-screen ${this.state.modal}`}> {this.wonLost()} </div> 
                <Board board={this.state.board} updateGame={this.updateGame} />
            </>
        )
    }

}

export default Game
