<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Cliente c = new Cliente();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        ClienteDAO uDAO = new ClienteDAO();
        c = uDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro: "+e.getMessage());
    }
%>

<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Cliente</title>
        
        <!--Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="css/style_form_etapas.css" rel="stylesheet" type="text/css"/>

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <script type="text/javascript">
            $(document).ready(function(){
                $('#cel').mask('(00) 0 0000-0000');
                $('#tel').mask('(00) 0000-0000');
                $('#cpf').mask('000.000.000-00');
            });
        </script>
    </head>
    <body>
        <%@include file="include/menu_adm.jsp" %>
        	
        <div class="container my-5">
            <!--Formularios-->
            <div class="row justify-content-center">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <div class="row">
                        <h1 class="ml-auto mr-auto mb-4 display-5">
                            <i class="fa fa-user-circle-o text-primary mr-2" aria-hidden="true"></i>Alteração de Cliente
                        </h1>
                        
                        <%@include file="include/alerts.jsp" %>
                        
                        <div class="col-sm-12">
                            <form id="regForm" action="gerenciar_cliente.do" method="post">
                                <input type="hidden" name="tipo" value="alterarPorUsuario">
                                <input type="hidden" name="id" value="<%= c.getId() %>">
                                <div class="tab"> 
                                    <div class="form-row">
                                        <div class="form-group col-sm-6">
                                            <label for="inputNome">Nome</label>
                                            <input class="form-control" type="text" name="nome" value="<%= c.getNome() %>" required>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="inputSobrenome">Sobrenome</label>
                                            <input class="form-control" type="text" id="inputSobrenome" name="sobrenome" value="<%= c.getSobrenome() %>" required>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-sm-12">
                                            <label for="inputCpf">CPF</label>
                                            <input id="cpf" class="form-control" type="text" id="inputCpf" name="cpf" value="<%= c.getCpf() %>" required>
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
                                                    <input class="form-control" type="text" name="user" id="inputUser"  value="<%= c.getCpf()%>" required>
                                                </div>

                                                <div class="form-group col-sm-12">
                                                    <label for="inputPasswd">Senha</label>
                                                    <input class="form-control" type="password" name="senha" id="inputPasswd"  value="<%= c.getSenha() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab">
                                    <div class="row">
                                    
                                        <h3 class="ml-auto mr-auto mb-4 display-5">
                                            <i class="fa fa-home text-primary mr-2" aria-hidden="true"></i>Dados do Endereço
                                        </h3>

                                        <div class="col-sm-12">
                                            <div class="form-row">
                                                <div class="form-group col-sm-12">
                                                    <label for="inputCidade">Cidade</label>
                                                    <input class="form-control" type="text" id="inputCidade" name="cidade"  value="<%= c.getCidade() %>" required>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group col-sm-6">
                                                    <label for="inputRua">Logradouro</label>
                                                    <input class="form-control" type="text" name="logradouro" id="inputRua"  value="<%= c.getLogradouro()%>" required>
                                                </div>

                                                <div class="form-group col-sm-3">
                                                    <label for="inputCasa">Nº Casa</label>
                                                    <input class="form-control" type="number" name="casa" min="0" id="inputCasa"  value="<%= c.getCasa() %>">
                                                </div>

                                                <div class="form-group col-sm-3">
                                                    <label for="inputApto">Nº Apto</label>
                                                    <input class="form-control" type="number" name="apto" min="0" id="inputApto"  value="<%= c.getApto() %>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab">
                                    <div class="row">
                                    
                                        <h3 class="ml-auto mr-auto mb-4 display-5">
                                            <i class="fa fa-phone text-primary mr-2" aria-hidden="true"></i>Dados de Contato
                                        </h3>

                                        <div class="col-sm-12">
                                            <div class="form-row">
                                                <div class="form-group col-sm-6">
                                                    <label for="inputTelCel">Tel. Celular</label>
                                                    <input id="cel" class="form-control" type="tel" id="inputTelCel" name="tel_celular"  value="<%= c.getTelCelular()%>" required>
                                                </div>

                                                <div class="form-group col-sm-6">
                                                    <label for="inputTelFixo">Tel. Fixo</label>
                                                    <input id="tel" class="form-control" type="tel" id="inputTelCel" name="tel_fixo"  value="<%= c.getTelFixo() %>" required>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group col-sm-12">
                                                    <label for="inputEmail">E-mail</label>
                                                    <input class="form-control" type="email" name="email" id="inputEmail"  value="<%= c.getEmail() %>">
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
        
        <!--Mascara-->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/jquery.mask.min.js" type="text/javascript"></script>
    </body>
</html>
