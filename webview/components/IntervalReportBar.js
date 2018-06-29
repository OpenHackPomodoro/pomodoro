import React from 'react';

const IntervalReportBar = ({ day, data, color, isWeekly}) => {
  const week = ['월', '화', '수', '목', '금'];
  const index = isWeekly ? 13 : 70;
  const cn = isWeekly ? 'week-count' : 'month-count';
  const style={height: (data/index*100) + '%', backgroundColor: color, width: '100%'}
  return (<div className='interval-bar'>
    <div className='month-outer'><div className='count' /><div style={style} className='month-inner'><div className={cn}>{data}</div></div></div>
            <div>{isWeekly ? week[day] : day+1+ '주'}</div>
          </div>
  )
};

export default IntervalReportBar;

