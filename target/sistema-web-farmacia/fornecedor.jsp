<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.FornecedorDAO"%>
<%@page import="modelo.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<Fornecedor> listFornecedor = new ArrayList<Fornecedor>();
    try{
        FornecedorDAO fDAO = new FornecedorDAO();
        listFornecedor = fDAO.listar();
    }catch(Exception e){
        out.print("Erro: "+e);
    }
%>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fornecedores</title>
        
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <!--Quick Seach-->
        <link rel="stylesheet" href="quick_seach/css/bootstrap.min.css">
        
        <!--funcao para exluir-->
        <script type="text/javascript">
            function excluir(id, nome){
                if(window.confirm('Tem certeza que deseja apagar '+nome+'?')){
                    location.href='gerenciar_fornecedor.do?id='+id+'&tipo=excluir';
                }
            }
        </script>
        
    </head>
    
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <div class="container my-5">
            <div class="row">  
                <a class="ml-auto mx-4 mb-4" href="form_cadastro_fornecedor.jsp">
                    <i class="fa fa-plus"></i>
                    <i class="fa fa-truck"></i>
                </a>
            </div>
            
            <div class="form-group input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input name="consulta" value="" id="txt_consulta" placeholder="Pesquise pelo nome do fornecedor ou pelo CNPJ" type="text" class="form-control">
            </div>
            
            <%@include file="include/alerts.jsp" %>
            
            <table id="tabela" class="table sombra">
                <thead class="thead-dark">
                    <th scope="col">Nome</th>
                    <th scope="col">CNPJ</th>
                    <th class="text-center" scope="col">Opções</th>
                </thead>
                
                <%
                    for(Fornecedor f : listFornecedor){    
                %>
                
                <tbody class="tabela-ativa">
                    <td><%= f.getNome() %></td>
                    <td><%= f.getCnpj() %></td>
                    <td class="text-center">
                        <a class="mr-3" href="form_altera_fornecedor.jsp?id=<%= f.getId() %>"><i class="fa fa-edit"></i></a>
                        <a href="#" onclick="excluir(<%= f.getId() %>, '<%= f.getNome() %>')"><i class="fa fa-trash"></i></a>
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
        
        <!--Quick Search-->
        <script src="quick_search/js/jquery-3.1.1.js"></script>
	<script src="quick_search/js/bootstrap.min.js"></script>	
	<script src="quick_search/js/jquery.quicksearch.js"></script>
        
        <script>
            //QuickSearch
            $('input#txt_consulta').quicksearch('table#tabela tbody');
        </script>
    </body>
</html>
