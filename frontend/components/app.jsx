import React from "react";
import { Provider } from "react-redux";

import YipFormContainer from "./yips/yip_form_container";
import YipIndexContainer from "./yips/yip_index_container";

const App = ({ store }) => {
  return (
    <Provider store={store}>
      <>
        <YipFormContainer />
        <YipIndexContainer />
      </>
    </Provider>
  );
};
export default App;
