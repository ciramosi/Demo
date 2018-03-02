<%-- 
    Document   : catalogs
    Created on : 14/11/2016, 01:07:16 PM
    Author     : carlos.ramos
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.semanticwb.datamanager.DataObject"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iWise:: Administración de Catálogos</title>
        <link rel="stylesheet" href="/static/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/static/css/styles.css">
        
        <script src="/platform/js/eng.js" type="text/javascript"></script>
    </head>
    <body>
        <script type="text/javascript">
            eng.initPlatform("/work/jsp/datasources.js", false);
        </script>
        
        
        <h1>Catálogos iWise</h1>

        <h3>Serial</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: 300, height: 200, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: true,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true
            }, "Serial");
        </script>
        
        <h3>Impuestos</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: 300, height: 200, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: true,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true
            }, "Tax");
        </script>
        
        <h3>Catálogo de Sucursales</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 400, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                //sortDirection: "ascending",
                //sortFieldNum: 0,
                rowContextClick: "isc.say(record._id); return false;",
                recordDoubleClick: function(grid, record) {
                    window.location.href='/work/branchMgr?suri='+record._id;
                    return false;
                }
            }, "Branch");
        </script>
        
        <h3>$ Catálogo de Listas de Precio</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 200, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                //sortDirection: "ascending",
                //sortFieldNum: 0,
                rowContextClick: "isc.say(record._id); return false;"
            }, "PriceList");
        </script>
        
        
        <h3>Catálogo de Tipos CFDI</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 200, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                rowContextClick: "isc.say(record._id); return false;"
            }, "CFDIType");
        </script>
        
        <h3>Catálogo de Divisiones CFDI</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 200, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                rowContextClick: "isc.say(record._id); return false;"
            }, "CFDIDivision");
        </script>
        
        <h3>Catálogo de Grupos CFDI</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 200, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                rowContextClick: "isc.say(record._id); return false;"
            }, "CFDIGroup");
        </script>
        
        <h3>Catálogo de Clases CFDI</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 200, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                rowContextClick: "isc.say(record._id); return false;"
            }, "CFDIClass");
        </script>
            
        <h3>Catálogo de CFDI 3.3</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 200, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                rowContextClick: "isc.say(record._id); return false;"
            }, "CFDI");
        </script>
        
        <h3>Catálogo de Tipos de Unidad CFDI</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 200, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                rowContextClick: "isc.say(record._id); return false;"
            }, "CFDIUType");
        </script>
        
        <h3>Catálogo de Unidades CFDI</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 200, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                rowContextClick: "isc.say(record._id); return false;"
            }, "CFDIU");
        </script>
        
        <h3>Catálogo de Categoría de Productos</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 300, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                //sortDirection: "ascending",
                //sortFieldNum: 0,
                rowContextClick: "isc.say(record._id); return false;"
            }, "Category1");
        </script>
        
        <h3>Catálogo de SubCategoría de Productos</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 400, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                wrapCells: true,
                editEvent: "doubleClick",
                editByCell: false,
                canReorderFields: false,
                canResizeFields: false,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                //sortDirection: "ascending",
                //sortFieldNum: 0,
                rowContextClick: "isc.say(record._id); return false;",
                fields:[
                    {name: "category1"},
                    {name: "name"}
                ]
            }, "Category2");
        </script>
        
        <h3>Catálogo de Productos</h3>
        <script type="text/javascript">
            var grid = eng.createGrid({
                width: "95%", height: 400, alternateRecordStyles:true, cellHeight:"30",
                showRollOverCanvas: false,
                showRollUnderCanvas: false,
                showRowNumbers: false,
                showFilter: true,
                wrapCells: true,
                editEvent: "click",
                editByCell: true,
                canReorderFields: true,
                canResizeFields: true,
                canEdit: true,
                canRemove: true,
                canAdd: true,
                sortDirection: "ascending",
                sortFieldNum: 1,
                rowContextClick: "isc.say(record._id); return false;",
                fields:[
                    {name: "code"},
                    {name: "productName"},
                    {name: "description"},
                    {name: "CFDI", width: 150, align: "center"},
                    {name: "CFDIU", width: 150, align: "center"},
                    {name: "updated"},
                    {name: "created"}
                ]
            }, "Product");
        </script>
        
    </body>
</html>
