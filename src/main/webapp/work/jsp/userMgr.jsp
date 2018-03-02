<%-- 
    Document   : userMgr
    Created on : 26/02/2018, 11:37:50 AM
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
    final SWBDataSource productDS = engine.getDataSource("Product");
    
    final String suri = request.getParameter("suri");
    final DataObject prdDO = productDS.fetchObjById(suri);

%>
        <script type="text/javascript">
            var usrId = '<%=suri%>';
            var usrFrm;
            usrFrm = eng.createForm({
                ID:"usrMgr"
                ,title:"Usuario"
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
                    {name: "login"},
                    {name: "email"},
                    {name: "roles", colSpan: 3, width: "100%"},
                    {name: "groups", colSpan: 3, width: "100%"}
                ]
                ,links: [
                    {name: "person", title: "Datos de Perfil", type: "Person", stype: "subForm", dataSource: "Person"}
                ]
            }, usrId, "User");
        </script>
    </body>
</html>
