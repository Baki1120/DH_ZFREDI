@AbapCatalog.sqlViewName: 'ZFREDIPOITEM'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO Items Transaction'
define view ZC_FREDI_PO_ITEM
  as select from I_PurchaseOrderItemAPI01 as PurchaseOrderItem

{
  key PurchaseOrderItem.PurchaseOrder,
  key PurchaseOrderItem.PurchaseOrderItem,
      PurchaseOrderItem.PurchaseOrderQuantityUnit,
      PurchaseOrderItem.OrderQuantity,
      PurchaseOrderItem.NetAmount,
      PurchaseOrderItem.DocumentCurrency,
      PurchaseOrderItem.PurchasingDocumentDeletionCode

}
