/** ------------------------------------------------------------------------
    File        : ServiceMessageActionEnum
    Purpose     : Enumerates types of service messages (requests).
    Syntax      : 
    Description : 
    @author hdaniels
    Created     : Sat Feb 20 03:38:25 EST 2010
    Notes       : 
  ---------------------------------------------------------------------- */
routine-level on error undo, throw.

using OpenEdge.CommonInfrastructure.Common.ServiceMessage.ServiceMessageActionEnum.
using OpenEdge.Lang.EnumMember.

class OpenEdge.CommonInfrastructure.Common.ServiceMessage.ServiceMessageActionEnum inherits EnumMember: 
    
/* Business Component (entity/task/workflow) Actions */
    /** Data fetch request */
    define public static property FetchData as ServiceMessageActionEnum no-undo get. private set.
    
    /** Data commit/save request */
    define public static property SaveData as ServiceMessageActionEnum no-undo get. private set.
    
    /** Schema fetch request. This is typically only made to a Business Entity. */
    define public static property FetchSchema as ServiceMessageActionEnum no-undo get. private set.

    /** Acknowledge receipt of request */
    define public static property ACK as ServiceMessageActionEnum no-undo get. private set.
    /** Service message is a BusinessTask request. */
    define public static property PerformTask as ServiceMessageActionEnum no-undo get. private set.
    
    /** Service message is a Workflow workstep request. */
    define public static property PerformWorkStep as ServiceMessageActionEnum no-undo get. private set.
    
    /** Service message is a Workflow request. */
    define public static property PerformWorkFlow as ServiceMessageActionEnum no-undo get. private set.
    
    @todo(task="refactor", action="split security manager, workflow actions into their own enums? ").
/* Security Manager Actions */
    /** Action is a user login */
    define public static property UserLogin as ServiceMessageActionEnum no-undo get. private set.

    /** Action is a user logout */
    define public static property UserLogout as ServiceMessageActionEnum no-undo get. private set.
    
    /** Validate that the user token belongs to a valid session */
    define public static property EstablishSession as ServiceMessageActionEnum no-undo get. private set.
    
    constructor static ServiceMessageActionEnum():
        /* business entities */
        ServiceMessageActionEnum:FetchData       = new ServiceMessageActionEnum('FetchData').
        ServiceMessageActionEnum:SaveData        = new ServiceMessageActionEnum('SaveData').
        ServiceMessageActionEnum:FetchSchema     = new ServiceMessageActionEnum('FetchSchema').
        /* business tasks */
        ServiceMessageActionEnum:PerformTask     = new ServiceMessageActionEnum('PerformTask').
        /* workflow */
        ServiceMessageActionEnum:PerformWorkStep = new ServiceMessageActionEnum('PerformWorkStep').  
        ServiceMessageActionEnum:PerformWorkFlow = new ServiceMessageActionEnum('PerformWorkFlow').
        ServiceMessageActionEnum:ACK             = new ServiceMessageActionEnum('ACK').
        
        /* ISecurityManager */
        ServiceMessageActionEnum:UserLogin = new ServiceMessageActionEnum('UserLogin').
        ServiceMessageActionEnum:UserLogout = new ServiceMessageActionEnum('UserLogout').
        ServiceMessageActionEnum:EstablishSession = new ServiceMessageActionEnum('EstablishSession').
    end method.
    
    constructor public ServiceMessageActionEnum(pcName as character):
        super(pcName).
    end constructor.
    
    method static public ServiceMessageActionEnum EnumFromString(pcAction as character):
        define variable oMember as ServiceMessageActionEnum no-undo.
        
        case pcAction:
            when ServiceMessageActionEnum:FetchData:ToString() then oMember = ServiceMessageActionEnum:FetchData.
            when ServiceMessageActionEnum:SaveData:ToString() then oMember = ServiceMessageActionEnum:SaveData.
            when ServiceMessageActionEnum:FetchSchema:ToString() then oMember = ServiceMessageActionEnum:FetchSchema.
            when ServiceMessageActionEnum:PerformTask:ToString() then oMember = ServiceMessageActionEnum:PerformTask.
            
            when ServiceMessageActionEnum:ACK:ToString() then oMember = ServiceMessageActionEnum:ACK.
            
            when ServiceMessageActionEnum:PerformWorkFlow:ToString() then oMember = ServiceMessageActionEnum:PerformWorkFlow.
            when ServiceMessageActionEnum:PerformWorkFlow:ToString() then oMember = ServiceMessageActionEnum:PerformWorkFlow.
            
            when ServiceMessageActionEnum:UserLogin:ToString() then oMember = ServiceMessageActionEnum:UserLogin.
            when ServiceMessageActionEnum:UserLogout:ToString() then oMember = ServiceMessageActionEnum:UserLogout.
            when ServiceMessageActionEnum:EstablishSession:ToString() then oMember = ServiceMessageActionEnum:EstablishSession.
        end case.
        
        return oMember.
    end method.
    
end class.