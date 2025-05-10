<%@page import="modelo.ImagemDAO"%>
<%@page import="modelo.Imagem"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/y");
    Usuario u = new Usuario();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        UsuarioDAO uDAO = new UsuarioDAO();
        u = uDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro: "+e);
    }
%>

<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dados do Usuário</title>
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
    </head>
    
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <div class="container justify-content-center my-5" style="border: 1px solid #000; width: 40%">
            <div class="row justify-content-center">
                <%
                    if(u.getImagem().getId() > 0){
                %>
                <img class="img-perfil-info" src="img/<%= u.getImagem().getFile() %>">
                <%
                    }else{
                %>
                    <img class="img-perfil-info" src="img/perfil-user.png">
                <%
                    }
                %>
            </div>
            
            <div class="row justify-content-center my-4">
                <h3 class="h3">Dados Pessoais</h3>
            </div>
            
            <table class="table">
                <thead>
                    <th>Nome</th>
                    <th>Sobrenome</th>
                    <th>CPF</th>
                </thead>
                <tbody>
                    <td><%= u.getNome() %></td>
                    <td><%= u.getSobrenome()%></td>
                    <td><%= u.getCpf() %></td>
                </tbody>
                
                <thead>
                    <th>Data Nascimento</th>
                    <th>Sexo</th>
                </thead>
                <tbody>
                <td><%= sdf.format(u.getData_Nasc())%></td>
                    <td><%= u.getSexo()%></td>
                </tbody>
                
                <thead>
                    <th>Usuário</th>
                    <th>Senha</th>
                </thead>
                <tbody>
                    <td><%= u.getUser()%></td>
                    <td><%= u.getSenha()%></td>
                </tbody>
                
                <thead>
                    <th>Cidade</th>
                    <th>Logradouro</th>
                    <th>Casa</th>
                    <th>Apto</th>
                </thead>
                <tbody>
                    <td><%= u.getCidade() %></td>
                    <td><%= u.getLogradouro()%></td>
                    <td><%= u.getCasa() %></td>
                    <td><%= u.getApto() %></td>
                </tbody>
                
                <thead>
                    <th>Tel. Celular</th>
                    <th>Tel. Fixo</th>
                    <th>E-mail</th>
                </thead>
                <tbody>
                    <td><%= u.getTelCelular() %></td>
                    <td><%= u.getTelFixo()%></td>
                    <td><%= u.getEmail() %></td>
                </tbody>
            </table>
        </div>
        <%@include file="include/rodape.jsp" %>
        
        <script src="node_modules/jquery/dist/jquery.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
    </body>
</html>
