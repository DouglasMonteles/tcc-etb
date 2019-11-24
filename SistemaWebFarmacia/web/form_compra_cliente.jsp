<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Medicamento"%>
<%@page import="modelo.MedicamentoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.ItemVenda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt-br">
    <head>
        <title>Compra de Medicamento</title>
        <meta charset="utf-8">
        <!--Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <!--Quick Seach-->
        <link rel="stylesheet" href="quick_seach/css/bootstrap.min.css">
        
        <script>
            function verificaCarrinho(qtd,id){
                if(qtd===0){
                    alert('Selecione algum medicamento!');
                }else{
                    location.href='form_finalizar_venda_cliente.jsp';
                }
            }
        </script>
    </head>

    <body class="bg-tela-principal">

        <!--Menu da Adm-->
        <%@ include file="include/menu_adm_cliente.jsp" %>
        
        <%
            int qtd;
            String tipo = "";
            tipo = request.getParameter("tipo");
            
            if("cancelar".equals(tipo)){
                session.removeAttribute("qtd");
            }
            
            if((Integer) session.getAttribute("qtd")==null){
                qtd=0;
            }else{
                qtd = (Integer) session.getAttribute("qtd");
            }
            
            DecimalFormat df = new DecimalFormat("R$ #,##0.00");
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/y");
            Venda v = new Venda();
            Cliente c = new Cliente();
            
            try {
                String op = request.getParameter("op");
                if("n".equals(op)){
                    c = (Cliente) session.getAttribute("sessionCliente");
                    v.setCliente(c);
                    v.setVendedor(null);
                    v.setCarrinho(new ArrayList<ItemVenda>());
                    session.setAttribute("venda", v);
                }else{
                    v = (Venda) session.getAttribute("venda");
                }
            } catch (Exception e) {
                out.print("Erro: "+e);
            }
        %>
        

    <div class="container text-center my-5">
        <%@ include file="include/alerts.jsp" %>
        
        <div class="row mx-4">
            <div class="text-center">
                Cliente: <strong><%= v.getCliente().getNome() %></strong>
            </div>
            <div class="ml-auto">
                <a onclick="verificaCarrinho(<%= qtd %>,<%= v.getCliente().getId() %>)" class="nav nav-link btn btn-primary" href="#">
                    <i class="fa fa-shopping-cart"></i>
                    <span class="badge badge-light">
                        <%= qtd %>
                    </span>
                    <span class="sr-only">unread messages</span>
                </a>
            </div>
        </div>
            
        <%
            List<Medicamento> listMed = new ArrayList<Medicamento>();
            try {
                MedicamentoDAO mDAO = new MedicamentoDAO();
                listMed = mDAO.listar();
            } catch (Exception e) {
                out.print("Erro: "+e);
            }
        %>
            
        <div class="container mt-5">
            <div class="form-group input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input name="consulta" value="" id="txt_consulta" placeholder="Pesquise pelo nome do medicamento" type="text" class="form-control">
            </div>
            
            <div class="row justify-content-md-center">
                
                    <%
                        for(Medicamento m : listMed){
                    %>
                    <div class="col-sm-6 col-md-4 my-3">
                        <div id="card-produto" class="card mb-5">
                            <% if(m.getFile() != null){ %>
                                <img src="img/<%= m.getFile() %>" class="card-img-top" style="height: 200px">
                            <% }else{ %>
                                <img src="img/med.png" class="card-img-top" style="height: 200px">
                            <% } %>

                            <div class="card-body" style="text-align: left">
                                <h4 class="card-title"><%= m.getNome() %></h4>
                                <h6 class="card-sub-title my-3 text-muted">Validade: <%= sdf.format(m.getDataValidade()) %></h6>
                                <p class="card-text" style="color: green"><strong><%= df.format(m.getPreco()) %></strong></p>
                            </div>
                            
                            <div class="card-footer">
                                <form method="get" action="gerenciar_carrinho.do">
                                    <input type="hidden" name="medicamento_id" value="<%=m.getId() %>"/>
                                    <input type="hidden" name="op" value="add_c"/>
                                    <input type="hidden" name="qtd" value="<%= qtd %>"/>
                                    
                                    <div class="row col-sm-12">
                                        <div class="col-sm-3">
                                            Qtd.
                                        </div>
                                        <div class="col-sm-6">
                                            <input id="qtd" class="form-control text-center" type="number" value="1" min="1" name="quantidade" required/>
                                        </div>
                                        <div class="col-sm-3">
                                            
                                        </div>
                                    </div>
                                    <button class="mt-2 btn btn-primary btn-block" type="submit" value="ADD">Add ao Carrinho</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                
            </div>
        </div>
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
            $('input#txt_consulta').quicksearch('div#card-produto');
        </script>
    </body>
</html>
