import React from 'react';
import IntervalReportBar from './IntervalReportBar';

const data = [
  {count: 3, color: '#ccc6f8'},
  {count: 9, color: '#feeed4'},
  {count: 10, color: '#fcddd8'},
  {count: 9, color: '#feeed4'},
  {count: 8, color: '#feeed4'},
];

const WeeklyReport = () => (
  <div className='week-container'>
    {data.map((item, index) => {
      return <IntervalReportBar isWeekly={true} day={index} data={item.count} color={item.color} key={index} />
    })}
  </div>
);

export default WeeklyReport;

