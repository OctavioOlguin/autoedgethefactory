/** ------------------------------------------------------------------------
    File        : TaskServiceInterface
    Purpose     : Decorates a Business Task with a Service Provider interface -
                  ie. exposes it as an external service.
    Syntax      : 
    Description : 
    @author pjudge
    Created     : Wed Jan 26 11:10:58 EST 2011
    Notes       : 
  ---------------------------------------------------------------------- */
routine-level on error undo, throw.

using OpenEdge.BusinessComponent.Task.IBusinessTask.
using OpenEdge.BusinessComponent.Task.BusinessTaskDecorator.

using OpenEdge.CommonInfrastructure.Common.ServiceMessage.ITaskRequest.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.IServiceMessage.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.IServiceProvider.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.IServiceRequest.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.IServiceResponse.
using OpenEdge.CommonInfrastructure.Common.IServiceMessageManager.
using OpenEdge.CommonInfrastructure.Common.ServiceMessageManager.
using OpenEdge.CommonInfrastructure.Common.IServiceManager.
using OpenEdge.CommonInfrastructure.Common.ServiceManager.

using OpenEdge.Lang.ABLSession.
using OpenEdge.Lang.Assert.
using Progress.Lang.Class.

class OpenEdge.BusinessComponent.Task.BusinessTaskServiceInterface inherits BusinessTaskDecorator
        implements IServiceProvider:
    
    define protected property SvcMgr as IServiceManager no-undo
        get():
            if not valid-object(SvcMgr) then
                /* fully-qualify type name since this propery and the type have the same name. */
                SvcMgr = cast(ABLSession:Instance:SessionProperties:Get(ServiceManager:IServiceManagerType), IServiceManager).
            return SvcMgr.                                   
        end get.
        private set.
    
    /** The ServiceMessageManager (SvcMsgMgr) is used plentifully; we keep it as a property so that
        we can get it whenever needed, without fuss. */
    define protected property SvcMsgMgr as IServiceMessageManager no-undo
        get():
            if not valid-object(SvcMsgMgr) then
                SvcMsgMgr = cast(SvcMgr:GetService(ServiceMessageManager:IServiceMessageManagerType), IServiceMessageManager).
            
            return SvcMsgMgr.
        end get.
        private set.

    /** The service for which this provider is currently servicing a request. */
	define public property Service as character no-undo get. set. 
	
	constructor public BusinessTaskServiceInterface(input poBusinessTask as IBusinessTask ):
		super (input poBusinessTask).
	end constructor.
	
	/** External method to dynamically set the service property via InjectABL */
    method public void SetService (input pcService as character):
        this-object:Service = pcService.
    end method.
    
	method public IServiceResponse extent ExecuteSyncRequest(input poRequest as IServiceRequest extent):
        define variable oResponse as IServiceResponse extent no-undo.
        define variable iMax as integer no-undo.
        define variable iLoop as integer no-undo.
        
        Assert:ArgumentIsType(poRequest, Class:GetClass('OpenEdge.CommonInfrastructure.Common.ServiceMessage.ITaskRequest')).
        
        iMax = extent(poRequest). 
        extent(oResponse) = iMax.
        
        do iLoop = 1 to iMax:
            oResponse[iLoop] = cast(PerformTask(cast(poRequest[iLoop], ITaskRequest)), IServiceResponse).
        end.
        
        return oResponse.
	end method.
	
    /** Services a request. The service or adapter will call ExecuteResponse() in the ServiceMessageManager
        once it's done with the request. The object that implements this interface will call back to
        the ServiceMessageManager when it is done and it's ready with a response (IServiceResponse).
        
        @param IServiceRequest[] The requests to service. */
    method public void ExecuteRequest(input poRequest as IServiceRequest extent):
        define variable oResponse as IServiceResponse extent no-undo.
        define variable iMax as integer no-undo.
        define variable iLoop as integer no-undo.
        
        Assert:ArgumentIsType(poRequest, Class:GetClass('OpenEdge.CommonInfrastructure.Common.ServiceMessage.ITaskRequest')).
        
        iMax = extent(poRequest). 
        extent(oResponse) = iMax.
        
        do iLoop = 1 to iMax:
            oResponse[iLoop] = cast(PerformTask(cast(poRequest[iLoop], ITaskRequest)), IServiceResponse).            
        end.
        
        SvcMsgMgr:ExecuteResponse(oResponse).
    end method.
    
end class.