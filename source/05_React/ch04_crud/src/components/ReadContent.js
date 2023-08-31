import { Component } from 'react';

class ReadContent extends Component{
  render(){
    return(
      <article>
      <h2>{this.props.title}</h2>
      {this.props.desc}
      {/* 두개이상 작성시에는 외각의 큰태그로  */}
      </article>
    );
  }
}
export default ReadContent;