/*------------------------------------------------------------------------
    File        : OpenEdge/CommonInfrastructure/Server/as_deactivate.p
    Purpose     : AppServer deactivation procedure 

    Syntax      :

    Description : 

    @author pjudge
    Created     : Fri Jun 04 16:23:45 EDT 2010
    Notes       :
  ----------------------------------------------------------------------*/
routine-level on error undo, throw.

using OpenEdge.CommonInfrastructure.Common.IServiceManager.
using OpenEdge.CommonInfrastructure.Common.ServiceManager.
using OpenEdge.CommonInfrastructure.Server.ISecurityManager.
using OpenEdge.CommonInfrastructure.Common.SecurityManager.
using OpenEdge.Lang.ABLSession.
using OpenEdge.Lang.AgentRequest.

using Progress.Lang.Class.
 
define variable oServiceMgr as IServiceManager no-undo.

oServiceMgr = cast(ABLSession:Instance:SessionProperties:Get(ServiceManager:IServiceManagerType), IServiceManager).

cast(oServiceMgr:GetService(SecurityManager:ISecurityManagerType), ISecurityManager):EndSession().

oServiceMgr:Kernel:Clear(AgentRequest:Instance).

delete object AgentRequest:Instance.

/* eof */