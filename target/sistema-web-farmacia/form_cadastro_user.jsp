<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Perfil> listPerfil = new ArrayList<Perfil>();
    try{
        PerfilDAO pDAO = new PerfilDAO();
        listPerfil = pDAO.listar();
    }catch(Exception e){
        out.print("Erro: "+e);
    }
%>

<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Usuário</title>
        
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
                            <i class="fa fa-user-circle-o text-primary mr-2" aria-hidden="true"></i>Cadastro de Usuário
                        </h1>
                        <div class="col-sm-12">
                            <form id="regForm" action="gerenciar_usuario.do" method="post">
                                <input type="hidden" name="tipo" value="inserir">
                                <input type="hidden" name="id" value="0">
                                <div class="tab"> 
                                    <div class="form-row">
                                        <div class="form-group col-sm-6">
                                            <label for="inputNome">Nome</label>
                                            <input class="form-control" type="text" name="nome" required>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="inputSobrenome">Sobrenome</label>
                                            <input class="form-control" type="text" id="inputSobrenome" name="sobrenome" required>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-sm-6">
                                            <label for="inputCpf">CPF</label>
                                            <input id="cpf" class="form-control" type="text" maxlength="14" onkeypress="formatar(this,'000.000.000-00')" id="inputCpf" name="cpf" required>
                                        </div>

                                        <div class="form-group col-sm-3">
                                            <label for="inputDataNasc">Data de Nascimento</label>
                                            <input class="form-control" type="date" id="inputDataNasc" name="data_nascimento" required>
                                        </div>

                                        <div class="form-group col-sm-3">
                                            <label for="inputDataNasc">Perfil</label>
                                            <select class="form-control" name="perfil" required>
                                                <%
                                                    for(Perfil p : listPerfil){
                                                %>
                                                    <option value="<%= p.getId() %>"><%= p.getNome() %></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-sm-6">
                                            <label class="custom-control-label">Sexo</label><br/>
                                            <label for="inputMasc">Masculino</label> <input class="custom-radio" type="radio" id="inputMasc" name="sexo" value="Masculino" checked>
                                            &nbsp;&nbsp;&nbsp;
                                            <label for="inputFem">Feminino</label> <input class="custom-radio" type="radio" id="inputFem" name="sexo" value="Feminino">
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
                                                    <input class="form-control" type="text" name="user" id="inputUser" required>
                                                </div>

                                                <div class="form-group col-sm-12">
                                                    <label for="inputPasswd">Senha</label>
                                                    <input class="form-control" type="password" name="senha" id="inputPasswd" required>
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
                                                    <input class="form-control" type="text" id="inputCidade" name="cidade" required>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group col-sm-6">
                                                    <label for="inputRua">Logradouro</label>
                                                    <input class="form-control" type="text" name="logradouro" id="inputRua" required>
                                                </div>

                                                <div class="form-group col-sm-3">
                                                    <label for="inputCasa">Nº Casa</label>
                                                    <input class="form-control" type="number" name="casa" min="0" value="0" id="inputCasa">
                                                </div>

                                                <div class="form-group col-sm-3">
                                                    <label for="inputApto">Nº Apto</label>
                                                    <input class="form-control" type="number" name="apto" min="0" value="0" id="inputApto">
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
                                                    <input onkeyup="mascara( this, mtel );" maxlength="15" id="cel" class="form-control" type="tel" id="inputTelCel" name="tel_celular" required>
                                                </div>

                                                <div class="form-group col-sm-6">
                                                    <label for="inputTelFixo">Tel. Fixo</label>
                                                    <input onkeyup="mascaraFixo( this, mtelFixo );" maxlength="14" id="tel" class="form-control" type="tel" id="inputTelCel" name="tel_fixo" required>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group col-sm-12">
                                                    <label for="inputEmail">E-mail</label>
                                                    <input onclick="IsEmail(this)" class="form-control" type="email" name="email" id="inputEmail">
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
    </body>
</html>
