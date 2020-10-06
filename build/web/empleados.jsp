<%-- 
    Document   : index
    Created on : 20-Sept-2020
    Author     : Francisco Coto
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Membresia</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/sb-admin.css" rel="stylesheet">
    </head> 
    <body>
         <% // Para fijar una variable en un jsp
            HttpSession sesion = request.getSession();
            String usuario;
            String rol;
            if(sesion.getAttribute("user")!=null && sesion.getAttribute("rol")!=null){
                usuario = sesion.getAttribute("user").toString();
                rol = sesion.getAttribute("rol").toString();
            }
            else{
                out.print("<script>location.replace('login.jsp');</script>");
            }
             
           application.getAttribute("admin"); 
             // Para leerla en otro o el mismo JSP
                Integer valor = (Integer)application.getAttribute("admin");
        %>
        <!--include que muestra los datos de las membresias-->
       <jsp:include page="WEB-INF/AddEmpleados.jsp" />
        <!--llama todos los script-->
        <script src="js/scripts.js"></script>
        <script>   
//            script para edita datos de tabla en modal
       $( "a.edit" ).each(function(index) { 
           $(this).on("click", function(){
            var myModal = $('#readempleado');
            var currentTR = $(this).closest('tr');
            var nombre = currentTR.find("td.nombre").text();
            var cod = currentTR.find("td.codigo").text();
            var apellido = currentTR.find("td.apellido").text();
            var direccion = currentTR.find("td.direccion").text();
             var telefono = currentTR.find("td.telefono").text();
             var dui = currentTR.find("td.dui").text();
             var nit = currentTR.find("td.nit").text();
             var nip = currentTR.find("td.nip").text();
             var isss = currentTR.find("td.isss").text();
            var salario = currentTR.find("td.salario").text().replace("$", "");
            var username = currentTR.find("td.user").text();
            var password = currentTR.find("td.password").text();
             var email = currentTR.find("td.email").text();
              var rol = currentTR.find("td.role").text();
           //enviar datos a modal
            $('.addcodigo', myModal).val(cod);
            $('.addnombre', myModal).val(nombre);
            $('.addapellido', myModal).val(apellido);
            $('.adddireccion', myModal).val(direccion);
            $('.addtelefono', myModal).val(telefono);
            $('.adddui', myModal).val(dui);
            $('.addnit', myModal).val(nit);
            $('.addnip', myModal).val(nip);
            $('.addisss', myModal).val(isss);
            $('.addsalario', myModal).val(salario);
            $('.addusername', myModal).val(username);
            $('.addpassword', myModal).val(password);
            $('.addemail', myModal).val(email);
            
            if(rol==="admin\n"){
                $('.addrol', myModal).prop('selectedIndex',0);
            }
            else if(rol==="user\n"){
              $('.addrol', myModal).prop('selectedIndex',1);
            }
             //mostrar modal
            myModal.modal({ show: true });
              return false;
            });
          });
          
          //script que permite eliminar registros
          $('a.delete').on('click', function() {
            var myModal = $('#confirmDelete');
             //capturar datos desde tabla
            var currentTR = $(this).closest('tr');
            var cod = currentTR.find("td.codigo").text();
           //enviar datos a modal
            $('.addcodigo', myModal).val(cod);
            //mostrar modal
            myModal.modal({ show: true });
              return false;
            });
            
                 //mascara para dinero
        $(function() {
            $('#money').maskMoney();
        });
        </script>
    </body>
</html>
