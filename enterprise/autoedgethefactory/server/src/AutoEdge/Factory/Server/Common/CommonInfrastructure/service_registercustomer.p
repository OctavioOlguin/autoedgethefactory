@openapi.openedge.export FILE(type="BPM", operationName="%FILENAME%", useReturnValue="false", writeDataSetBeforeImage="false", executionMode="external").
/** ------------------------------------------------------------------------
    File        : AutoEdge/Factory/Server/Common/CommonInfrastructure/service_registercustomer.p
    Purpose     : 

    Syntax      :

    Description : 

    @author pjudge
    Created     : Wed Mar 09 13:55:44 EST 2011
    Notes       :
  ----------------------------------------------------------------------*/
routine-level on error undo, throw.

using AutoEdge.Factory.Common.CommonInfrastructure.UserTypeEnum.
using OpenEdge.CommonInfrastructure.Common.ISecurityManager.
using OpenEdge.CommonInfrastructure.Common.SecurityManager.
using OpenEdge.CommonInfrastructure.Common.IServiceManager.
using OpenEdge.CommonInfrastructure.Common.ServiceManager.
using OpenEdge.CommonInfrastructure.Common.IUserContext.

using OpenEdge.Lang.String.
using OpenEdge.Lang.ABLSession.
using OpenEdge.Lang.Assert.
using Progress.Lang.Class.

/** -- params, defs -- **/
define input parameter pcBrand as character no-undo.
define input parameter pcCustomerName as character no-undo.
define input parameter pcUserName as character no-undo.
define input parameter pcPassword as character no-undo.
define input parameter pcCustomerEmail as longchar no-undo.

define output parameter piCustNum as integer no-undo.
define output parameter pcSalesRep as character no-undo.

define variable oServiceMgr as IServiceManager no-undo.
define variable oSecMgr as ISecurityManager no-undo.
define variable oContext as IUserContext no-undo.
define variable cUserName as character no-undo.
define variable cUserDomain as character no-undo.
define variable cUserPassword as character no-undo.

/** Dummy return for modelling purposes (Savvion lets us make a test call to a WebService). */
if pcBrand eq 'Savvion::Test' then
do:
    assign pcSalesRep = 'pcSalesRep'
           piCustNum = -1.
    return.
end.

/** -- validate defs -- **/
Assert:ArgumentNotNullOrEmpty(pcBrand, 'Brand').
Assert:ArgumentNotNullOrEmpty(pcUserName, 'Customer User Name').
Assert:ArgumentNotNullOrEmpty(pcPassword, 'Customer Password').
Assert:ArgumentNotNullOrEmpty(pcCustomerName, 'Customer name').
Assert:ArgumentNotNullOrEmpty(pcCustomerEmail, 'Customer Email').

/** -- main -- **/
oServiceMgr = cast(ABLSession:Instance:SessionProperties:Get(ServiceManager:IServiceManagerType), IServiceManager).

oSecMgr = cast(oServiceMgr:GetService(SecurityManager:ISecurityManagerType), ISecurityManager).

/* log in and establish tenancy, user context */
assign cUserName = 'admin'
       cUserDomain = substitute('&1.&2',
                        UserTypeEnum:System:ToString(),
                        pcBrand).
       cUserPassword = 'letmein'.
oSecMgr:UserLogin(cUserName, cUserDomain, cUserPassword).

@todo(task="implement", action="do something useful here").

error-status:error = no.
return.

/** -- error handling -- **/
{OpenEdge/CommonInfrastructure/Server/service_returnerror.i}
/** -- eof -- **/