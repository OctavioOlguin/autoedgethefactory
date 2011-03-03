<!-- bizsolo generate="false" -->
<html xmlns:bizsolo="http://www.savvion.com/sbm/BizSolo" xmlns:sbm="http://www.savvion.com/sbm" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:xalan="http://xml.apache.org/xalan" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:sfe="http://www.savvion.com/sbm/sfe" xmlns:c="http://java.sun.com/jstl/core">
<head><META http-equiv="Content-Type" content="text/html; charset=utf-8">

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.savvion.BizSolo.Server.*,com.savvion.BizSolo.beans.*,java.util.Vector,java.util.Locale" %>
<%@ page errorPage="/BizSolo/common/jsp/error.jsp" %>
<%@ taglib uri="/BizSolo/common/tlds/bizsolo.tld" prefix="bizsolo" %>
<%@ taglib uri="/bpmportal/tld/bpmportal.tld" prefix="sbm" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sfe" uri="http://jmaki/v1.0/jsp" %>
  <jsp:useBean id="bizManage" class="com.savvion.sbm.bizmanage.api.BizManageBean" scope="session"></jsp:useBean>
  <jsp:useBean id="bean" class="com.savvion.BizSolo.beans.Bean" scope="session"></jsp:useBean>
  <jsp:useBean id="factoryBean" class="com.savvion.BizSolo.beans.EPFactoryBean" scope="session"></jsp:useBean>
  <jsp:useBean id="bizSite" class="com.savvion.sbm.bpmportal.bizsite.api.BizSiteBean" scope="session"></jsp:useBean>
<%! String _PageName = "SelectVehicleOptions"; %>
<%! String __webAppName = "CustomerVehicleOrderSubmit"; %>
<% pageContext.setAttribute( "contextPath", request.getContextPath()+"/"); %>

<title>SelectVehicleOptions</title>
<%boolean isStandaloneBS = (bizManage == null || bizManage.getName() == null || "".equals(bizManage.getName()) || bizManage.getLocale() == null);Locale myLocale = (!isStandaloneBS) ? bizManage.getLocale() : request.getLocale();%>
<!-- Javascript -->
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/initControls.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/customValidation.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/prototype.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/effects.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/scriptaculous.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/pwr.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/engine.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/cal.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/util.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/utilities.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/fvalidate/fValidate.config.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/fvalidate/fValidate.core.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/fvalidate/fValidate.lang-<%=myLocale.getLanguage()%><%=myLocale.getCountry()%>.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/fvalidate/fValidate.validators.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/fvalidate/pValidate.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/document.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/jscalendar/calendar.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/jscalendar/calendar-<%=myLocale.getLanguage() %>.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/jscalendar/calendar-setup-<%=myLocale.getLanguage() %>.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>dwr/interface/adapterDWR.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/utilities/utilities.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/container/container-min.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/connection/connection-min.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/resize/resize-beta-min.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/json/json-min.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/logger/logger-min.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/checkboxvalidation/SpryValidationCheckbox.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/confirmvalidation/SpryValidationConfirm.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/passwordvalidation/SpryValidationPassword.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/radiovalidation/SpryValidationRadio.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/selectvalidation/SpryValidationSelect.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/textareavalidation/SpryValidationTextarea.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/textfieldvalidation/SpryValidationTextField.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry//SpryEffects.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/ext/adapter/ext/ext-base.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/ext/ext-all.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/ext/PagingRowNumberer.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/BmViewport.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/WaitDialog.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/LoggerDialog.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/ResizableDialog.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/FormWidget.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/FormWidgetHandler.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/TransactionAjaxObject.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/BusinessObjectHandler.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/sbm.utils.js"></script>
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/fonts/fonts.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/resize/assets/skins/sam/resize.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/container/assets/skins/sam/container.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/logger/assets/skins/sam/logger.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/checkboxvalidation/SpryValidationCheckbox.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/confirmvalidation/SpryValidationConfirm.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/textareavalidation/SpryValidationTextarea.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/passwordvalidation/SpryValidationPassword.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/radiovalidation/SpryValidationRadio.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/selectvalidation/SpryValidationSelect.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/textfieldvalidation/SpryValidationTextField.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/ext/resources/css/ext-all.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/ext/resources/css/xtheme-default.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/css/theme01/bm-all.css">
<script language="JavaScript">
 Ext.BLANK_IMAGE_URL = '<c:out value='${contextPath}'/>bpmportal/javascript/ext/resources/images/default/s.gif';
	 
	  var isIFrame = <%= (PublicResources.INTERACTIVE_MODE.equalsIgnoreCase(bean.getPropString(PublicResources.MODE)) || PublicResources.SLAVE_MODE.equalsIgnoreCase(bean.getPropString(PublicResources.MODE))) ? true : false %>;
	  
<!--
    function AlertReassign()
    {
      if (document.form.elements['bizsite_assigneeName'].value == '' )
      {
        alert('Please provide assignee name!')
        document.form.elements['bizsite_assigneeName'].focus();
        return false;
      }
      else
      {
        return true;
      }
    }
    
    var uploadWnd;
    var param;
 
    function openDocAttWin( slotName,sesID, ptname, piname, docurl, docServer, readonly, ismultiline, appendwith, isStart )
    {
      param = 'bzsid=' + sesID;
      param += '&pt=' + ptname;
      param += '&pi=' + piname;
      param += '&ds=' + slotName;
      param += '&docurl=' + docurl;
      param += '&readonly=' + readonly;
      param += '&ismultiline=' + ismultiline;
      param += '&appendwith=' + appendwith;
      param += '&isPICreation=' + isStart;
      uploadWnd = openDocumentPresentation(docServer + '/BizSite.DocAttacher?' + param, isIFrame);
    }

    function setCheckBoxStyleForIE()
    {
      var isIE = (navigator.appName == "Microsoft Internet Explorer") ? 1 : 0;
      var w_Elements = document.getElementsByTagName("input");
      for ( i=0; i < w_Elements.length; ++i)
      {
          if(isIE && (w_Elements.item(i).getAttribute("type") == "checkbox" || w_Elements.item(i).getAttribute("type") == "radio"))
            w_Elements.item(i).className = "ChkBoxNone";
      }
    }
    
    function onSuccess() {
    }
    
    
   function editDecimal(element,pms,scale)
    {
    if(typeof element == 'string') element = document.getElementById(element);
	var id = element.getAttribute('id');
	if (element != null)
	{
	      var newurl = '<c:out value='${contextPath}'/>bpmportal/common/pop_decimal_dataslot.jsp?elementID=' + id + '&pms=' + pms + '&scale=' + scale + '&value=' + element.value;
	      
        MM_openBrWindow(newurl,'editdecimal','scrollbars=yes,resizable=yes,width=690,height=174');
	}
}
//-->
</script>

<bizsolo:link rel="stylesheet"></bizsolo:link>

<sbm:setLocale value="<%= bizManage.getLocale() %>"></sbm:setLocale>
<% try{ %><sbm:setBundle scope="page" basename="CustomerVehicleOrderSubmit/properties/CustomerVehicleOrderSubmit"></sbm:setBundle><% } catch(Exception e){}%>
<bizsolo:getApplicationResources baseName="CustomerVehicleOrderSubmit/properties/CustomerVehicleOrderSubmit"/></head>
<body class="apbody yui-skin-sam" onUnload="pwr.removePakBizSoloBeanFromCache('<%=session.getId()%>', onSuccess);" onLoad="setCheckBoxStyleForIE();hideControls();beforeInitControls();initControls();initTabs();sbm.utils.onDOMReady();">
<form method="post" name="form" onsubmit="return sbm.utils.onFormSubmit();">
<div id="northDiv"><bizsolo:xsrf/></div><% /* Workaround, activityName will disappear in the future */ %>
<% String activityName = bean.getPropString("workitemName"); %>
<div id="resultDiv">
<div style='visibility:hidden;display:none' class='vBoxClass' name='errors' id='errors'></div>
<input name="crtPage" type="hidden" value="SelectVehicleOptions"><input name="crtApp" type="hidden" value="CustomerVehicleOrderSubmit"><input name="activityMode" type="hidden" value="procReq"><input type="hidden" name="nextPage" value="Start.jsp">
<input name="_yahoo_flow_button" type="hidden" value=''>
<!-- Content --> 

    <div align="center" id="">
      <img border="0" id="imgAETFLogo" width="400" height="69" src="images/aetf_logo.png">
      <br clear="all">
<fieldset name="fsOptions">
        <legend><sbm:message key="SelectVehicleOptions.fieldset.fsOptions.label"></sbm:message></legend>
        <div align="center" id="">
          <font color="#008000" face="Segoe UI" size="4">
            <i>Please customise your vehicle by selecting additional options and accessories</i>
          </font>
        </div>
        <div align="left" id="">
          <br clear="all">
<div class="SbmTabSection" id="tabbedPane1">
<div style=""><div class="x-hide-display" id="tabbedPane1_Seat">

              <br clear="all">
<table align="left" cellpadding="0" cellspacing="0" class="(default)" id="table1" width="100%">
                <tbody>
                  <tr>
                    <td class="(default)" width="33%" rowspan="1" colspan="1" valign="top">
                      <fieldset name="Material">
                        <legend><sbm:message key="SelectVehicleOptions.fieldset.Material.label"></sbm:message></legend>
                        <sfe:widget name="sbm.radio" id="rsSeatMaterial" args="{'layout':'Vertical', 'readonly':false, 'disabled':false, 'validationType':'none', 'validation':{}, 'toolTip':'Savvion Radio widget.', 'tabOrder':'0'}" />

                      </fieldset>
                    </td>
                    <td class="(default)" width="33%" rowspan="1" colspan="1" valign="top">
                      <fieldset name="Interior">
                        <legend><sbm:message key="SelectVehicleOptions.fieldset.Interior.label"></sbm:message></legend>
                        <sfe:widget name="sbm.radio" id="rsInteriorColour" args="{'layout':'Vertical', 'readonly':false, 'disabled':false, 'validationType':'none', 'validation':{}, 'toolTip':'Savvion Radio widget.', 'tabOrder':'0'}" />

                      </fieldset>
                    </td>
                    <td class="(default)" width="33%" rowspan="1" colspan="1" valign="top">
                      <fieldset name="fsAccessories">
                        <legend><sbm:message key="SelectVehicleOptions.fieldset.fsAccessories.label"></sbm:message></legend>
                        <div align="center" id="">
                          <sfe:widget name="sbm.list" id="listAccessories" args="{'size':5, 'readonly':false, 'disabled':false, 'validationType':'none', 'validation':{}, 'toolTip':'Savvion List widget.', 'tabOrder':'0'}" />

                        </div>
                      </fieldset>
                    </td>
                  </tr>
                </tbody>
              </table>
              <br clear="all">
</div>
<div class="x-hide-display" id="tabbedPane1_Color">

              <table align="left" cellpadding="0" cellspacing="0" class="(default)" id="table2" width="100%">
                <tbody>
                  <tr>
                    <td class="(default)" width="33%" rowspan="1" colspan="1" valign="top">
                      <fieldset name="Exterior">
                        <legend><sbm:message key="SelectVehicleOptions.fieldset.Exterior.label"></sbm:message></legend>
                        <sfe:widget name="sbm.radio" id="rsExteriorColour" args="{'layout':'Vertical', 'readonly':false, 'disabled':false, 'validationType':'none', 'validation':{}, 'toolTip':'Savvion Radio widget.', 'tabOrder':'0'}" />

                      </fieldset>
                    </td>
                    <td class="(default)" width="33%" rowspan="1" colspan="1" valign="top">
                      <fieldset name="fSWheels">
                        <legend><sbm:message key="SelectVehicleOptions.fieldset.fSWheels.label"></sbm:message></legend>
                        <sfe:widget name="sbm.radio" id="rsWheels" args="{'layout':'Vertical', 'readonly':false, 'disabled':false, 'validationType':'none', 'validation':{}, 'toolTip':'Savvion Radio widget.', 'tabOrder':'0'}" />

                      </fieldset>
                    </td>
                    <td class="(default)" width="33%" rowspan="1" colspan="1" valign="top">
                      <fieldset name="fieldSet1">
                        <legend><sbm:message key="SelectVehicleOptions.fieldset.fieldSet1.label"></sbm:message></legend>
                        <sfe:widget name="sbm.radio" id="rsMoonroof" args="{'layout':'Vertical', 'readonly':false, 'disabled':false, 'validationType':'none', 'validation':{}, 'toolTip':'Savvion Radio widget.', 'tabOrder':'0'}" />

                      </fieldset>
                    </td>
                  </tr>
                </tbody>
              </table>
              <br clear="all">
</div>
</div>
</div>

        </div>
      </fieldset>
      

</div>
<!-- Footer -->

<div id="cmdDiv">
<table width="100%" cellpadding="0" align="center" cellspacing="0" border="0">
<tr align="center">
<td class="ApButtonDarkBg" width="63%">
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="ApBtnSpace">
<input type="submit" name="SB_Name" id="btn-complete" class="ApScrnButton" onMouseOver="this.className='ApScrnButtonHover';" onMouseOut="this.className='ApScrnButton';" onClick="clickedButton=this.name;this.onsubmit = new Function('return false');" value="<bizsolo:getLabel name='linkOptionsReviewSelection' type='LINK'/>"></td>
<td class="ApBtnSpace">
<input type="button" name="bizsite_reset" id="btn-reset" class="ApScrnButton" onMouseOver="this.className='ApScrnButtonHover';" onMouseOut="this.className='ApScrnButton';" onClick="sbm.utils.reset()" value="<bizsolo:getLabel name='RESET_LABEL' type='RESOURCE'/>"></td>
</tr>
</table>
</td>
</tr>
</table>
</div>

      <br clear="all">
<br clear="all">
</div>
  
                    <div id="resizablepanel" style="display:none">
                        <div class="hd">Alert Dialog</div>
                        <div class="bd"></div>
                        <div class="ft"></div>
                    </div> 
</div> 
<div id="southDiv"></div></form>
</body>

<script language="JavaScript">
<!--
function beforeInitControls() {
}
-->
</script>
<script language="JavaScript">
<!--
function userValidationJavascipt() {
  return true;
}
-->
</script>
<sbm:dataSources appName="CustomerVehicleOrderSubmit" appType="bizsolo">
</sbm:dataSources>
<script language="JavaScript">
<!---->
</script>
<!--Initialize extensible widgets.-->
<script language="JavaScript">
<!--
var allWidgets = [{widget:'rsSeatMaterial', bound:'true', editable:'true', type:'sbm.radio', source: {type:'DATASLOT', dataSlotName:'InteriorSeatMaterial', dataSlotType:'STRING'}, target:{type:'DATASLOT', dataSlotName:'SelectedSeatMaterial', dataSlotType:'STRING'}, dsType:'STRING', service:'false'},
{widget:'rsInteriorColour', bound:'true', editable:'true', type:'sbm.radio', source: {type:'DATASLOT', dataSlotName:'InteriorTrimColour', dataSlotType:'STRING'}, target:{type:'DATASLOT', dataSlotName:'SelectedTrimColour', dataSlotType:'STRING'}, dsType:'STRING', service:'false'},
{widget:'listAccessories', bound:'true', editable:'true', type:'sbm.list', source: {type:'DATASLOT', dataSlotName:'InteriorAccessories', dataSlotType:'STRING'}, target:{type:'DATASLOT', dataSlotName:'SelectedAccessories', dataSlotType:'LIST'}, dsType:'STRING', service:'false'},
{widget:'rsExteriorColour', bound:'true', editable:'true', type:'sbm.radio', source: {type:'DATASLOT', dataSlotName:'ExteriorColour', dataSlotType:'STRING'}, target:{type:'DATASLOT', dataSlotName:'SelectedExtColour', dataSlotType:'STRING'}, dsType:'STRING', service:'false'},
{widget:'rsWheels', bound:'true', editable:'true', type:'sbm.radio', source: {type:'DATASLOT', dataSlotName:'ExteriorWheels', dataSlotType:'STRING'}, target:{type:'DATASLOT', dataSlotName:'SelectedWheels', dataSlotType:'STRING'}, dsType:'STRING', service:'false'},
{widget:'rsMoonroof', bound:'true', editable:'true', type:'sbm.radio', source: {type:'DATASLOT', dataSlotName:'ExteriorMoonroof', dataSlotType:'STRING'}, target:{type:'DATASLOT', dataSlotName:'SelectedMoonroof', dataSlotType:'STRING'}, dsType:'STRING', service:'false'}
];
var businessObjects = [];
var formWidgetHandler;
sbm.utils.onDOMReady = function() {
YAHOO.util.Event.onDOMReady(function(){
formWidgetHandler = new FormWidgetHandler(allWidgets,{processName:'CustomerVehicleOrderSubmit',adapletCache:{'user':''}});
 });
 }
Ext.onReady(function(){
var tabs = new Ext.TabPanel({
    id:'tabbedPane1_tabpanel',
    renderTo:'tabbedPane1',
    activeTab: 0,
    cls:'auto-width-tab-strip',
    frame:true,
    plain:true,
    defaults:{autoHeight: true},
    items:[{    contentEl:'tabbedPane1_Seat',title:'Interior Options'
                     
                     }
                     ,
{    contentEl:'tabbedPane1_Color',title:'Exterior Options'
                     
                     }
                      ]});

});
         var viewport = new Bm.util.BmViewport('');
sbm.utils.onFormSubmit = function() {
         if(!formWidgetHandler.validateWidgets()) return false;
        try{
             if(!userValidationJavascipt()) return false;
             if(!sbm.utils.beforeFormSubmit('box+label')) return false;
         }catch(e){}
         document.form.action='<%=response.encodeURL("Start.jsp")%>';
         if(allWidgets.length > 0)formWidgetHandler.saveDataSlots();
         return true;
}
-->
</script>

</html>