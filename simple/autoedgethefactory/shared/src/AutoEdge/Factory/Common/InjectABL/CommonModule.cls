/** ------------------------------------------------------------------------
    File        : CommonModule
    Purpose     : AutoEdge|TheFactory Shared bindings
    Syntax      : 
    Description : 
    Author(s)   : pjudge
    Created     : Wed Dec 01 16:15:19 EST 2010
    Notes       : 
  ----------------------------------------------------------------------*/
routine-level on error undo, throw.

using OpenEdge.CommonInfrastructure.Common.InjectABL.ManagerScopeEnum.

using OpenEdge.Core.InjectABL.Binding.Modules.InjectionModule.
using OpenEdge.Core.InjectABL.Binding.IBindingSyntax.

using Progress.Lang.Class.

class AutoEdge.Factory.Common.InjectABL.CommonModule inherits InjectionModule:
     
    constructor public CommonModule (  ):
        super ().
    end constructor.
    
    method override public void Load():
        /* Use local variables oBS as bug workaround */
        define variable oBindingSyntax as IBindingSyntax no-undo.
        define variable cName as character no-undo.
        
    end method.
    
end class.