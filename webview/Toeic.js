import React from 'react';
import ReactDOM from 'react-dom';
import ToeicPage from './components/ToeicPage';
import './style.scss';

const App = () => (
  <div>
    <ToeicPage />
  </div>
);

ReactDOM.render(<App />, document.getElementById('root'));

