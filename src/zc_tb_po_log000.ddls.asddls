@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_TB_PO_LOG000
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TB_PO_LOG000
{
  key Purchaseorder,
  key Logtype,
  SendDate,
  SendTime,
  CpiMsg,
  CreatedBy,
  CreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
