<%@page import="modelo.Fornecedor"%>
<%@page import="modelo.FornecedorDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Fornecedor> listForn = new ArrayList<Fornecedor>();
    try {
        FornecedorDAO fDAO = new FornecedorDAO();
        listForn = fDAO.listar();
    } catch (Exception e) {
        out.print("Erro: "+e.getMessage());
    }
%>

<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Medicamento</title>
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
                <h4 class="centro">Cadastro de Medicamento</h4>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <div class="row">
                        <div class="col-sm-12">
                            <form action="gerenciar_medicamento.do" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="0">
                                <input type="hidden" name="tipo" value="inserir">

                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <label for="inputNomeMedicamento">Nome do Medicamento</label>
                                        <input class="form-control" type="text" id="inputNomeMedicamento" name="nome" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-sm-4">
                                        <label for="inputDataFab">Data de Fabricação</label>
                                        <input class="form-control" type="date" id="inputDataFab" name="data_fabricacao" required>
                                    </div>
                                    
                                    <div class="form-group col-sm-4">
                                        <label for="inputDataVal">Data de Validade</label>
                                        <input class="form-control" type="date" id="inputDataVal" name="data_validade" required>
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
                                        <input class="form-control" type="text" id="inputPrec" name="precaucoes" required>
                                    </div>
                                </div>
                                
                                <div class="form-row">
                                    <div class="form-group col-sm-6">
                                        <label for="inputObs">Laboratório</label>
                                        <input class="form-control" type="text" id="inputObs" name="laboratorio">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="inputObs">Composição</label>
                                        <input class="form-control" type="text" id="inputObs" name="composicao">
                                    </div>
                                </div>
                                
                                <div class="form-row">
                                    <div class="form-group col-sm-4">
                                        <label for="inputPreco">Preço</label>
                                        <input class="form-control" type="number" min="0" step="0.01" id="inputPreco" name="preco" required>
                                    </div>
                                    
                                    <div class="form-group col-sm-4">
                                        <label for="inputLote">Lote</label>
                                        <input class="form-control" type="number" min="0" value="1" id="inputLote" name="lote" required>
                                    </div>
                                    
                                    <div class="form-group col-sm-4">
                                        <label for="inputLote">Imagem</label>
                                        <input class="form-control-file" type="file" name="file" required>
                                    </div>
                                </div>
                                        
                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <label for="inputObs">Observaçao</label>
                                        <input class="form-control" type="text" id="inputObs" name="obs">
                                    </div>
                                </div>
                                
                                
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary display-1">Cadastrar Medicamento</button>
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
