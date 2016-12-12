select
  po.first_name,
  po.last_name,
  po.pay_option,
  cs.itm_start_dt,
  cs.itm_end_dt,
  cs.cycle_start_dt,
  cs.item_count,
  ct.*
from
  purchase_ord     po                                          join
  contr_schedule   cs on po.payment2contr_schedule = cs.objid  join
  contract         ct on cs.schedule2contract      = ct.objid
;
