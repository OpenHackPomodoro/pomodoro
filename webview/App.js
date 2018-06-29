import React from 'react';
import ReactDOM from 'react-dom';
import GroupPage from './components/GroupPage';
import ReportItem from './components/ReportItem';
import './style.scss';

const App = () => (
  <div>
    <GroupPage />
  </div>
);

ReactDOM.render(<App />, document.getElementById('root'));

