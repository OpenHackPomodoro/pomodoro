import React from 'react';

const IntervalReportBar = ({ day, data, color, isWeekly}) => {
  const index = isWeekly ? 13 : 70;
  const style={height: (data/index*100) + '%', backgroundColor: color, width: '100%'}
  return (<div className='interval-bar'>
    <div className='month-outer'><div className='count' /><div style={style} className='month-inner'><div className='month-count'>{data}</div></div></div>
            <div>{day+1}주</div>
          </div>
  )
};

export default IntervalReportBar;

