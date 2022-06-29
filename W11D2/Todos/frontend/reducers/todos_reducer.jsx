import { RECEIVE_TODO } from "../actions/todos_actions";
import { RECEIVE_TODOS } from "../actions/todos_actions";
import { REMOVE_TODO } from "../actions/todos_actions";
import { receiveToDo } from "../actions/todos_actions";
import { receiveToDos } from "../actions/todos_actions";
import { removeToDo } from "../actions/todos_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with dog",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with dog",
    done: true
  },
  3: {id: 3, title: "wash dog car", body: "with dog preferably in it", done: true }


};

window.receiveToDo = receiveToDo
window.receiveToDos = receiveToDos
window.removeToDo = removeToDo

export const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);


  // debugger
    switch (action.type) {
      case RECEIVE_TODOS:
        // return action.todos;
        action.todos.forEach((el) => {
          nextState[el.id] = el;
         });
         return nextState

      case RECEIVE_TODO:
        nextState[action.todo.id] = action.todo
        return(nextState)
    
      case REMOVE_TODO: 
        delete nextState[action.id]
        return(nextState)
        
      default:
        return state;
    }


}