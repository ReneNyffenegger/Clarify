select
   *
from 
  demand_hdr hdr join
  contact    con on hdr.attention2contact = con.objid
order by
  hdr.header_date;
