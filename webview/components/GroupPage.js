import React from 'react';
import Header from './Header';
import GroupItem from './GroupItem';
import DateLabel from './DateLabel';
import ReportItem from './ReportItem';
import SegmentTab from './SegmentTab';

const GroupPage = () => (
  <div className='group-pgae'>
    <Header title={'리포트'}/>
    <DateLabel />
    <ReportItem title='코딩 포모도로' total='10' count='1'/>
    <ReportItem title='토익 포모도로' total='10' count='2'/>
    <SegmentTab />
  </div>
);

export default GroupPage;

