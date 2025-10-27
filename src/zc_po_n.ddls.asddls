@AbapCatalog.sqlViewName: 'ZPONEW'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New PO'
define view ZC_PO_N
  with parameters
    p_dats : zdate,
    p_time : ztime
  as select from    ZC_FREDI_PO as FrediPurchaseOrder

    left outer join ztb_po_log  as PurchaseOrderLog on  FrediPurchaseOrder.PurchaseOrder =  PurchaseOrderLog.purchaseorder
                                                    and PurchaseOrderLog.logtype         =  'N'
                                                    and (
                                                       PurchaseOrderLog.send_date        >  FrediPurchaseOrder.CreationDate
                                                       or(
                                                         PurchaseOrderLog.send_date      =  FrediPurchaseOrder.CreationDate
                                                         and PurchaseOrderLog.send_time  >= FrediPurchaseOrder.CreationTime
                                                       )
                                                     )


{
  key FrediPurchaseOrder.PurchaseOrder,
      FrediPurchaseOrder.CreationDate,
      FrediPurchaseOrder.CreationTime,
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
  (
        PurchaseOrderLog.purchaseorder  is null
    and FrediPurchaseOrder.CreationDate > $parameters.p_dats
  )
  or(
        PurchaseOrderLog.purchaseorder  is null
    and FrediPurchaseOrder.CreationDate = $parameters.p_dats
    and FrediPurchaseOrder.CreationTime >= $parameters.p_time
  );
