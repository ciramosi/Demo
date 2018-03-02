<%-- 
    Document   : purchaseMgr
    Created on : 22/02/2018, 12:46:55 PM
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
            var porderId = '<%=suri%>';
            var porderFrm;
            porderFrm = eng.createForm({
                ID:"porderMgr"
                ,title:"Orden de Compra"
                ,top: 10, width: "95%", height: "*"
                ,numCols: 6
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
                    {name: "number", width: "100%", canEdit: false, defaultValue:"--" , emptyCellValue: "--"},
                    {name: "supplier", width: "100%"},
                    {name: "created", width: 200, useTextField: true, disabled: true},
                    {
                        name: "order"
                        ,stype: "grid"
                        ,dataSource: "ItemOrder"
                        ,width:"100%", height:"250", alternateRecordStyles:true, cellHeight:"22"
                        ,colSpan: 6
                        ,titleOrientation: "top"
                        ,baseStyle: "boxedGridCellRose"
                        ,showRollOverCanvas:false
                        ,showRollUnderCanvas:false
                        ,headerHeight: 22
                        //,required: true
                        ,showGroupSummary:true
                        ,showGridSummary: true
                        ,fields: [
                            {name: "quantity", width: "150", showGridSummary: false},
                            {name: "unit"},
                            {
                                name: "product", required: true, stype: "select", dataSource: "Product"
                                ,fields: [
                                    {name: "code"},
                                    {name: "productName"},
                                ]
                            },
                            {name: "cost"},
                            {name: "iva"},
                            {
                                name: "amount", title: "Importe"
                                ,recordSummaryFunction:"multiplier"
                                ,getGridSummary: function(records, summaryField) {
                                    var totalSum=0;
                                    for (var i=0; i<records.length; i++) {
                                        totalSum+=records[i].amount*records[i].cost;
                                    }
                                    return totalSum;
                                }
                            }
                        ] // fields
                        ,winEdit: {
                            ID: "item"
                            ,title: "Item"
                            ,width:"90%", height:"280"
                            ,titleOrientation: "left"
                            ,showTabs: true
                            ,numCols: 6
                            ,autoFocus: true
                            ,fields: [
                                {name: "product", colSpan: 1, width: "100%"},
                                {name: "unit", colSpan: 1, width: "100%"},
                                {name: "quantity", colSpan: 1, width: "100%"},
                                {name: "cost", colSpan: 1,  width: "100%"},
                                {name: "iva", colSpan: 1, width: "90%"}
                            ]
                        }
                    } // order
                ]
            }, porderId, "PurchaseOrder");
        </script>
    </body>
</html>
