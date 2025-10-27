@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Entity For Table Project FREDI Interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_TB_PROJECT
  as select from ztb_project
  composition [0..1] of ZR_TB_PROJECT_SUB as _ProjectSub
  composition [0..1] of ZR_TB_BUDGETCATE as _BudgetCate
{
  key uuidproject           as Uuidproject,
      projectnumber         as Projectnumber,
      projectname           as Projectname,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      _ProjectSub, // Make association public,
      _BudgetCate
}
