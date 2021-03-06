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
        <title>Clientes</title>
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
         
            application.setAttribute("admin", new Integer(2));

             // Para leerla en otro o el mismo JSP
                Integer valor = (Integer)application.getAttribute("admin");
        %>
        <!--include que muestra los datos de los clientes-->
       <jsp:include page="WEB-INF/Clientes.jsp" />
<!--       llama todos los script-->        
        <script src="js/scripts.js"></script>
<!--       scripts que permiten obtener datos del cliente en la ventana emergente-->
        <script>
          $( "a.edit" ).each(function(index) { 
                $(this).on("click", function(){
             var myModal = $('#editarusuario');
             //capturar datos desde tabla
            var currentTR = $(this).closest('tr');
            var cod = currentTR.find("td.codigo").text();
            var nombre = currentTR.find("td.nombre").text();
            var apellido = currentTR.find("td.apellido").text();
            var edad = currentTR.find("td.edad").text();
            var sexo = currentTR.find("td.sexo").text();
            var ndui = currentTR.find("td.ndui").text();
            var nnit = currentTR.find("td.nnit").text();
            var ingreso = currentTR.find("td.ingreso").text();
            var nrc = currentTR.find("td.nrc").text().replace('', '');
            var telefono = currentTR.find("td.telefono").text().replace('', '');
            var membresia = currentTR.find("td.idmembresia").text().replace(/\n/g, '');
            $('.addcodigo', myModal).val(cod);
            $('.addnombre', myModal).val(nombre);
            $('.addapellido', myModal).val(apellido);
            $('.addedad', myModal).val(edad);
           if(sexo==="Hombre\n"){
                $('.addsexo', myModal).prop('selectedIndex',0);
            }
            else if(sexo==="Mujer\n"){
               $('.addsexo', myModal).prop('selectedIndex',1);
            }
            $('.adddui', myModal).val(ndui);
            $('.addnnit', myModal).val(nnit);
            $('.addingreso', myModal).val(ingreso);
            $('.addnrc', myModal).val(nrc);
            $('.addtelefono', myModal).val(telefono);
            $('.addmembresia', myModal).val(membresia);

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
        </script>
    </body>
</html>
