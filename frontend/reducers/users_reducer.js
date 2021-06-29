import { ADD_YIP, ADD_YIPS } from "../actions/yip_actions";

const usersReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case ADD_YIP:
      return Object.assign({}, state, action.user);
    case ADD_YIPS:
      
      return Object.assign({}, state, action.user);
    default:
      return state;
  }
};

export default usersReducer;
