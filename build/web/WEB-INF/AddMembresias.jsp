<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <div id="wrapper">
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img src="images/logo.png">
                    </a>
                </div>
          <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>&nbsp;Bienvenido(a):
                         <% 
                        String url_inicio = "";
                        Integer valor = (Integer)getServletContext().getAttribute("admin");
                         if( valor == 1){
                             url_inicio = "admin.jsp";
                        %> 
                        Administrador
                       <%} else{
                            url_inicio = "user.jsp";
                        %> 
                        Empleado
                       <%} %>
                        <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<%=request.getContextPath()%>/LogoutServlet"><i class="fa fa-fw fa-power-off"></i>Cerrar Sesi&oacute;n</a>
                        </li>
                    </ul>
                </li>
            </ul>
             
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li>
                            <a href="<% out.print(url_inicio); %>">
                                <i class="fa fa-fw fa-pie-chart"></i> Clientes                                                   
                            </a>
                        </li> 
                         <li class="active">
                        <a href="membresias.jsp"><i class="fa fa-fw fa-cog"></i> Membresias
                         <svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="svg-triangle  extended">                    
                                <polygon style="border-color: white;" points="22,20 -5,40 0,0"></polygon>
                                </svg>
                        </a>
                        </li>
                        <% 
                         if( valor == 1){
                        %>  
                        <li>
                          <a href="empleados"><i class="fa fa-fw fa-user-md"></i> Usuarios</a>
                        </li>
                        <li>
                          <a href="#"><i class="fa fa-fw fa-book"></i> Compras</a>
                        </li>
                         <li>
                          <a href="#"><i class="fa fa-fw fa-money"></i> Cuentas por Pagar</a>
                        </li>
                                 <%}
                        %>                         
                          <li>
                          <a href="#"><i class="fa fa-fw fa-calculator"></i> Ventas
                          </a>
                        </li>
                                                 <% 
                         if( valor == 1){
                        %>  
                        <li>
                          <a href="#"><i class="fa fa-fw fa-check"></i> Cuentas por Cobrar
                          </a>
                        </li>
                         <li>
                          <a href="#"><i class="fa fa-fw fa-bell"></i> Servicios Básicos</a>
                        </li>                       
                        <%}
                        %> 
                        
                    </ul>
                </div>
            </nav>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-9">
                            <h1 class="page-header" style="margin-top:0;">
                                <i class="fa pg fa-fw fa-cog"></i> Administraci&oacute;n de Membresias
                            </h1>
                        </div>

                        <div class="col-lg-3">
<!--                            <button type="button" id="save-notify" name="regresar" class="col-lg-12 t5 btn-left btn btn-default" data-target="#agregarmembresia" data-toggle="modal">
                                <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                                Agregar Membresia
                            </button>-->
                        </div>
                    </div>
                    <div id="page-wrapper">
                        <div class="container-fluid">

                            <div class="row gray-row">
                                <article class="center2" >
                                     <jsp:include page="tableMembresias.jsp" /> 
                                </article>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="footer.jsp" />
                </div>
            </div>
        </div>
<!-- Modals -->
 <jsp:include page="deleteMembresia.jsp" />
 <jsp:include page="addMembresia.jsp" />
 <jsp:include page="readMembresia.jsp" />
    </body>

</html>
