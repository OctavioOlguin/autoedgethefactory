/** ------------------------------------------------------------------------
    File        : AssembleBody
    Purpose     : Work step for assembling the body
    Syntax      : 
    Description : 
    @author pjudge
    Created     : Tue Nov 30 16:36:24 EST 2010
    Notes       : 
  ---------------------------------------------------------------------- */
routine-level on error undo, throw.

using AutoEdge.Factory.Server.Build.BusinessComponents.VehicleBuildStep.
using AutoEdge.Factory.Server.Build.BusinessComponents.AssembleBody.

using OpenEdge.CommonInfrastructure.Common.IServiceManager.
using OpenEdge.CommonInfrastructure.Common.IComponentInfo.

class AutoEdge.Factory.Server.Build.BusinessComponents.AssembleBody inherits VehicleBuildStep:
        
    constructor public AssembleBody (input poComponentInfo as IComponentInfo):
        super (input poComponentInfo).
    end constructor.
    
    method override public void PerformStep():
        AssembleFloorPan().
        AssemblePillarsPanels().
        AssembleDoorsLids().
    end method.
    
    method protected void AssembleFloorPan():
        BuildStatus = substitute('Substep &1 [ STARTING ]', 'AssembleFloorPan').
        
        BuildStatus = substitute('Substep &1 [ OK ]', 'AssembleFloorPan').
    end method.
    
    method protected void AssemblePillarsPanels():
        BuildStatus = substitute('Substep &1 [ STARTING ]', 'AssemblePillarsPanels').
        
        BuildStatus = substitute('Substep &1 [ OK ]', 'AssemblePillarsPanels').
    end method.
    
    method protected void AssembleDoorsLids():
        BuildStatus = substitute('Substep &1 [ STARTING ]', 'AssembleDoorsLids').
        
        BuildStatus = substitute('Substep &1 [ OK ]', 'AssembleDoorsLids').
    end method.

end class.