<%-- 
    Document   : productsDrv
    Created on : 19/02/2018, 06:16:20 PM
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
                var briefGrid;            
                briefGrid = eng.createGrid({
                    ID: "briefDvr",
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
                        {name: "code", width: 100},
                        {name: "productName"},
                        {name: "description"},
                        {
                            name: "CFDI"
                            ,formatCellValue:
                                function(value, record, rowNum, colNum, grid) {
                                    if(!value) return "";
                                    var cfdiDS = eng.getDataSource("CFDI");
                                    var cfdiClassDS = eng.getDataSource("CFDIClass");
                                    var clss = cfdiClassDS.fetchObjById(value);
                                    if(clss) {
                                        return clss.className;
                                    }
                                    return value;
                                }
                        },
                        {name: "existence", width: "100", format: ",0", canEdit: false}
                    ],
                    recordDoubleClick: function(grid, record) {
                        window.location.href='/work/productMgr?suri='+record._id;
                        return false;
                    },
                    addButtonClick: function(event) {
                        window.location.href = "/work/productMgr";
                        return false;
                    }
                }, "Product");
            </script>
        </div>
                
    </body>
</html>
