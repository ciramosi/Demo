<%-- 
    Document   : suppliersDrv
    Created on : 21/02/2018, 05:29:28 PM
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
    
    final SWBDataSource cfdiTypeDS = engine.getDataSource("CFDIType");
    final SWBDataSource cfdiDivDS = engine.getDataSource("CFDIDivision");
    final SWBDataSource cfdiGroupDS = engine.getDataSource("CFDIGroup");
    final SWBDataSource cfdiClassDS = engine.getDataSource("CFDIClass");
    final SWBDataSource productDS = engine.getDataSource("Product");
%>
        
        <div>
            <script type="text/javascript">
                var supplierGrid;            
                supplierGrid = eng.createGrid({
                    ID: "supplierDvr",
                    title: "Proveedores",
                    top: 10, width:"90%", height:"400", alternateRecordStyles:true, cellHeight:"32",
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
                    showFilter: true,
                    //sortDirection: "descending",
                    //sortFieldNum: 3,
                    fields: [
                        {name: "tradeName"},
                        {name: "rfc"},
                        {name: "email"},
                        {name: "branchOffice"},
                        {name: "phone"}
                    ],
                    recordDoubleClick: function(grid, record) {
                        window.location.href='/work/supplierMgr?suri='+record._id;
                        return false;
                    },
                    addButtonClick: function(event) {
                        window.location.href = "/work/supplierMgr";
                        return false;
                    }
                }, "Supplier");
            </script>
        </div>
                
    </body>
</html>
