import React from 'react';

const ReportItem = ({ title, total, count }) => (
  <div className='report-item'>
    <div className='report-title'>{title}</div>
    <div className='report-info'>
      <div className='report-outer'>
        <div className='report-inner' style={{width: `${count/total*100}%`}}/>
      </div>
      <div className='report-count'>{count}/{total}</div>
    </div>
  </div>
);

export default ReportItem;

