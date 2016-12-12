select
  con.first_name      first_name,
  con.last_name       last_name,
  por.pay_option      account_category,
  prd.install_date    sim_activation_date,
  prd.serial_no       wallet_key
from
  site_part       prd                                                           join
  contr_itm       cit on prd.objid                    = cit.contr_itm2site_part join
  contr_schedule  csc on cit.contr_itm2contr_schedule = csc.objid               join
  purchase_ord    por on por.payment2contr_schedule   = csc.objid               join
  contract        ctr on ctr.objid                    = csc.schedule2contract   join
  contact         con on ctr.primary2contact          = con.objid
--where
--  prd.instance_name = '..'
;
