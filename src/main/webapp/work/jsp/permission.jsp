<%-- 
    Document   : permission
    Created on : 23/02/2018, 11:32:38 AM
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
    SWBScriptEngine engine = DataMgr.initPlatform("/datasources.js", session);
%>
        
        <div>
            <h3>Grupo de Permisos de Usuario</h3>
            <script type="text/javascript">
                var profileGrid;            
                profileGrid = eng.createGrid({
                    ID: "profileDvr",
                    title: "Perfiles de usuario",
                    top: 10, width:"90%", height:"250", alternateRecordStyles:true, cellHeight:"32",
                    titleOrientation: "top",
                    autoFocus: true,
                    showRollOverCanvas: false,
                    showRollUnderCanvas: false,
                    showRowNumbers: true,
                    baseStyle: "boxedGridCellCyan",
                    //editEvent: "click",
                    //editByCell: false,
                    canAdd: true,
                    canEdit: true,
                    canRemove: true,
                    showFilter: false,
                    //sortDirection: "descending",
                    //sortFieldNum: 3,ssss
                }, "Profile");
            </script>
            
            <h3>Permisos de Usuario</h3>
            <script type="text/javascript">
                var permissionGrid;            
                permissionGrid = eng.createGrid({
                    ID: "permissionDvr",
                    title: "Permisos de usuario",
                    top: 0, width:"90%", height:"600", alternateRecordStyles:true, cellHeight:"32",
                    titleOrientation: "top",
                    autoFocus: true,
                    showRollOverCanvas: false,
                    showRollUnderCanvas: false,
                    showRowNumbers: true,
                    baseStyle: "boxedGridCellCyan",
                    cellHeight: 24,
                    //editEvent: "click",
                    //editByCell: false,
                    canAdd: true,
                    canEdit: true,
                    canRemove: true,
                    showFilter: true,
                    //sortDirection: "ascending",
                    //sortFieldNum: 0,
                    fields:[
                        {name:"profile", width: 150},
                        {name:"name", width: 150},
                        {name:"description"},
                        {name:"roles", width: 200}
                    ]
                }, "Permission");
            </script>
        </div>
                
    </body>
</html>
