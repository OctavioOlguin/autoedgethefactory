/** ------------------------------------------------------------------------
    File        : SaveRequest
    Purpose     : A request for committing data.
    Syntax      : 
    Description : 
    @author pjudge
    Created     : Tue Apr 27 15:04:55 EDT 2010
    Notes       : 
  ---------------------------------------------------------------------- */
routine-level on error undo, throw.

using OpenEdge.CommonInfrastructure.Common.ServiceMessage.TableRequestTypeEnum.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.ISaveRequest.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.ServiceRequest.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.SaveRequest.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.ServiceMessageActionEnum.

using OpenEdge.Core.Util.IObjectInput.
using OpenEdge.Core.Util.IObjectOutput.
using OpenEdge.Core.Util.IExternalizable.
using OpenEdge.Lang.Collections.ICollection.

class OpenEdge.CommonInfrastructure.Common.ServiceMessage.SaveRequest inherits ServiceRequest
        implements ISaveRequest, IExternalizable:

    /** Indicates whether and how the records being saved need to be updated from the tables that
        have been written */
    define public property RefreshPolicy as TableRequestTypeEnum no-undo
        get():
            if not valid-object(RefreshPolicy) then
                RefreshPolicy = TableRequestTypeEnum:None.
            
            return RefreshPolicy.
        end get. set.
    
    define public property TableNames as character extent no-undo get. set. 

    constructor public SaveRequest():
        /* default ctor required for serialization */
    end constructor.

    constructor public SaveRequest(input pcService as character):
        super(pcService, ServiceMessageActionEnum:SaveData).
    end constructor.
    
    constructor public SaveRequest(input pcMessageId as character,
                                   input pcService as character):
        super(pcMessageId, pcService, ServiceMessageActionEnum:SaveData).
    end constructor.

    constructor public SaveRequest(input pcService as character,
                                   input poMessageType as ServiceMessageActionEnum ):
        super (input pcService, input poMessageType).
    end constructor.
        
    constructor public SaveRequest(input pcMessageId as character,
                                   input pcService as character,
                                   input poActionType as ServiceMessageActionEnum ):
        super (input pcMessageId, input pcService, input poActionType).
    end constructor.

    method override public void WriteObject(input poStream as IObjectOutput):
        super:WriteObject(poStream).

        poStream:WriteCharArray(TableNames).
    end method.

    method override public void ReadObject(input poStream as IObjectInput):
        super:ReadObject(poStream).
        
        TableNames = poStream:ReadCharArray().
    end method.
    
end class.