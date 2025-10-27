@Metadata.allowExtensions: true
@EndUserText.label: 'PO Log'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_TB_PO_LOG_ITEM
  provider contract transactional_query
  as projection on ZR_TB_PO_LOG_ITEM
{
  key Purchaseorder,
  key Purchaseorderitem,
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
