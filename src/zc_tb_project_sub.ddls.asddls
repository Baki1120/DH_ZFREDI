@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Project View For Sub Project Table FREDI Interface'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_TB_PROJECT_SUB as projection on ZR_TB_PROJECT_SUB
{
    key Uuidprojectsub,
    key Uuidproject,
    /* Associations */
    _project: redirected to parent ZC_TB_PROJECT
}
