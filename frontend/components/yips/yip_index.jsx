import React from "react";

class YipIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchYips();
  }

  render() {
    if (this.props.yips.length == 0) {
      return <span>No yips yet!</span>;
    }

    const yipLis = this.props.yips.map((yip) => {
      return <li key={yip.id}>{yip.body}</li>;
    });

    return <ul className="yips">{yipLis}</ul>;
  }
}

export default YipIndex;
