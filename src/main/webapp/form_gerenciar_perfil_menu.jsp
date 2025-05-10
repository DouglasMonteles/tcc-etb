<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Perfil p = new Perfil();
    ArrayList<Menu> menusNaoPerfil = new ArrayList<Menu>();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregarPorId(id);
        menusNaoPerfil = pDAO.menusNaoPerfil(id);
    }catch(Exception e){
        out.print("Erro: "+e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciar Perfil & Menu</title>
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
    </head>
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <div class="container my-5">
            
            <%@include file="include/alerts.jsp" %>
            
            <div class="col-sm-12">
                <div class="row bg-tab-listas text-white rounded-top justify-content-center my-3">
                    <h4 class="h4 my-2">Menus não vinculados</h4>
                </div>
                <form method="post" action="gerenciar_perfil_menu.do">
                    <input type="hidden" name="tipo" value="vincular">
                    <input type="hidden" name="id_perfil" value="<%= p.getId() %>">

                    <div class="form-row">
                        <div class="form-group col-sm-6">
                            <h5 class="h5">ID: <%= p.getId() %></h5>
                        </div>
                        
                        <div class="form-group col-sm-6">
                            <h4 class="h4">Selecione o menu:</h4>
                        </div>
                    </div>
                        
                    <div class="form-row">
                        <div class="form-group col-sm-6">
                            <h5 class="h5">Perfil: <%= p.getNome() %></h5>
                        </div>
                        
                        <div class="form-group col-sm-6">
                            <select name="id_menu" class="form-control">
                                <option value="" class="justify-content-center">
                                    <span style="text-align: center">------------------------------- Selecione -------------------------------</span>
                                </option>
                                <%
                                    for(Menu m:menusNaoPerfil){
                                %>
                                <option value="<%= m.getId() %>"><%= m.getNome() %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                            
                    <div class="form-row">
                        <div class="form-group ml-auto">
                            <button type="submit" class="btn btn-primary display-5">Vincular</button>
                        </div>
                    </div>
                </form>
                
                <div class="row bg-tab-listas text-white rounded-bottom justify-content-center my-3">
                    <h4 class="h4 my-2">Menus vinculados</h4>
                </div>
            </div>
        
            
            
            <table class="table sombra">
                <thead class="bg-escuro">
                    <th scope="col">ID</th>
                    <th scope="col">Título</th>
                    <th class="text-center" scope="col">Desvincular</th>
                </thead>
                
                <%
                    for(Menu m : p.getMenus()){   
                %>
                
                <tbody class="tabela-ativa">
                    <td><%= m.getId() %></td>
                    <td><%= m.getNome() %></td>
                    <td class="text-center"><a style="margin: -15px auto" class="btn btn-danger" href="gerenciar_perfil_menu.do?id_perfil=<%=p.getId()%>&id_menu=<%=m.getId()%>&tipo=desvincular">Desvincular</a></td>
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
