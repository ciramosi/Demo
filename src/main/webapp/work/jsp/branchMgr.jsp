<%-- 
    Document   : branchMgr
    Created on : 26/02/2018, 12:17:24 PM
    Author     : carlos.ramos
--%>
<%@page import="org.semanticwb.datamanager.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iWise</title>
        <link rel="stylesheet" type="text/css" href="/static/css/styles.css">
        
        <script src="/platform/js/eng.js" type="text/javascript"></script>
        <script src="/static/js/f.js" type="text/javascript"></script>
        <script type="text/javascript">
            eng.initPlatform("/work/jsp/datasources.js", false);
        </script>
    </head>
    <body>
<%
    final DataObject user = (DataObject) session.getAttribute("_USER_");
    SWBScriptEngine engine = DataMgr.initPlatform("/work/jsp/datasources.js", session);
    final SWBDataSource branchDS = engine.getDataSource("Branch");
    
    final String suri = request.getParameter("suri");
    final DataObject branchDO = branchDS.fetchObjById(suri);
    if(branchDO!=null)
    {
%>
        <script type="text/javascript">
            var branchId = '<%=suri%>';
            var branchFrm;
            branchFrm = eng.createForm({
                ID:"branchMgr"
                ,title:"Sucursal"
                ,top: 10, width: "95%", height: "*"
                ,numCols: 4
                ,titleOrientation: "left"
                ,showTabs: true
                ,autoFocus: true
                ,baseStyle: "boxedGridCellCyan"
                ,canAdd: true
                ,canEdit: true
                ,canRemove: true
                //,titleSuffix: ":"
                //,requiredTitleSuffix: "<span style='color:#DE3163'>*</span>:</B>"
                ,fields: [
                    {name: "number"}
                    ,{name: "branchName"}
                    ,{name: "branchKey"}
                    ,{name: "phone"}
                ]
                ,links: [
                    {name: "address", title: "Dirección", stype: "subForm", dataSource: "Address", required: true}
                ]
            }, branchId, "Branch");
        </script>
<%
    }
    else
    {
%>
        <script type="text/javascript">
            isc.Label.create({
                height: 30,
                padding: 10,
                align: "center",
                valign: "center",
                wrap: false,
                icon: "/platform/isomorphic/skins/Simplicity/images/actions/cancel.png",
                showEdges: true,
                contents: "<h3>No se tiene referencia de una <i>sucursal</i></h3>"
            });
        </script>
<%
    }
%>

    </body>
</html>
