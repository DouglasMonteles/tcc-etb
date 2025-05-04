<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Perfil> listPerfil = new ArrayList<Perfil>();
    try{
        PerfilDAO pDAO = new PerfilDAO();
        listPerfil = pDAO.listar();
    }catch(Exception e){
        out.print("Erro: "+e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfis</title>
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <script>
            function excluir(id, nome){
                if(window.confirm('Ter certeza que deseja excluir '+nome+'?')){
                    location.href='gerenciar_perfil.do?id='+id+'&tipo=excluir';
                }
            }
        </script>
        
    </head>
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <div class="container my-5">
            <div class="row"> 
                <a class="ml-auto mx-4 mb-4" href="form_cadastro_perfil.jsp">
                    <i class="fa fa-plus"></i> <i class="fa fa-user"></i>
                </a>
            </div>
            
            <%@include file="include/alerts.jsp" %>
            
            <table class="table sombra">
                <thead class="thead-dark">
                    <th scope="col">Perfil</th>
                    <th scope="col">Descrição</th>
                    <th class="text-center" scope="col">Opções</th>
                </thead>
                
                <%
                    for(Perfil p : listPerfil){   
                %>
                
                <tbody class="tabela-ativa">
                    <td><%= p.getNome() %></td>
                    <td><%= p.getDescricao() %></td>
                    <td class="text-center">
                        <a href="form_altera_perfil.jsp?id=<%= p.getId() %>"><i class="fa fa-edit"></i></a>
                        <a class="mx-2" href="#" onclick="excluir(<%= p.getId() %>, '<%= p.getNome() %>')"><i class="fa fa-trash"></i></a>
                        <a href="form_gerenciar_perfil_menu.jsp?id=<%= p.getId() %>">
                            <i class="fa fa-cogs"></i>
                        </a>
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
