/** ****************************************************************************
  Copyright 2012 Progress Software Corporation
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
    http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
**************************************************************************** **/
/** ------------------------------------------------------------------------
    File        : InvocationError
    Purpose     : 
    Syntax      : 
    Description : 
    @author pjudge
    Created     : Mon Apr 12 15:06:24 EDT 2010
    Notes       : 
  ---------------------------------------------------------------------- */
routine-level on error undo, throw.

using OpenEdge.Core.System.ApplicationError.
using Progress.Lang.Error.

class OpenEdge.Core.System.InvocationError inherits ApplicationError: 

    define override protected property ErrorText as longchar no-undo get. set. 
    define override protected property ErrorTitle as character no-undo get. set. 

    constructor public InvocationError(poInnerError as Error):
        super (poInnerError).        
                
        this-object:ErrorTitle = 'Invocation Error'.
        this-object:ErrorText = 'Cannot invoke &1 on class &2'.
    end constructor.
    
    constructor public InvocationError(poErr as Error,
                                       pcArgs1 as char,
                                       pcArgs2 as char):
        this-object(poErr).
        
        AddMessage(pcArgs1, 1).
        AddMessage(pcArgs2, 2).
    end constructor.

    constructor public InvocationError(pcArgs1 as char,
                                       pcArgs2 as char):
        this-object().
        
        AddMessage(pcArgs1, 1).
        AddMessage(pcArgs2, 2).
    end constructor.
    
    constructor public InvocationError():
        define variable oUnknown as Error no-undo.
        this-object(oUnknown).
    end constructor.
    
end class.