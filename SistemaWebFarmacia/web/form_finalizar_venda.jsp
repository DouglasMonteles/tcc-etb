<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.ItemVenda"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Venda"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if((Integer)session.getAttribute("qtd")==0){
        response.sendRedirect("form_compra.jsp?op=n");
    }
    DecimalFormat df = new DecimalFormat("R$ #,##0.00");
    Venda v = new Venda();
    Cliente c = new Cliente();
    try{
        v = (Venda) session.getAttribute("venda");
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finalizar Compra</title>
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <script>
            function excluir(index,item,qtd){
                if(confirm("Tem certeza que quer excluir o item: "+item+"?")){
                    window.open("gerenciar_carrinho.do?op=del&qtd="+qtd+"&index="+index,"_self");
                }
            }

        </script>
        
    </head>
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <div class="container my-5">
            
            <%@include file="include/alerts.jsp" %>
            
            <table class="table sombra mt-2">
                <thead class="thead-dark">
                    <th scope="col">Item</th>
                    <th scope="col">Medicamento</th>
                    <th scope="col">Qtd.</th>
                    <th scope="col">Valor Unt.</th>
                    <th scope="col">Valor Total</th>
                    <th class="text-center" scope="col">Remover</th>
                </thead>
                
                <%
                    int qtd = (Integer) session.getAttribute("qtd");
                    double total = 0;
                    int cont=0;
                    for(ItemVenda i : v.getCarrinho()){
                %>
                
                <tbody class="tabela-ativa">
                    <td><%= cont+1 %></td>
                    <td><%= i.getMedicamento().getNome() %></td>
                    <td><%= i.getQtd() %></td>
                    <td><%= df.format(i.getValor()) %></td>
                    <td><%= df.format(i.getQtd()*i.getValor()) %></td>
                    <td class="text-center">
                        <a href="#" onclick="excluir(<%=cont %>,<%=cont+1 %>,<%= qtd %>);"><i class="fa fa-trash"></i></a>
                    </td>
                </tbody>
                
                <%
                        total = total + (i.getQtd()*i.getValor());
                        cont++;
                    }
                %>
            </table>
            
            <div class="row col-sm-12 mt-2">
                <div class="col-sm-6">
                    Valor Total: <strong style="color: green"><%= df.format(total) %></strong>
                </div>
            </div>
                
            <div class="row mt-2 text-center col-sm-12">
                <div class="col-sm-4">
                    <a href="cliente.jsp">
                        <button class="btn btn-danger"><i class="fa fa-ban"></i> Cancelar</button>
                    </a> 
                </div>
                
                <div class="col-sm-4">
                    <a href="form_compra.jsp?op=c">
                        <button class="btn btn-secondary"><i class="fa fa-shopping-cart"></i> Continuar Comprando</button>
                    </a> 
                </div>
                
                <div class="col-sm-4">
                    <a href="finalizar_venda.do?tipo=vendedor">
                        <button class="btn btn-success"><i class="fa fa-money"></i> Finalizar</button>
                    </a>
                </div>
            </div>
        </div>
        
        <%@include file="include/rodape.jsp" %>
        
        <script src="node_modules/jquery/dist/jquery.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
    </body>
</html>
