@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'MAD -- CDS View (I_Mat + TF)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zaks_mad_cds_imat_tf 
with parameters
    pr_m_group : matkl
as select from ZAKS_MAD_TF( p_m_group: $parameters.pr_m_group ) as tf
inner join I_Material as imat
on tf.matnr = imat.Material
{
    tf.matnr,
    tf.mtart,
    tf.meins,
    tf.matkl,
    tf.dispo,
    tf.bearz,
    tf.plant_procurement_type as plant_proc_typ,
    
    imat.MaterialType as m_typ,
    imat.MaterialBaseUnit as m_unit,
    @Semantics.quantity.unitOfMeasure: 'm_unit'
    imat.MaterialGrossWeight as m_gweight,
    imat.MaterialManufacturerNumber as m_mno
    
}
