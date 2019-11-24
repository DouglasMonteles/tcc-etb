<%@page import="modelo.FornecedorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Fornecedor"%>
<%@page import="modelo.Medicamento"%>
<%@page import="modelo.MedicamentoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Medicamento m = new Medicamento();
    List<Fornecedor> listForn = new ArrayList<Fornecedor>();
    try {
        int id = Integer.parseInt(request.getParameter("id")); 
        MedicamentoDAO mDAO = new MedicamentoDAO();
        m = mDAO.carregarPorId(id);
        FornecedorDAO fDAO = new FornecedorDAO();
        listForn = fDAO.listar();
    } catch (Exception e) {
        out.print("Erro: "+e.getMessage());
    }
%>

<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Medicamento</title>
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
                <h4 class="centro">Alteraração de Medicamento</h4>
            </div>
            
            <%@include file="include/alerts.jsp" %>
            
            <div class="row justify-content-center">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <div class="row">
                        <div class="col-sm-12">
                            <form action="gerenciar_medicamento.do" method="post">
                                <input type="hidden" name="id" value="<%= m.getId() %>">
                                <input type="hidden" name="tipo" value="alterar">

                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <label for="inputNomeMedicamento">Nome do Medicamento</label>
                                        <input class="form-control" type="text" id="inputNomeMedicamento" name="nome" value="<%= m.getNome() %>" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-sm-4">
                                        <label for="inputDataFab">Data de Fabricação</label>
                                        <input class="form-control" type="date" id="inputDataFab" name="data_fabricacao" value="<%= m.getDataFabricacao() %>" required>
                                    </div>
                                    
                                    <div class="form-group col-sm-4">
                                        <label for="inputDataVal">Data de Validade</label>
                                        <input class="form-control" type="date" id="inputDataVal" name="data_validade" value="<%= m.getDataValidade() %>" required>
                                    </div>
                                    
                                    <div class="form-group col-sm-4">
                                        <label for="inputIndicacao">Indicaçao</label>
                                        <select class="form-control" id="inputIndicacao" name="indicacao" required>
                                            <option value="Uso Pediátrico">Uso Pediátrico</option>
                                            <option value="Uso Adulto">Uso Adulto</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <label for="inputPrec">Precauções</label>
                                        <input class="form-control" type="text" id="inputPrec" name="precaucoes" value="<%= m.getPrecaucoes()%>" required>
                                    </div>
                                </div>
                                
                                <div class="form-row">
                                    <div class="form-group col-sm-6">
                                        <label for="inputPreco">Preço</label>
                                        <input class="form-control" type="number" min="0" step="0.01" id="inputPreco" name="preco" value="<%= m.getPreco()%>" required>
                                    </div>
                                    
                                    <div class="form-group col-sm-6">
                                        <label for="inputLote">Lote</label>
                                        <input class="form-control" type="number" min="0" id="inputLote" name="lote" value="<%= m.getLote() %>" required>
                                    </div>
                                </div>
                                        
                                <div class="form-row">
                                    <div class="form-group col-sm-6">
                                        <label for="inputObs">Laboratório</label>
                                        <input class="form-control" type="text" id="inputObs" name="laboratorio" value="<%= m.getLaboratorio()%>">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputObs">Composição</label>
                                        <input class="form-control" type="text" id="inputObs" name="composicao" value="<%= m.getComposicao()%>">
                                    </div>
                                </div>
                                        
                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <label for="inputObs">Observaçao</label>
                                        <input class="form-control" type="text" id="inputObs" name="obs" value="<%= m.getObs() %>">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary display-1">Alterar Medicamento</button>
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
