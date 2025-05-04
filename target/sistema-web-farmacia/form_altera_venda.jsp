<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.VendaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Usuario> listUser = new ArrayList<Usuario>();
    List<Cliente> listCliente = new ArrayList<Cliente>();
    Venda v = new Venda();
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        VendaDAO VendaDAO = new VendaDAO();
        v = VendaDAO.carregarPorId(id);
        UsuarioDAO uDAO = new UsuarioDAO();
        listUser = uDAO.listar();
        ClienteDAO cDAO = new ClienteDAO();
        listCliente = cDAO.listar();
    }catch(Exception e){
        out.print("Erro: "+e.getMessage());
    }
%>

<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Venda</title>
        <!--Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
    </head>
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <div class="container my-5">
            
            <div class="row mt-5 mb-4">
                <h4 class="centro">Alteração de Venda</h4>
            </div>
            
            <%@include file="include/alerts.jsp" %>
            
            <div class="row justify-content-center">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <div class="row">
                        <div class="col-sm-12">
                            <form action="registrar_situacao_venda.do" method="post">
                                <input type="hidden" name="id" value="<%= v.getId() %>">
                                <input type="hidden" name="cliente_id" value="<%= v.getCliente().getId() %>">
                                <input type="hidden" name="vendedor_id" value="<%= v.getVendedor().getId() %>">
                                <input type="hidden" name="tipo" value="alterar">
                                
                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <h5>Id: <%= v.getId() %></h5>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-sm-4">
                                        <label for="inputDV">Data da Venda</label>
                                        <input class="form-control" type="date" id="inputDV" name="data_venda" value="<%= v.getDataVenda() %>" required>
                                    </div>
                                    
                                    <div class="form-group col-sm-4">
                                        <label for="inputDC">Data de Entrega</label>
                                        <input class="form-control" type="date" id="inputDC" name="data_entrega" value="<%= v.getDataEntrega() %>" required>
                                    </div>
                                    
                                    <div class="form-group col-sm-4">
                                        <label for="inputDP">Data de Pagamento</label>
                                        <input class="form-control" type="date" id="inputDP" name="data_pagamento" value="<%= v.getDataPagamento() %>" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-sm-6">
                                        <label for="inputVendedor">Vendedor</label>
                                        <select class="form-control" name="vendedor_id" required>
                                            <%
                                                for(Usuario u : listUser){
                                                String esc="";
                                                if(v.getVendedor().getId()==u.getId()){
                                                    esc="selected";
                                                }
                                            %>
                                            <option <%= esc %> value="<%= u.getId() %>"><%= u.getNome() %></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                
                                    <div class="form-group col-sm-6">
                                        <label for="inputCliente">Cliente</label>
                                        <select class="form-control" name="cliente_id" required>
                                            <%
                                                for(Cliente c : listCliente){
                                                String esc="";
                                                if(v.getCliente().getId()==c.getId()){
                                                    esc="selected";
                                                }
                                            %>
                                            <option <%= esc %> value="<%= c.getId() %>"><%= c.getNome() %></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary display-1">Alterar Venda</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     
        <%@include file="include/rodape.jsp" %>
        
        <script src="node_modules/jquery/dist/jquery.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
    </body>
</html>
