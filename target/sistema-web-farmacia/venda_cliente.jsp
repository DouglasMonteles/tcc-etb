<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.removeAttribute("qtd");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    VendaDAO vDAO = new VendaDAO();
    ArrayList<Venda> listVenda = new ArrayList<Venda>();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        listVenda = vDAO.listarVendasCliente(id);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catálogo de Compras</title>
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <!--Quick Seach-->
        <link rel="stylesheet" href="quick_seach/css/bootstrap.min.css">
        
        <script>
            function verificaVenda(id,aux,aux2){
                if(aux===true && aux2===true){
                    location.href='recibo_venda_cliente.jsp?id='+id;
                }else{
                    alert('Efetue o pagamento da compra se dirigindo até a farmácia Santa Cruz');
                }
            }
            
            function cancelar(id,cliente_id){
                if(window.confirm('Tem certeza que deseja cancelar esta compra?')){
                    location.href='registrar_situacao_venda.do?id='+id+'&id_cliente='+cliente_id+'&tipo=cancelarByCliente';
                }
            }
        </script>
        
    </head>
    <body>
        <%@include file="include/menu_adm_cliente.jsp" %>
        
        <div class="container my-5">            <div class="row justify-content-center mt-2 mb-5">
                <h3><i class="fa fa-dollar"></i> Compras Ralizadas</h3>
            </div>
            
            <div class="form-group input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input name="consulta" value="" id="txt_consulta" placeholder="Pesquise pelo nome do vendedor ou pela data da compra" type="text" class="form-control">
            </div>
            
            <%@include file="include/alerts.jsp" %>
            
            <table class="table sombra table-hover" id="tabela">
                <thead class="thead-dark">
                    <th scope="col">Id</th>
                    <th scope="col">Cliente</th>
                    <th scope="col">Vendedor</th>
                    <th scope="col">Data</th>
                    <th class="text-center" scope="col">Cancelar</th>
                    <th class="text-center" scope="col">Recibo</th>
                </thead>
                
                <%
                    for(Venda v : listVenda){   
                %>
                <tbody class="tabela-ativa">
                    <td><%= v.getId() %></td>
                    <td><%= v.getCliente().getNome() %></td>
                    <td>
                        <% 
                            boolean aux = true;
                            boolean aux2 = true;
                            if(v.getVendedor().getNome()==null){
                                out.print("<span style='color: orange'>Dirija-se a farmácia Santa Cruz para finalizar a compra, <a href='logout.jsp'>mais info...</a></span>");
                                aux=false;
                            } else {
                                out.print(v.getVendedor().getNome());
                            }
                            if(v.getDataPagamento()==null){
                                aux2=false;
                            }
                        %>
                    </td>
                    <td><%= sdf.format(v.getDataVenda()) %></td>
                    <td class="text-center justify-content-center">
                        <% if(v.getDataPagamento()==null && v.getDataEntrega()==null){ %>
                        <a onclick="cancelar(<%= v.getId() %>,<%= v.getCliente().getId() %>)" href="#"><img class="icones mr-3" src="img/cancelar.png"></a>
                        <% }else{ %>
                            <img style="width: 30px; height: 30px" src="img/carteira.png">
                        <% } %>
                    </td>
                    <td class="text-center">
                        <a onclick="verificaVenda(<%= v.getId() %>,<%= aux %>,<%= aux2 %>)" href="#"><img class="icones" src="img/recibo.png"></a>
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
