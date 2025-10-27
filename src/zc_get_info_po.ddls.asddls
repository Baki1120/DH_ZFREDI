@AbapCatalog.sqlViewName: 'ZINFOPO'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO Information'
define view ZC_GET_INFO_PO
  as select from    I_PurchaseOrderItemAPI01       as PurchaseOrderItem
    inner join      I_PurOrdAccountAssignmentAPI01 as AccountAssignment on  PurchaseOrderItem.PurchaseOrder     = AccountAssignment.PurchaseOrder
                                                                        and PurchaseOrderItem.PurchaseOrderItem = AccountAssignment.PurchaseOrderItem

    left outer join I_ProfitCenterToWBSElement     as WBSElementData    on WBSElementData.WBSElementInternalID = AccountAssignment.WBSElementInternalID_2

{
  key PurchaseOrderItem.PurchaseOrder,
  key PurchaseOrderItem.PurchaseOrderItem,
  key AccountAssignment.AccountAssignmentNumber,
      PurchaseOrderItem.PurchaseOrderQuantityUnit,
      PurchaseOrderItem.OrderQuantity,
      PurchaseOrderItem.NetAmount,
      PurchaseOrderItem.DocumentCurrency,
      AccountAssignment.Quantity,
      AccountAssignment.GLAccount,
      AccountAssignment.Fund,
      AccountAssignment.FunctionalArea,
      AccountAssignment.GrantID,
      AccountAssignment.BudgetPeriod,
      WBSElementData.SourceWBSElementExternalID

}
