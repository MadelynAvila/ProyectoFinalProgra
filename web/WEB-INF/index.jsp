<%--


--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
        //Conectando a la base de datos 
        Connection con;
        String url = "jdbc:mysql://localhost::3306/bdnegocio";
        String Driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String pass = "123";
        Class.forName(Driver);
        con=DriverManager.getConnection(url,user,pass);
        ///Iniciando la tabla 
        PreparedStatement ps;
        ResultSet rs;
        ps = con.prepareStatement("select * from usuario");
        rs = ps.executeQuery();
        //Creamos la tabla 
        %>
        <div class="container">
        <h1>Lista de Productos</h1>
        <hr>
        <table class="table table-bordered">
            <tr>
                <th class="text-center">ID</th>
                <th>NOMBRE</th>
                <th class="text-center">PRECIO</th>
                <th class="text-center">CANTIDAD</th>
                <th class="text-center">ACCIONES</th>
                
            </tr>
            <%
                while(rs.next()){
            %>
            <tr>
                <td class="text-center"><%= rs.getInt("codigoProducto")%></td>
                <td><%= rs.getString("nombreProducto")%></td>
                <td class="text-center"><%= rs.getInt("precioUnitario")%></td>
                <td class="text-center"><%= rs.getInt("cantidadProducto")%></td>

                <td class="text-center">
                    <a class="btn btn-warning btn-sm">Editar</a>
                    <a class="btn btn-danger btn-sm">Eliminar</a>
                </td>
            </tr>
            <%}%>
        </table>
        </div>
    </body>
</html>
