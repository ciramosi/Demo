<%-- 
    Document   : supplierMgr
    Created on : 21/02/2018, 05:29:43 PM
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
            var splrId = '<%=suri%>';
            var splrFrm;
            splrFrm = eng.createForm({
                ID:"splrMgr"
                ,title:"Detalle de Producto"
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
                    {name: "businessName", width: "100%"},
                    {name: "tradeName", width: "100%"},
                    {
                        name: "rfc"
                        ,mask: "LLL?000000AAA"
                        ,hint: "ABC 741230ABC"
                        ,showHintInField: false
                    },
                    {
                        name: "email"
                        ,validators: [
                            {stype: "email"}
                        ]
                    },
                    {name: "branchOffice"},
                    {
                        name: "website"
                        ,width: "100%"
                        ,length: "64"
                        ,validators: [
                            {stype: "url"},
                            {type: "isUnique", errorMessage: "Ya se tiene registrada esta página web."}
                        ]
                    },
                    {name: "phone"},
                    {name: "comments", colSpan: 3, width: "100%"},
                    
                    {name: "created", title: "Proveedor desde", useTextField: true, startRow: true, disabled: <%=(suri==null)%>}
                ]
                ,links: [
                    {
                        name: "address"
                        ,stype: "subForm", dataSource: "Address"
                        ,numCols: 6
                        ,titleOrientation: "left"
                    },
                    {
                        name: "contacts"
                        ,stype: "tab", dataSource: "Contact"
                        ,numCols: 4
                        ,titleOrientation: "left"
                        ,fields: [
                            {name: "fullname", colSpan: 3, width: "100%"},
                            {name: "email", width: "100%"},
                            {name: "phone", width: "100%"},
                            {name: "extension", width: "100%"}
                        ]
                    }
                ]
            }, splrId, "Supplier");
        </script>
    </body>
</html>
