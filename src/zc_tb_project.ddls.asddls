@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Project View For Project Table FREDI Interface'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_TB_PROJECT 
provider contract transactional_query
as projection on ZR_TB_PROJECT

{
    key Uuidproject,
    Projectnumber,
    Projectname,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _BudgetCate: redirected to composition child ZC_TB_BUDGETCATE,
    _ProjectSub: redirected to composition child ZC_TB_PROJECT_SUB
   
}
