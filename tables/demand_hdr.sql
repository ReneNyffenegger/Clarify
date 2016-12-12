select
   *
from 
  demand_hdr hdr join
  contact    con on hdr.attention2contact = con.objid
order by
  hdr.header_date;



select
  hdr.objid,
  hdr.sequence_num, -- should indicate number of demand_dtl records for a demand_hdr record
  count(*)
from
  demand_hdr hdr join
  demand_dtl dtl on hdr.objid = dtl.demand_dtl2demand_hdr
group by
  hdr.objid,
  hdr.sequence_num
having
  hdr.sequence_num <> count(*);
