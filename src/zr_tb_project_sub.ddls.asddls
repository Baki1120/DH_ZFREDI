@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Entity For Table Project FREDI Interface'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
    }
define  view entity ZR_TB_PROJECT_SUB as select from ztb_project_sub
association to parent ZR_TB_PROJECT as _project on $projection.Uuidproject = _project.Uuidproject
{
    key uuidprojectsub as Uuidprojectsub,
    key uuidproject as Uuidproject,
    _project // Make association public
}
