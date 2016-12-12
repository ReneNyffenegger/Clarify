select 
  dtl.objid,
  sip.objid                      site_part_objid,
  dtl.request_type,
--dtl.dmnd_dtl_sts2gbst_elm, -- Status of the part request detail object 
  elm.title                     "Elm Status",
  dtl.closed,
  dtl.demand_qty,
  dtl.shipped_qty,
  dtl.serial_no,
  sip.serial_no                   sip_serial_no,
  dtl.details_date,
  dtl.next_date,
  sip.ship_date                  "SP ship date",
  sip.install_date               "SP install date",
  sip.level_to_part,
  sip.level_to_bin,
  sip.bin_objid,
  sip.part_status,
  sip.dir_site_objid,
--dtl.demand_dtl2site_part,  -- The installed part related to the request
  sip.instance_name,
  dtl.demand_dtl_owner2user,
  dtl.demand_dtl2condition,
  dtl.demand_dtl_wip2wipbin, -- WIPbin where the part request detail object currently resides 
  dtl.demand_dtl2part_info,  -- Part revision which was originally requested 
  dtl.detail_notes
from
  demand_dtl  dtl                                           left join
  gbst_elm    elm on dtl.dmnd_dtl_sts2gbst_elm = elm.objid  left join
  site_part   sip on dtl.demand_dtl2site_part  = sip.objid
--where
--  dtl.demand_dtl2demand_hdr = ...
order by
  dtl.details_date desc;
