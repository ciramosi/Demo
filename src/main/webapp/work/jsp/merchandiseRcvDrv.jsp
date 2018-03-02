<%-- 
    Document   : merchandiseRcvDrv
    Created on : 26/02/2018, 01:06:02 PM
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
            <script type="text/javascript">
                var merRcvGrid;            
                merRcvGrid = eng.createGrid({
                    ID: "merRcvDvr",
                    title: "Mis campañas",
                    top: 10, width:"90%", height:"400", alternateRecordStyles:true, cellHeight:"32",
                    titleOrientation: "top",
                    autoFocus: true,
                    showRollOverCanvas: false,
                    showRollUnderCanvas: false,
                    baseStyle: "boxedGridCellCyan",
                    //editEvent: "click",
                    //editByCell: false,
                    canAdd: true,
                    canEdit: true,
                    canRemove: true,
                    showFilter: true,
                    sortDirection: "ascending",
                    sortFieldNum: 1,
                    fields: [
                        {name: "number", width: 100},
                        {name: "supplier"},
                        {name: "purchaseOrder", stype: "select", dataSource: "PurchaseOrder"},
                        {name: "status", width: 100, canEdit: false}
                    ],
                    recordDoubleClick: function(grid, record) {
                        window.location.href='/work/merchandiseRcvMgr?suri='+record._id;
                        return false;
                    }
                }, "MerchandiseRcv");
            </script>
        </div>
                
    </body>
</html>
