@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'PO Log'
define root view entity ZR_TB_PO_LOG_ITEM
  as select from ztb_po_log_item as PurchaseOrderLog
{
  key purchaseorder         as Purchaseorder,
  key purchaseorderitem     as Purchaseorderitem,
  key logtype               as Logtype,
      send_date             as SendDate,
      send_time             as SendTime,
      cpi_msg               as CpiMsg,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt

}
