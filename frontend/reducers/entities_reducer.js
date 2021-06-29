import yipsReducer from "./yips_reducer";
import usersReducer from "./users_reducer";

const entitiesReducer = (state = {}, action) => {
  // this reducer is just like another root reducer
  
  return {
    yips: yipsReducer(state.yips, action),
    users: usersReducer(state.users, action),
  };
};

export default entitiesReducer;
