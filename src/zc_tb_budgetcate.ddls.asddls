@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Project View For Budget Category Table FREDI Interface'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_TB_BUDGETCATE as projection on ZR_TB_BUDGETCATE
{
    key Uuidbudgetcate,
    key Uuidproject,
    /* Associations */
    _project:redirected to parent ZC_TB_PROJECT
}
