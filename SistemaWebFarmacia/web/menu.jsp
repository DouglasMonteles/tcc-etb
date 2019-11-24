<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.MenuDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Menu> listMenu = new ArrayList<Menu>();
    try{
        MenuDAO mDAO = new MenuDAO();
        listMenu = mDAO.listar();
    }catch(SQLException e){
        out.print("Erro: "+e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menus</title>
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <script>
            function excluir(id, nome){
                if(window.confirm('Ter certeza que deseja excluir '+nome+'?')){
                    location.href='gerenciar_menu.do?id='+id+'&tipo=excluir';
                }
            }
        </script>
        
    </head>
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <div class="container my-5">
            <div class="row">  
                <a class="ml-auto mx-4 mb-4" href="form_cadastro_menu.jsp"><i class="fa fa-plus"></i> <i class="fa fa-list"></i></a>
            </div>
            
            <%@include file="include/alerts.jsp" %>
            
            <table class="table sombra">
                <thead class="thead-dark">
                    <th scope="col">Nome</th>
                    <th scope="col">Link</th>
                    <th class="text-center" scope="col">Opções</th>
                </thead>
                
                <%
                    for(Menu m : listMenu){   
                %>
                
                <tbody class="tabela-ativa">
                    <td><%= m.getNome() %></td>
                    <td><%= m.getLink() %></td>
                    <td class="text-center">
                        <a class="mr-4" href="form_altera_menu.jsp?id=<%= m.getId() %>"><i class="fa fa-edit"></i></a>
                        <a class="" href="#" onclick="excluir(<%= m.getId() %>, '<%= m.getNome() %>')"><i class="fa fa-trash"></i></a>
                    </td>
                </tbody>
                
                <%
                    }
                %>
            </table>
        </div>
        
        <%@include file="include/rodape.jsp" %>
        
        <script src="node_modules/jquery/dist/jquery.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
    </body>
</html>
