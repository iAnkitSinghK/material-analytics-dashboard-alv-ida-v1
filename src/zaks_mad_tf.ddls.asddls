@EndUserText.label: 'MAD -- Table Function'
define table function ZAKS_MAD_TF
with parameters p_m_group : matkl
returns {
  client : mandt;
  matnr : matnr;
  mtart : mtart;
  meins : meins;
  matkl : matkl;
  dispo : dispo;
  bearz : bearz;
  plant_procurement_type : abap.char(15);
  
}
implemented by method ZAKS_MAD_CL_AMDP=>get_mat_details;
