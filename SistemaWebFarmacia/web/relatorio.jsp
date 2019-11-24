<%@page import="modelo.ItemVenda"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Calendar cal = Calendar.getInstance();
    int ano_atual = cal.get(Calendar.YEAR);
%>

<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatório</title>
        
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <!-- Bootstrap core CSS -->
        <link href="dashboard/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
        <!--Quick Seach-->
        <link rel="stylesheet" href="quick_seach/css/bootstrap.min.css">

        <style>
          .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
          }

          @media (min-width: 768px) {
            .bd-placeholder-img-lg {
              font-size: 3.5rem;
            }
          }
        </style>
        <!-- Custom styles for this template -->
        <link href="dashboard/css/dashboard.css" rel="stylesheet">
        
    </head>
    
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <%
            int qtd=0;
            int maior=0;
            int pega_mes=0;
            
            try{
                VendaDAO vDAO = new VendaDAO();
                for(int m=1; m<=12; m++){
                    qtd = vDAO.carregarVendasPorMesAno(m, ano_atual);
                    if(qtd>=maior){
                        maior=qtd;
                        pega_mes=m;
                    }
        %>
                <form>
                    <input type="hidden" id="mes<%= m %>" value="<%= qtd %>">
                </form>
        <%
                }
            }catch(Exception e){
                out.print("Erro: "+e);
            }
        %>
            
        <div class="container my-2 mb-5">
            <main role="main" class="mb-5">
                <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-5 border-bottom">
                    <h1 class="h4">Nº de vendas nos meses de Janeiro a Dezembro de <%= ano_atual %></h1>
                </div>

                <!--Chama o dashboard.js-->
                <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
            </main>
                
            <%
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/y");
                DecimalFormat df = new DecimalFormat("R$ #,##0.00");
                Venda v = new Venda();
                ArrayList itens = new ArrayList<ItemVenda>();
                ArrayList<Venda> vendas_id = new ArrayList<Venda>(); 
            %>
                
            <table class="table" id="tabela">
                <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-2 border-bottom">
                    <h1 class="h4">Medicamentos comprados no mês de maior quantidade de vendas</h1>
                </div>
                
                <div class="form-group input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input name="consulta" value="" id="txt_consulta" placeholder="Pesquise pelo nome do medicamento, quantidade ou valor unit. / total" type="text" class="form-control">
                </div>
                
                <thead class="">
                        <th scope="col">Medicamento</th>
                        <th scope="col">Qtd.</th>
                        <th scope="col" class="alinha-direita">Valor Unit.</th>
                        <th scope="col" class="alinha-direita">Valor Total</th>
                    </thead>
                    <%
                        try {
                            VendaDAO vDAO = new VendaDAO();
                            vendas_id = vDAO.carregarMaiorQtdVenda(pega_mes, ano_atual);
                            for(Venda venda : vendas_id){
                                v = vDAO.carregarPorId(venda.getId());
                                itens = vDAO.itensVenda(venda.getId());

                            for(ItemVenda i : v.getCarrinho()){
                    %>
                    <tbody class="">
                        <td><%= i.getMedicamento().getNome() %></td>
                        <td><%= i.getQtd() %></td>
                        <td class="alinha-direita"><%= df.format(i.getValor()) %></td>
                        <td class="alinha-direita"><%= df.format(i.getQtd()*i.getValor()) %></td>
                    </tbody>
                    <%
                                }
                            }
                        } catch (Exception e) {
                            out.print("Erro: "+e);
                        }
                    %>
            </table>
        </div>
        
        <%@include file="include/rodape.jsp" %>
        
        <script src="node_modules/jquery/dist/jquery.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
        
        <!--Drasboard-->
        <script src="dashboard/js/feather.min.js"></script>
        <script src="dashboard/js/Chart.min.js"></script>
        <script src="dashboard/js/dashboard.js"></script>
        
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
