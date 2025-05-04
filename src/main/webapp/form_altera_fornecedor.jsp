<%@page import="modelo.FornecedorDAO"%>
<%@page import="modelo.Fornecedor"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Fornecedor f = new Fornecedor();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        FornecedorDAO fDAO = new FornecedorDAO();
        f = fDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro: "+e.getMessage());
    }
%>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Fornecedor</title>
        
        <!--Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="css/style_form_etapas.css" rel="stylesheet" type="text/css"/>

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
    </head>
    <body>
        <%@include file="include/menu_adm.jsp" %>
        	
        <div class="container my-5">
            <!--Formularios-->
            <div class="row justify-content-center">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <div class="row">
                        <h1 class="ml-auto mr-auto mb-4 display-5">
                            <i class="fa fa-user-circle-o text-primary mr-2" aria-hidden="true"></i>Alteração de Fornecedor
                        </h1>
                        
                        <%@include file="include/alerts.jsp" %>
                        
                        <div class="col-sm-12">
                            <form id="regForm" action="gerenciar_fornecedor.do" method="post">
                                <input type="hidden" name="tipo" value="alterar">
                                <input type="hidden" name="id" value="<%= f.getId() %>">
                                <div class="tab"> 
                                    <div class="form-row">
                                        <div class="form-group col-sm-12">
                                            <label for="inputNome">Nome</label>
                                            <input class="form-control" type="text" name="nome" value="<%= f.getNome() %>" required>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-sm-12">
                                            <label for="inputCnpj">CNPJ</label>
                                            <input class="form-control" type="text" id="inputCnpj" name="cnpj" value="<%= f.getCnpj() %>" required>
                                        </div>
                                    </div>
                                    
                                    <div class="form-row">
                                        <div class="form-group col-sm-12">
                                            <label for="inputLoc">Localização</label>
                                            <input class="form-control" type="text" id="inputLoc" name="localizacao" value="<%= f.getLocalizacao() %>" required>
                                        </div>
                                    </div>
                                    
                                    <div class="form-row">
                                        <div class="form-group col-sm-12">
                                            <label for="inputLogo">Logo</label>
                                            <input class="form-control" type="text" id="inputLogo" name="logo" value="<%= f.getLogo() %>" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab">
                                    <div class="row">
                                        <h3 class="ml-auto mr-auto mb-4 display-5">
                                            <i class="fa fa-key text-primary mr-2" aria-hidden="true"></i>Dados do Login
                                        </h3>
                                    
                                        <div class="col-sm-12">
                                            <div class="form-row">
                                                <div class="form-group col-sm-12">
                                                    <label for="inputUser">Usuário</label>
                                                    <input class="form-control" type="text" name="user" id="inputUser" value="<%= f.getUser() %>" required>
                                                </div>

                                                <div class="form-group col-sm-12">
                                                    <label for="inputPasswd">Senha</label>
                                                    <input class="form-control" type="password" name="senha" id="inputPasswd" value="<%= f.getSenha() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="mt-4" style="overflow:auto;">
                                    <div style="float:right;">
                                      <button type="button" role="button" id="prevBtn" class="btn btn-secondary" onclick="nextPrev(-1)">Voltar</button>
                                      <button type="button" role="button" id="nextBtn" class="btn btn-primary" onclick="nextPrev(1)">Proximo</button>
                                    </div>
                                </div>

                               <div style="text-align:center;margin-top:40px;">
                                    <span class="step"></span>
                                    <span class="step"></span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="include/rodape.jsp" %>
        
        <!--Controlador de etapas do formulario-->
        <script src="js/controle_de_etapas_do_form.js" type="text/javascript"></script>
        
        <script src="node_modules/jquery/dist/jquery.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
    </body>
</html>
