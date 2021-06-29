import { connect } from "react-redux";

import { createYip } from "../../actions/yip_actions";
import YipForm from "./yip_form";

const mapStateToProps = (state) => {
  return {};
};

const mapDispatchToProps = (dispatch) => {
  return {
    createYip: (body) => {
      dispatch(createYip(body));
    },
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(YipForm);
