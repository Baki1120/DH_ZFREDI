@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity Budget Category'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_TB_BUDGETCATE as select from ztb_budgetcate
association to parent ZR_TB_PROJECT as _project on $projection.Uuidproject = _project.Uuidproject
{
    key uuidbudgetcate as Uuidbudgetcate,
    key uuidproject as Uuidproject,
    _project
}
