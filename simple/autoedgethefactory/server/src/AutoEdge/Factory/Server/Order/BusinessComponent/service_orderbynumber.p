@openapi.openedge.export FILE(type="BPM", operationName="%FILENAME%", useReturnValue="false", writeDataSetBeforeImage="false", executionMode="external").
/*------------------------------------------------------------------------
    File        : AutoEdge/Factory/Server/Order/BusinessComponent/service_orderbynumber.p
    Purpose     :

    Syntax      :

    Description :

    Author(s)   : pjudge
    Created     : Tue Aug 03 16:40:47 EDT 2010
    Notes       :
  ----------------------------------------------------------------------*/
routine-level on error undo, throw.

using OpenEdge.CommonInfrastructure.Common.ServiceMessage.ITableRequest.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.TableRequest.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.IFetchRequest.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.FetchRequest.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.IServiceRequest.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.IServiceResponse.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.IServiceMessage.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.ServiceMessageActionEnum.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.TableRequestTypeEnum.

using OpenEdge.CommonInfrastructure.Server.ISecurityManager.
using OpenEdge.CommonInfrastructure.Common.SecurityManager.
using OpenEdge.CommonInfrastructure.Common.IServiceManager.
using OpenEdge.CommonInfrastructure.Common.ServiceManager.
using OpenEdge.CommonInfrastructure.Common.IServiceMessageManager.
using OpenEdge.CommonInfrastructure.Common.ServiceMessageManager.
using OpenEdge.CommonInfrastructure.Common.IUserContext.
using OpenEdge.CommonInfrastructure.Common.UserContext.
using OpenEdge.CommonInfrastructure.Common.Service.

using OpenEdge.Core.System.IQueryDefinition.
using OpenEdge.Lang.DataTypeEnum.
using OpenEdge.Lang.OperatorEnum.
using OpenEdge.Lang.JoinEnum.
using OpenEdge.Lang.ABLSession.
using OpenEdge.Lang.Assert.
using OpenEdge.Lang.String.
using Progress.Lang.Class.

/** -- params, defs -- **/
/* AETF info */
define input parameter piOrderNumber as integer extent no-undo.
define input parameter pcContextId as character no-undo.

/* return */
define output parameter dataset-handle phOrders.

define variable oServiceMessageManager as IServiceMessageManager no-undo.
define variable oServiceMgr as IServiceManager no-undo.
define variable oSecMgr as ISecurityManager no-undo.
define variable oRequest as IFetchRequest extent 1 no-undo.
define variable oResponse as IServiceResponse extent no-undo.

/** -- functions -- **/
function BuildFetchRequest returns IFetchRequest extent (input piOrderNum as integer extent):
    define variable oTableRequest as ITableRequest no-undo.
    define variable oFetchRequest as IFetchRequest extent 1 no-undo.
    define variable cTableName as character no-undo.
    define variable oResponse as IServiceResponse extent no-undo.
    define variable iLoop as integer no-undo.
    define variable iMax as integer no-undo.

    oFetchRequest[1] = new FetchRequest('Order', ServiceMessageActionEnum:FetchData).

    cTableName = 'eOrder'.
    oTableRequest = new TableRequest(cTableName).
    oFetchRequest[1]:TableRequests:Put(cTableName, oTableRequest).
    iMax = extent(piOrderNum).
    do iLoop = 1 to iMax:
        cast(oTableRequest, IQueryDefinition):AddFilter(cTableName,
                                              'OrderNum',
                                              OperatorEnum:IsEqual,
                                              new String(string(piOrderNum[iLoop])),
                                              DataTypeEnum:Integer,
                                              JoinEnum:Or).
    end.
    
    return oFetchRequest.
end function.

/** -- validate defs -- **/
Assert:ArgumentNotZero(piOrderNumber[1], 'Order Number').
Assert:ArgumentNotNullOrEmpty(pcContextId, 'User Context Id').

/** -- main -- **/
oServiceMgr = cast(ABLSession:Instance:SessionProperties:Get(ServiceManager:IServiceManagerType), IServiceManager).

/* Are we who we say we are? Note that this should really happen on activate. activate doesn't run for state-free AppServers */
oSecMgr = cast(oServiceMgr:GetService(SecurityManager:ISecurityManagerType), ISecurityManager).
oSecMgr:EstablishSession(pcContextId).

oServiceMessageManager = cast(oServiceMgr:GetService(ServiceMessageManager:IServiceMessageManagerType)
                        , IServiceMessageManager).

oResponse = oServiceMessageManager:ExecuteRequest(cast(BuildFetchRequest(piOrderNumber), IServiceRequest)).

if oResponse[1]:HasError then
    return error string(oResponse[1]:ErrorText).

cast(oResponse[1], IServiceMessage):GetMessageData(output phOrders).

error-status:error = no.
return.

/** -- error handling -- **/
{OpenEdge/CommonInfrastructure/Server/service_returnerror.i}
/** -- eof -- **/