import React from 'react';
import IntervalReportBar from './IntervalReportBar';

const data = [
  {count: 55, color: '#fcddd8'},
  {count: 44, color: '#feeed4'},
  {count: 32, color: '#feeed4'},
  {count: 60, color: '#fcddd8'},
  {count: 18, color: '#ccc6f8'},
];

const MonthlyReport = () => (
  <div className='month-container'>
    {data.map((item, index) => {
      return <IntervalReportBar day={index} data={item.count} color={item.color} key={index} />
    })}
  </div>
);

export default MonthlyReport;

