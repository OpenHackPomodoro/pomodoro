import React from 'react';

const GroupItem =  ({ title, count, pomodoro }) => (
  <div className='group-item'>
    <div className='group-image' />
    <div className='group-info'>
      <div className='group-title-container'>
        <div>        {title}</div>
        <div>{count}</div>
      </div>
      <div className='group-pomodoro-count'>
        <span>
        {`${pomodoro}/10`}
        </span>
      </div>
    </div>
  </div>
)

export default GroupItem;

