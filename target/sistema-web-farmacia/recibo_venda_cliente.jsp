<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.Cliente"%>
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
    DecimalFormat df = new DecimalFormat("R$ #,##0.00");
    Venda v = new Venda();
    ArrayList itens = new ArrayList<ItemVenda>();
    
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        VendaDAO vDAO = new VendaDAO();
        v = vDAO.carregarPorId(id);
        itens = vDAO.itensVenda(id);
    } catch (Exception e) {
        out.print("Erro: "+e);
    }
%>

<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recibo</title>
        
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
    </head>
    
    <body>
        <%@include file="include/menu_adm_cliente.jsp" %>
        
        <div class="container justify-content-center my-5 bg-recibo-1">
            <div class="bg-recibo-2">
                <div class="row justify-content-center">
                    <h3 class="h3"><i class="fa fa-book"></i> Recibo</h3>
                </div>
                
                <table class="table">
                    <thead class="text-center">
                        <th scope="col">Cliente</th>
                        <th scope="col">CPF</th>
                        <th scope="col">Vendedor</th>
                        <th scope="col">ID</th>
                        <th></th>
                    </thead>

                    <tbody class="text-center">
                        <td><%= v.getCliente().getNome()%></td>
                        <td><%= v.getCliente().getCpf()%></td>
                        <td><%= v.getVendedor().getNome() %></td>
                        <td><%= v.getVendedor().getId()%></td>
                    </tbody>
                
                    <thead class="text-center">
                        <th scope="col">Id Venda</th>
                        <th scope="col">Realizada</th>
                        <th scope="col">Pagamento</th>
                        <th scope="col">Entrega</th>
                    </thead>

                    <tbody class="text-center">
                        <td><%= v.getId() %></td>
                        <td><%= sdf.format(v.getDataVenda()) %></td>
                        <td><%= sdf.format(v.getDataPagamento()) %></td>
                        <td><%= sdf.format(v.getDataEntrega()) %></td>
                    </tbody>
                
                    <thead class="">
                        <th scope="col">Medicamento</th>
                        <th scope="col">Qtd.</th>
                        <th scope="col" class="alinha-direita">Valor Unit.</th>
                        <th scope="col" class="alinha-direita">Valor Total</th>
                    </thead>
                    <%
                        Double totCompra=0.00;
                        for(ItemVenda i : v.getCarrinho()){
                    %>
                    <tbody class="">
                        <td><%= i.getMedicamento().getNome() %></td>
                        <td><%= i.getQtd() %></td>
                        <td class="alinha-direita"><%= df.format(i.getValor()) %></td>
                        <td class="alinha-direita"><%= df.format(i.getQtd()*i.getValor()) %></td>
                    </tbody>
                    <%
                            totCompra+=(i.getQtd()*i.getValor());
                        }
                    %>
                    <thead class="">
                        <th></th>
                        <th></th>
                        <th></th>
                        <th scope="col" class="alinha-direita">Total da Compra: </th>
                    </thead>
                    <tbody class="">
                        <th></th>
                        <th></th>
                        <th></th>
                        <td class="alinha-direita"><%= df.format(totCompra) %></td>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="container my-3 no-print">
            <div class="row" style="margin-right: 16%">
                <button type="button" class="btn btn-primary ml-auto" onclick="print()"><img src="img/imprimir.png"> Imprimir</button>
            </div>
        </div>
        
        <%@include file="include/rodape.jsp" %>
        
        <script src="node_modules/jquery/dist/jquery.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
    </body>
</html>