<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    VendaDAO vDAO = new VendaDAO();
    ArrayList<Venda> listVenda = new ArrayList<Venda>();
    try{
        listVenda = vDAO.listar();
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendas</title>
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <!--Quick Seach-->
        <link rel="stylesheet" href="quick_seach/css/bootstrap.min.css">	
        
        <script>
            function verificaVenda(id,aux_vendedor,aux_entrega){
                if(aux_vendedor===true && aux_entrega===true){
                    location.href='recibo_venda.jsp?id='+id;
                }else{
                    alert('Confirme a situação de pagamento e entrega da compra!');
                }
            }
        </script>
    </head>
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <div class="container my-5">
            <div class="row justify-content-center mt-2 mb-5">
                <h3><i class="fa fa-dollar"></i> Vendas Ralizadas</h3>
            </div>
            
            <div class="form-group input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input name="consulta" value="" id="txt_consulta" placeholder="Pesquise pelo nome do cliente, vendedor ou data da compra" type="text" class="form-control">
            </div>
            
            <%@include file="include/alerts.jsp" %>
            
            <table class="table sombra table-hover" id="tabela">
                <thead class="thead-dark">
                    <th scope="col">Id</th>
                    <th scope="col">Cliente</th>
                    <th scope="col">Vendedor</th>
                    <th scope="col">Data</th>
                    <th class="text-center" scope="col">Opções</th>
                </thead>
                
                <%
                    for(Venda v : listVenda){   
                %>
                
                <tbody class="tabela-ativa">
                    <td><%= v.getId() %></td>
                    <td><%= v.getCliente().getNome() %></td>
                    <td>
                        <%
                            if(v.getVendedor().getNome()==null){
                                out.print("<span style='color: orange'>Aguardando Pagamento</span>");
                            } else {
                                out.print(v.getVendedor().getNome());
                            }
                        %>
                    </td>
                    <td><%= sdf.format(v.getDataVenda()) %></td>
                    <td class="text-center">
                        <%
                            boolean aux_vendedor=true;
                            if(v.getDataPagamento()==null){
                                if(v.getVendedor().getNome()==null){ 
                                    aux_vendedor=false;%>
                                    <a class="mr-3" href="registrar_situacao_venda.do?id=<%=v.getId() %>&vendedor_id=<%= user.getId() %>&tipo=e_pagamento"><img class="icones" src="img/pagamento.png"></a>
                                <%}else{
                        %>
                                    <a class="mr-3" href="registrar_situacao_venda.do?id=<%=v.getId() %>&tipo=pagamento"><img class="icones" src="img/pagamento.png"></a> 
                        <%
                                }
                            }else{
                        %>
                                <img class="icones mr-3" src="img/pago.png">
                        <%
                            }
                        %>
                        
                        <%
                            boolean aux_entrega=true;
                            if(v.getDataEntrega()==null){
                                aux_entrega=false;
                        %>
                        <a class="mr-3" href="registrar_situacao_venda.do?id=<%=v.getId() %>&tipo=entrega"><img class="icones" src="img/entrega.png"></a> 
                        <%
                            }else{
                        %>
                            <img class="icones mr-3" src="img/entregue.png">
                        <%
                            }
                        %>
                        
                        <a onclick="verificaVenda(<%= v.getId() %>,<%= aux_vendedor %>,<%= aux_entrega %>)" href="#"><img class="icones" src="img/recibo.png"></a>
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
