import React from 'react';

const ReportItem = ({ index, title, total, count }) => {
  const cn = index === 1 ? 'report-inner-1 report-inner' : 'report-inner-2 report-inner';
  return (<div className='report-item'>
    <div className='report-title'>{title}</div>
    <div className='report-info'>
      <div className='report-outer'>
        <div className={cn} />
      </div>
      <div className='report-count'>{count}/{total}</div>
    </div>
  </div>
  )
};

export default ReportItem;

