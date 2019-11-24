<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Medicamento"%>
<%@page import="modelo.MedicamentoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/y");
    DecimalFormat df = new DecimalFormat("R$ #,##0.00");
    List<Medicamento> listMed = new ArrayList<Medicamento>();
     
    try{
        MedicamentoDAO mDAO = new MedicamentoDAO();
        listMed = mDAO.listar();
    }catch(Exception e){
        out.print("Erro: "+e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medicamentos</title>
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <!--Quick Seach-->
        <link rel="stylesheet" href="quick_seach/css/bootstrap.min.css">
        
        <script>
            function excluir(id, nome){
                if(window.confirm('Ter certeza que deseja excluir '+nome+'?')){
                    location.href='gerenciar_medicamento.do?id='+id+'&tipo=excluir';
                }
            }
        </script>
        
    </head>
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <div class="container my-5">
            <div class="row"> 
                <a class="ml-auto mx-4 mb-4" href="form_cadastro_medicamento.jsp">
                    <i class="fa fa-plus"></i>
                    <i class="fa fa-medkit"></i>
                </a>
            </div>
            
            <%@include file="include/alerts.jsp" %>
            
            <div class="form-group input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input name="consulta" value="" id="txt_consulta" placeholder="Pesquise pelo nome do medicamento, indicação, valor ou validade" type="text" class="form-control">
            </div>
            
            <table id="tabela" class="table sombra">
                <thead class="thead-dark">
                    <th scope="col">Nome</th>
                    <th scope="col">Indicação</th>
                    <th scope="col">Valor</th>
                    <th scope="col">Validade</th>
                    <th class="text-center" scope="col">Opções</th>
                </thead>
                
                <%
                    for(Medicamento m : listMed){   
                %>
                
                <tbody class="tabela-ativa">
                    <td><%= m.getNome() %></td>
                    <td><%= m.getIndicacao() %></td>
                    <td><%= df.format(m.getPreco()) %></td>
                    <td><%= sdf.format(m.getDataValidade()) %></td>
                    <td class="text-center">
                        <a class="mr-3" href="form_altera_medicamento.jsp?id=<%= m.getId() %>"><i class="fa fa-edit"></i></a>
                        <a href="#" onclick="excluir(<%= m.getId() %>, '<%= m.getNome() %>')"><i class="fa fa-trash"></i></a>
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
