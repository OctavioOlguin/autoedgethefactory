/** ------------------------------------------------------------------------
    File        : VehicleOptionsEntity
    Purpose     : 
    Syntax      : 
    Description : 
    @author pjudge
    Created     : Thu Jan 20 14:01:28 EST 2011
    Notes       : 
  ---------------------------------------------------------------------- */
routine-level on error undo, throw.

using OpenEdge.BusinessComponent.Entity.StandardBusinessEntity.
using OpenEdge.DataAccess.IDataAccess.
using OpenEdge.CommonInfrastructure.Common.IServiceManager.
using OpenEdge.CommonInfrastructure.Common.IComponentInfo.
using OpenEdge.CommonInfrastructure.Common.ServiceMessage.IFetchRequest.

class AutoEdge.Factory.Server.Order.BusinessComponent.VehicleOptionsEntity inherits StandardBusinessEntity:

    /* Each eVehicle is an Item, actually */
    define temp-table eVehicle no-undo before-table eVehicleBefore
        field Brand as character
        field ItemId as character
        field VehicleName as character
        field Description as character
        field Price as decimal
        field VehicleType as character
        index idx1 as primary unique ItemId
        .
    
    define temp-table eItem no-undo before-table eItemBefore
        field ItemId as character
        field ItemNum as integer
        field ItemName as character
        field ItemType as character
        field Description as character
        field Price as decimal
        index idx1 as primary unique ItemNum
        .
    
    define temp-table eItemOption no-undo before-table eItemOptionBefore
        field ItemId as character
        field ItemNum as integer
        field ChildItemId as character
        field ChildItemNum as integer
        field ChildType as character
        field Quantity as decimal
        field StandardOption as logical
        index idx2 ChildItemNum
        .
    
    define dataset dsVehicleOptions for eVehicle, eItem, eItemOption
        /* get the options for the vehicles */
        data-relation for eVehicle, eItemOption relation-fields (ItemId, ItemId)
        /* single-level series of items and options */
        data-relation for eItemOption, eItem relation-fields (ChildItemId, ItemId)
        .

    define override protected property DatasetHandle as handle no-undo        
        get():
            if not valid-handle(DatasetHandle) then
               DatasetHandle = dataset dsVehicleOptions:handle.
               
            return DatasetHandle.
        end get.
        set.    

    constructor public VehicleOptionsEntity(input poComponentInfo as IComponentInfo ):
        super (input poComponentInfo).
    end constructor.

    constructor public VehicleOptionsEntity ( input poComponentInfo as IComponentInfo, input poDAO as IDataAccess ):
        super (input poComponentInfo, input poDAO).
    end constructor.

    method protected void BindReceivedDataset( input dataset dsVehicleOptions bind):
        /* no body needed. the parameter passing does what we need. */
    end method.

    method override protected void ReceiveDataset(input phDataset as handle):
        BindReceivedDataset(dataset-handle phDataset).
    end method.
end class.