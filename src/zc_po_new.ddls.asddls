@AbapCatalog.sqlViewName: 'ZPONEW_N'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New PO'
define view ZC_PO_NEW
  with parameters
    p_dats : zdate
  as select from ZC_FREDI_PO      as FrediPurchaseOrder

    inner join   ZC_FREDI_PO_ITEM as FrediPurchaseOrderItem on  FrediPurchaseOrder.PurchaseOrder                      = FrediPurchaseOrderItem.PurchaseOrder
                                                            and FrediPurchaseOrderItem.PurchasingDocumentDeletionCode is initial

{
  key FrediPurchaseOrder.PurchaseOrder,
  key FrediPurchaseOrderItem.PurchaseOrderItem,
      FrediPurchaseOrderItem.OrderQuantity,
      FrediPurchaseOrderItem.PurchaseOrderQuantityUnit,
      FrediPurchaseOrderItem.NetAmount,
      FrediPurchaseOrderItem.DocumentCurrency,
      FrediPurchaseOrder.CreationDate,
      FrediPurchaseOrder.CreationTime,
      FrediPurchaseOrder.ChangeDate,
      FrediPurchaseOrder.ChangeTime,
      tstmp_to_dats( tstmp_current_utctimestamp(),
                     abap_system_timezone( $session.client,'NULL' ),
                     $session.client,
                     'NULL' ) as SendDate,
      tstmp_to_tims( tstmp_current_utctimestamp(),
      abap_system_timezone( $session.client,'NULL' ),
      $session.client,
      'NULL' )                as SendTime
}
where
  FrediPurchaseOrder.CreationDate >= $parameters.p_dats;
