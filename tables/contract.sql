select
  ct.objid,
  ct.first_name,
  ct.last_name,
  cr.objid                 contract_objid,
  cr.type,
  cr.title                 contract_title,
  cr.contract2condition,
  co.title                 condition,
  cs.*
from
  contract        cr                                              join
  contact         ct on cr.primary2contact     = ct.objid         join
  condition       co on cr.contract2condition  = co.objid    left join
  contr_schedule  cs on cs.schedule2contract   = ct.objid 
where
  ct.objid in (806082119, 538227567)
order by
  ct.objid
; 
