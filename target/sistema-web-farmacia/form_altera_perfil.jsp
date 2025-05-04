<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Perfil p = new Perfil();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro: "+e);
    }
%>

<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração Perfil</title>
        <!--Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
    </head>
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <div class="container my-5">
            
            <div class="row mt-5 mb-4">
                <h4 class="centro">Alteração de Perfil</h4>
            </div>
            
            <%@include file="include/alerts.jsp" %>
            
            <div class="row justify-content-center">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <div class="row">
                        <div class="col-sm-12">
                            <form action="gerenciar_perfil.do" method="post">
                                <input type="hidden" name="id" value="<%= p.getId() %>">
                                <input type="hidden" name="tipo" value="alterar">
                                
                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <h5>Id: <%= p.getId() %></h5>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <label for="inputNomePerfil">Nome do Perfil</label>
                                        <input class="form-control" type="text" id="inputNomePerfil" name="nome" value="<%= p.getNome() %>" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <label for="inputDesc">Descrição</label>
                                        <input class="form-control" type="text" id="inputDesc" name="descricao" value="<%= p.getDescricao() %>" required>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary display-1">Alterar Perfil</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="include/rodape.jsp" %>
        
        <script src="node_modules/jquery/dist/jquery.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
    </body>
</html>
