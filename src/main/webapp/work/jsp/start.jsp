<%-- 
    Document   : inicio
    Created on : 26/02/2018, 01:55:08 PM
    Author     : dante.arias
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
    final SWBDataSource productDS = engine.getDataSource("Enterprise");
%>

   <h1>Bienvenidos a la pagina principal del sistema iWise!</h1>
    <p> A continuación te mostraremos información relevante del sistema.  
   </p>
    
        <script type="text/javascript">
            var prdId = null;
            var prdFrm;
            prdFrm = eng.createForm({
                ID:"start"
                ,title:"Imformación de la empresa"
                ,top: 10, width: "80%", height: 200
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
                
                
            }, prdId, "Enterprise");
        </script>
        <p>Estas son las actividades que puedes realizar sobre tus productos</p>
        <div><a href="/work/jsp/productAdd.jsp">Agrega un producto</a></div>
        <div><a href="/work/jsp/productsDrv.jsp">Edita un producto</a></div>
        
    </body>
</html>
