import { ADD_YIP, ADD_YIPS } from "../actions/yip_actions";

const yipsReducer = (state = {}, action) => {
  
  Object.freeze(state);
  switch (action.type) {
    case ADD_YIP:
      
      const newYip = action.yip;
      return Object.assign({}, state, {
        [newYip.id]: newYip,
      });
    case ADD_YIPS:
      
      const newYips = {};
      // action.yips.forEach((yip) => {
      //   newYips[yip.id] = yip;
      // });
      return action.yips
      // return newYips;
    default:
      return state;
  }
};

export default yipsReducer;
