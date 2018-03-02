<%-- 
    Document   : productAdd
    Created on : 19/02/2018, 06:44:25 PM
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
    
    final SWBDataSource cfdiTypeDS = engine.getDataSource("CFDIType");
    final SWBDataSource cfdiDivDS = engine.getDataSource("CFDIDivision");
    final SWBDataSource cfdiGroupDS = engine.getDataSource("CFDIGroup");
    final SWBDataSource cfdiClassDS = engine.getDataSource("CFDIClass");
    final SWBDataSource productDS = engine.getDataSource("Product");
%>
        <script type="text/javascript">
            var prdId = null;
            var prdFrm;
            prdFrm = eng.createForm({
                ID:"productMgr"
                ,title:"Detalle"
                ,top: 10, width: "95%", height: 800
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
                    {name: "code"},
                    {name: "productName", width: "100%"},
                    {name: "description", width: "100%"},
                    {
                        name: "CFDI"
                        ,startRow: true
                        ,selectFields: [
                                {name: "type"},
                                {name: "division"},
                                {name: "group"},
                                {name: "class"}
                            ]
                        ,colSpan: 1
                        ,width: "100%"
                    },
                    {name: "CFDIU"},
                    {name: "foto"}
                ]
                ,links: [
                    {
                        name: "optionalData",
                        title: "Datos Opcionales",
                        stype: "tab", dataSource: "OptionalProductData",
                        numCols: 6,
                        fields: [
                            {name: "sku"},
                            {name: "iva"},
                            {name: "volume"},
                            {name: "weight"},
                            {name: "category1", startRow: true},
                            {name: "category2"}
                        ]
                    },
                    {
                        name: "prices",
                        title: "Precios",
                        stype: "tab", dataSource: "ProductPrice",
                        //autoResize: true,
                        //width: 500,
                        numCols: 4,
                        titleOrientation: "top",
                        fields: [
                            {
                                name: "list"
                                //,autoResize: true
                                ,width: "500"
                                ,fields: [
                                    {name: "list", width: "100%"},
                                    {name: "price", width: "100%"}
                                ]
                            }
                        ]
                    },
                ]
            }, prdId, "Product");
        </script>
    </body>
</html>
