import React from "react";

class YipForm extends React.Component {
  constructor(props) {
    
    super(props);

    this.state = { body: "" };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    
    return (e) => {
      
      this.setState({ [field]: e.target.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();

    this.props.createYip(this.state);
    this.setState({ body: "" });
  }

  render() {
    return (
      <>
        <h2 className="new-yip_header">Make a new yip!</h2>

        <form className="new-yip_form" onSubmit={this.handleSubmit}>
          <label htmlFor="yip-body">Body</label>
          <input
            type="text"
            id="yip-body"
            onChange={this.update("body")}
            value={this.state.body}
          />

          <button>Send it!</button>
        </form>
      </>
    );
  }
}
export default YipForm;
