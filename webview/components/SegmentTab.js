import React from 'react';
import TodayReport from './TodayReport';
import MonthlyReport from './MonthlyReport';
import WeeklyReport from './WeeklyReport';
import { BrowserRouter as Router, NavLink, Route } from 'react-router-dom';

const SegmentTab = () => (
  <Router>
    <div>
      <div className='stat-label'>통계</div>
      <Route path='/' exact component={TodayReport} />
      <Route path='/week' component={WeeklyReport} />
      <Route path='/month' component={MonthlyReport} />
      <div className='tab-container'>
        <NavLink exact to='/'>오늘</NavLink>
        <NavLink exact to='/week'>이번주</NavLink>
        <NavLink exact to='/month'>이번달</NavLink>
      </div>
    </div>
  </Router>
)

export default SegmentTab;

