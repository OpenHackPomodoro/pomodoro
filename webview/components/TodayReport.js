import React from 'react';

const TodayReport = ({ total, count }) => (
  <div className='today-container tab-container'>
    <div className='target-container'>
      <div>하루 목표 포모도로: 10개</div>
      <div>현재 달성한 포모도로: 3개</div>
    </div> 
    <div className='today-outer'>
      <div className='target-text'><span>Total<br />목표 달성률<br /></span>30%</div>
      <div className='today-inner' style={{width: '100%', height: '70%'}} /> 
    </div>
  </div>
);

export default TodayReport;

