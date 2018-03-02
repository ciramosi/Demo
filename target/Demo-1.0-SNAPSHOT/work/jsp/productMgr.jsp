<%-- 
    Document   : productMgr
    Created on : 19/02/2018, 06:16:37 PM
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
//    if(prdDO != null)
//    {
%>
        <script type="text/javascript">
            var prdId = '<%=suri%>';
            var prdFrm;
            prdFrm = eng.createForm({
                ID:"prdMgr"
                ,title:"Detalle de Producto"
                ,top: 10, width: "95%", height: "*"
                ,numCols: 4
                ,titleOrientation: "left"
                ,showTabs: true
                ,autoFocus: true
                ,onLoad: function(form) {
                    document.getElementById('xxx').src="/uploadfile/"+form.getField('foto').getValue()[0].id;
                }
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
                    {name: "existence", format: ",0", canEdit: false},
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
                    {name: "foto"},
                    {name: "img", title: "img", type: "img", imageURLPrefix:"/uploadfile/o_1c6sv1bauh37tag36cg6vas27"},
                    {name: "created", useTextField: true, startRow: true, disabled: <%=(suri==null)%>},
                    {name: "updated", useTextField: true, showIf: "<%=(suri!=null)%>"}
                ]
                ,links: [
                    {
                        name: "optionalData",
                        title: "Datos Opcionales",
                        stype: "tab", dataSource: "OptionalProductData",
                        numCols: 4,
                        titleOrientation: "left",
                        fields: [
                            {name: "sku", colSpan: 1, width: "100%"},
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
                        //width: 500,
                        numCols: 4,
                        titleOrientation: "top",
                        fields: [
                            {
                                name: "list"
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
<div><img id="xxx"></div>
<%
//    }
//    else
//    {
%>
<!--        <script type="text/javascript">
            isc.Label.create({
                height: 30,
                padding: 10,
                align: "center",
                valign: "center",
                wrap: false,
                icon: "/platform/isomorphic/skins/Simplicity/images/actions/cancel.png",
                showEdges: true,
                contents: "<h3>No se tiene referencia del <i>producto</i></h3>"
            });
        </script>-->
<%
//    }
%>
    </body>
</html>
