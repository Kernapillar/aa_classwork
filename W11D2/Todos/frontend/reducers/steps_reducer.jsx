import { RECEIVE_STEP } from "../actions/steps_actions";
import { RECEIVE_STEPS } from "../actions/steps_actions";
import { REMOVE_STEP } from "../actions/steps_actions";

import { receiveStep } from "../actions/steps_actions";
import { receiveSteps } from "../actions/steps_actions";
import { removeStep } from "../actions/steps_actions";

const initialState = {
    1: { // this is the step with id = 1
      id: 1,
        title: 'walk to store',
          done: false,
            todo_id: 1
    },
    2: { // this is the step with id = 2
      id: 2,
        title: 'buy an egg for these trying times',
          done: true,
            todo_id: 1
    }
        // 3: { id: 3, title: 'buy an egg for these trying times', done: true, todo_id: 2 }

};

window.receiveSteps = receiveSteps
window.receiveStep = receiveStep
window.removeStep = removeStep

export const stepsReducer = (state = initialState, action) => {
  Object.freeze(state);
  const nextState = Object.assign({}, state);


  // debugger
  switch (action.type) {
    case RECEIVE_STEPS:
      action.steps.forEach((el) => {
        nextState[el.id] = el;
      });
      return (nextState)

    case RECEIVE_STEP:
      nextState[action.step.id] = action.step
      return (nextState)

    case REMOVE_STEP:
      delete nextState[action.id]
      return (nextState)

    default:
      return state;
  }


}