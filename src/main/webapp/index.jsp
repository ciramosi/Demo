<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.semanticwb.datamanager.*"%>
<%
    SWBScriptEngine engine = DataMgr.getUserScriptEngine("/work/jsp/datasources.js", (DataObject)null, false);
    String login = null;
    String fullname = null;
    DataObject user = null;
            
    if(session.getAttribute("_USER_") != null) {
        user = (DataObject)session.getAttribute("_USER_");
        if(user != null) {
            if(user.getClassName().equals("User")) {
                login = user.getString("login", null);
                fullname = user.getString("fullname");
            }
        }
    }
    if(login==null) {
        //response.sendError(404);
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>iWise</title>

        <!-- Bootstrap -->
        <link href="static/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
        <link href="static/css/iwise.css" rel="stylesheet">

    </head>
    <body>
        <div class="top">
            <a class="navbar-brand col-xs-7 col-xs-9 col-md-9 col-lg-7" href="index.jsp">
                <h1>Infotec</h1>
                <img src="static/img/logo.png" class="img-responsive" alt="Infotec">
            </a>
            <a href="#"><%=login%></a>
            <a href="/login?log_out=true" class="top-config">
                <span class="ion-android-exit" aria-hidden="true"></span>
                <span class="config">Terminar Sesión</span>
            </a>
        </div>

        <div id="wrapper" class="toggled">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <p>Inventory Wise</p>
                <h5 style="text-align:center"><%=fullname%></h5>
                <!-- Menú -->
                <div class="panel-group panel-busca">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse" href="#panel-init">
                                Inicio
                                <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
                                <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>
                            </a>
                        </div>
                        <div id="panel-init" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul class="mis-esquemas">
                                    <li>
                                        <a href="/work/start" data-load="iframe" data-target="#main_content" class="gene">
                                            Datos de la Tienda
                                        </a>
                                    </li>                                          
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-group panel-busca">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse" href="#panel-pur">
                                Compras
                                <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
                                <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>
                            </a>
                        </div>
                        <div id="panel-pur" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul class="mis-esquemas">
                                    <li>
                                        <a href="/work/productsDrv" data-load="iframe" data-target="#main_content" class="gene">Productos</a>
                                    </li>
                                    <!--li>
                                        <a href="/work/personList" data-load="iframe" data-target="#main_content" class="gene">Listas de Precio</a>
                                    </li-->
                                    <li>
                                        <a href="/work/suppliersDrv" data-load="iframe" data-target="#main_content" class="gene">Proveedores</a>
                                    </li>
                                    <li>
                                        <a href="/work/purchasesDrv" data-load="iframe" data-target="#main_content" class="gene">Ordenes de Compra</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="panel-group panel-busca">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse" href="#panel-inv">
                                Inventarios
                                <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
                                <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span></a>
                        </div>
                        <div id="panel-inv" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul class="mis-esquemas">
                                    <!--li>
                                        <a href="/work/adminCourse" data-load="iframe" data-target="#main_content" class="gene">Almacenes</a>
                                    </li-->
                                    <li>
                                        <a href="/work/merchandiseRcvDrv" data-load="iframe" data-target="#main_content" class="gene">Recepción de mercancía</a>
                                    </li> 
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="panel-group panel-busca">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse" href="#panel-sales">
                                Ventas
                                <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
                                <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>
                            </a>
                        </div>
                        <div id="panel-sales" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul class="mis-esquemas">
                                    <li>
                                        <a href="/work/salePoint?ds=Country" data-load="iframe" data-target="#main_content" class="gene">Punto de Venta</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="panel-group panel-busca">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse" href="#panel-config">
                                Configuración
                                <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
                                <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>
                            </a>
                        </div>
                        <div id="panel-config" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul class="mis-esquemas">
                                    <li>
                                        <a href="/work/catalogs" data-load="iframe" data-target="#main_content" class="gene">Catálogos del Sistema</a>
                                    </li>
                                    <li>
                                        <a href="/work/permission" data-load="iframe" data-target="#main_content" class="gene">Permisos del Sistema</a>
                                    </li>      
                                    <li>
                                        <a href="/work/usersDrv" data-load="iframe" data-target="#main_content" class="gene">Usuarios</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">
                    <span class="ion-ios-arrow-back" aria-hidden="true"></span>
                    <span class="ion-ios-arrow-forward" aria-hidden="true"></span>
                </a>
                <div id="main_content">
                    <%--<jsp:include page="main_content.jsp" />--%>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <div class="container-fluid">
            <div id="x"></div> 
            <div class="row clearfix pie">
            </div>
        </div>        

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
        <script src="static/js/jquery.js"></script> 
        <!-- Include all compiled plugins (below), or include individual files as needed --> 
        <script src="static/js/bootstrap.min.js"></script>
        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });

            $('[data-load="iframe"]').click(function (e) {
                var $this = $(this),
                        loadurl = $this.attr('href'),
                        targ = $this.attr('data-target');

                var cont = "<iframe id=\"preview\" src=\"" + loadurl + "\" frameborder=\"0\" scrolling=\"yes\" style=\"overflow:hidden; border:none;\" width=\"100%\"></iframe>\n" +
                        "<script>\n" +
                        "        $(document).ready(function(){\n" +
                        "                function fix_height(){\n" +
                        "                        var h = 120;//$(\".div_head\").height()+120;   \n" +
                        "                        $(\"#preview\").attr(\"height\", (($(window).height()) - h) + \"px\");\n" +
                        "                }\n" +
                        "                $(window).resize(function(){ fix_height(); }).resize();\n" +
                        "                //$(\"#preview\").contentWindow.focus();\n" +
                        "        });\n" +
                        "<" + "/script>";

                $(targ).html(cont);
                return false;
            });
        </script>

    </body>
</html>
