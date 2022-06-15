class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.board = this.setupBoard();
    this.el.appendChild(this.board);
    this.bindEvents();
    // this.handleClick.bind(this)
  }

  setupBoard() {
    // let figure = document.querySelector('figure')
    let ul = document.createElement('ul') 
    for (let i = 0; i < 9; i++) {
      let li = document.createElement('li')
      li.dataset.row = `${Math.floor(i/3)}`
      li.dataset.col = `${i%3}`
      ul.appendChild(li)
    }
    return ul
  }
  
  bindEvents() {
    this.el.addEventListener('click', this.handleClick.bind(this))
  }

  handleClick(e) {
    const li = e.target;
    if (this.game.currentPlayer === 'x'){
      li.classList.add("selectedX");
    } else {
      li.classList.add("selectedO");
    }
    this.makeMove(li);
  }
  
  makeMove(li) {
    let pos = [parseInt(li.dataset.row), parseInt(li.dataset.col)];
    li.innerText = this.game.currentPlayer;
    this.game.playMove(pos);
  }

}

module.exports = View;
