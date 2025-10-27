@AbapCatalog.sqlViewName: 'ZFREDIPO'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO Transaction'
define view ZC_FREDI_PO
  as select from I_PurchaseOrderAPI01 as PurchaseOrder

{
  key PurchaseOrder.PurchaseOrder,
      PurchaseOrder.CreationDate,
      tstmp_to_tims( PurchaseOrder.LastChangeDateTime,
                     abap_system_timezone( $session.client,'NULL' ),
                     $session.client,
                     'NULL' ) as CreationTime,
      tstmp_to_dats( PurchaseOrder.LastChangeDateTime,
                     abap_system_timezone( $session.client,'NULL' ),
                     $session.client,
                     'NULL' ) as ChangeDate,
      tstmp_to_tims( PurchaseOrder.LastChangeDateTime,
                     abap_system_timezone( $session.client,'NULL' ),
                     $session.client,
                     'NULL' ) as ChangeTime,
      PurchaseOrder.LastChangeDateTime
}
