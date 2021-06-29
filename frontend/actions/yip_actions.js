import * as APIUtil from "../util/yip_api_util";

export const ADD_YIP = "ADD_YIP";
export const ADD_YIPS = "ADD_YIPS";

export const receiveYip = (yip) => {
  return {
    type: ADD_YIP,
    yip,
  };
};

export const receiveYips = (yips) => {
  // if we used "payload" instead of "{yips, user}"
  // const {yips, user} = payload // would also create variables yips and user with the correct values
  // destructuring in js
  return {
    type: ADD_YIPS,
    yips,
  };
};

//thunk action creators
export const fetchYips = () => {
  return (dispatch) => {
    return APIUtil.fetchYips().then((yips) => {
      return dispatch(receiveYips(yips));
    });
  };
};

export const fetchUserYips = (id) => {
  
  return (dispatch) => {
    
    return APIUtil.fetchUserYips(id).then((yips) => {
      
      return dispatch(receiveYips(yips));
    });
  };
};

export const createYip = (yip) => {
  return (dispatch) => {
    return APIUtil.createYip(yip).then((newYip) => {
      return dispatch(receiveYip(newYip));
    });
  };
};
