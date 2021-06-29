import { connect } from "react-redux";
import YipIndex from "./yip_index";
import { fetchYips, fetchUserYips } from "../../actions/yip_actions";

const mapStateToProps = (state) => {
  
  return {
    yips: Object.values(state.entities.yips),
  };
};

const mapDispatchToProps = (dispatch) => {
  
  return {
    fetchYips: () => {
      
      return dispatch(fetchYips()); //thunk action creator from actions.js
    },
    fetchUserYips: (id) => {
      
      return dispatch(fetchUserYips(id)); //thunk action creator from actions.js
    },
  };
};
export default connect(mapStateToProps, mapDispatchToProps)(YipIndex);
