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


-- Hierarchy {

select /*+ parallel(16) */
   sp3.instance_name            sp3_instance_name,
   sp2.instance_name            sp2_instance_name,
   sp1.instance_name            sp1_instance_name,
   pn3.description              pn3_description,
   pn2.description              pn2_description,
   pn1.description              pn1_description,
   pn3.domain                   pn3_domain,
   pn2.domain                   pn2_domain,
   pn1.domain                   pn1_domain,
   pn3.family                   pn3_family,
   sp3.all_site_part2site       sp3_all_site_part2site
from 
  site_part sp3                                        join part_num pn3 on sp3.site_part2part_info = pn3.objid      join
  site_part sp2 on sp2.objid = sp3.site_part2site_part join part_num pn2 on sp2.site_part2part_info = pn2.objid      join
  site_part sp1 on sp1.objid = sp2.site_part2site_part join part_num pn1 on sp1.site_part2part_info = pn1.objid
order by
  sp3.all_site_part2site,
  sp1.objid,
  sp2.objid,
  sp3.objid;


-- }
