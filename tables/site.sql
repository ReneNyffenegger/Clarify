select
  objid,
  site_id,
  name,
  update_stamp,
  cust_primaddr2address,
  cust_billaddr2address,
  cust_shipaddr2address
from
  site
-- where
--   objid = ...
;
