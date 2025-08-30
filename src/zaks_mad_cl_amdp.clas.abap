CLASS zaks_mad_cl_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_amdp_marker_hdb.
    CLASS-METHODS get_mat_details FOR TABLE FUNCTION zaks_mad_tf.
ENDCLASS.



CLASS zaks_mad_cl_amdp IMPLEMENTATION.
  METHOD get_mat_details BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY USING mara marc.
    RETURN
        select
            m.mandt as client,
            m.matnr,
            m.mtart,
            m.meins,
            m.matkl,
            c.dispo,
            c.bearz,
            case
                when c.beskz <> '' then
                concat( c.werks,concat( '-', c.beskz ) )
                else
                concat( c.werks, concat( '-', '*PT NA*' ) )
                end as plant_procurement_type

           from mara as m inner join marc as c
           on m.matnr = c.matnr
           where m.matkl = :p_m_group;

  ENDMETHOD.

ENDCLASS.
