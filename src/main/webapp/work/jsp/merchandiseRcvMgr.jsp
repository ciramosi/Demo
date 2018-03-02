<%-- 
    Document   : merchandiseRcvMgr
    Created on : 26/02/2018, 01:06:18 PM
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
    final SWBDataSource merchandiseRcvDS = engine.getDataSource("MerchandiseRcv");
    
    final String suri = request.getParameter("suri");
    final DataObject merchandiseRcvDO = merchandiseRcvDS.fetchObjById(suri);
    
    if(merchandiseRcvDO!=null) {
        final boolean isAssorted = merchandiseRcvDO.getBoolean("status");
%>
        <script type="text/javascript">
            var mrcvId = '<%=suri%>';
            var mrcvFrm;
            mrcvFrm = eng.createForm({
                ID:"mrcvMgr"
                ,title:"Recepción de Mercancía"
                ,top: 10, width: "95%", height: "*"
                ,numCols: 6
                ,titleOrientation: "left"
                ,cellBorder: 0
                ,showTabs: true
                ,autoFocus: true
                ,baseStyle: "boxedGridCellCyan"
                ,canAdd: true
                ,canEdit: true
                ,canRemove: true
                //,titleSuffix: ":"
                //,requiredTitleSuffix: "<span style='color:#DE3163'>*</span>:</B>"
                ,fields: [
                    {name: "number"},
                    {name: "supplier"},
                    {name: "status", canEdit: <%= (!isAssorted) %>},
                    {
                        name: "order"
                        ,stype: "grid"
                        ,dataSource: "ItemOrder"
                        ,width:"100%", height:"250", alternateRecordStyles:true, cellHeight:"22"
                        ,colSpan: 6
                        ,titleOrientation: "top"
                        //,baseStyle: "boxedGridCellRose"
                        ,showRollOverCanvas:false
                        ,showRollUnderCanvas:false
                        ,headerHeight: 22
                        ,required: false
                        ,fields: [
                            {name: "unit", canEdit: false},
                            {
                                name: "product", required: true, stype: "select", dataSource: "Product"
                                ,fields: [
                                    {name: "code"},
                                    {name: "productName"},
                                ]
                                ,canEdit: false
                            },
                            {name: "quantity", width: "150", canEdit: false},
                            {name: "cost", canEdit: false},
                            {name: "iva", align: "right", canEdit: false},
                            {
                                name: "amount", title: "Importe"
                                //,recordSummaryFunction:"multiplier"
                                ,getGridSummary: function(records, summaryField) {
console.log('getgridsummario');
                                    var totalSum=0;
                                    for (var i=0; i<records.length; i++) {
                                        totalSum+=records[i].quantity*records[i].cost;
                                    }
                                    return totalSum;
                                }
                                ,align: "right"
                                ,canEdit: false
                            }
                        ]
                    }, // order
                    {name: "comments", colSpan:5, width: "100%"},
                    {type:"spacer", colSpan:3},
                    {name: "subtotal", hint: "MXN", format: "\u0024,0.00", colSpan:2, height: 25, endRow: true, textAlign: "right", titleAlign: "right", titleOrientation: "left", align: "left"},
                    {type:"spacer", colSpan:3},
                    {name: "discount", hint: "MXN", format: "\u0024,0.00", colSpan:2, height: 25, endRow: true, textAlign: "right", titleAlign: "right", titleOrientation: "left", align: "left"},
                    {type:"spacer", colSpan:3},
                    {name: "iva", hint: "MXN", format: "\u0024,0.00", colSpan:2, height: 25, endRow: true, textAlign: "right", titleAlign: "right", titleOrientation: "left", align: "left"},
                    {type:"spacer", colSpan:3},
                    {name: "total", hint: "MXN", format: "\u0024,0.00", colSpan:2, height: 25, endRow: true, textAlign: "right", titleAlign: "right", titleOrientation: "left", align: "left"},
                    {type:"spacer", colSpan:3},
                    {name: "paid", hint: "MXN", format: "\u0024,0.00", colSpan:2, height: 25, endRow: true, textAlign: "right", titleAlign: "right", titleOrientation: "left", align: "left"},
                    {type:"spacer", colSpan:3},
                    {name: "remaining", hint: "MXN", format: "\u0024,0.00", colSpan:2, height: 25, endRow: true, textAlign: "right", titleAlign: "right", titleOrientation: "left", align: "left"}
                ]
            }, mrcvId, "MerchandiseRcv");
        </script>
<%
    }
%>
    </body>
</html>