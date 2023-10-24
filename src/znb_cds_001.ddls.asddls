@AbapCatalog.sqlViewName: 'ZNB_5073_V_001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds eğitimi 001'
define view znb_cds_001
  as select from ekko
    inner join   ekpo on ekko.ebeln = ekko.ebeln
    inner join   mara on mara.matnr = ekpo.matnr
    inner join   makt on  makt.matnr = mara.matnr
                      and makt.spras = $session.system_language
    inner join   lfa1 on lfa1.lifnr = ekko.lifnr
{
  ekpo.ebeln,
  ekpo.ebelp,
  ekpo.matnr,
  makt.maktx,
  ekpo.werks,
  ekpo.lgort,
  ekpo.meins,
  lfa1.lifnr,
  lfa1.adrnr,
  concat_with_space(lfa1.stras, lfa1.mcod3, 1) as satici_adresi

}
