<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("qtd") != null){
        session.removeAttribute("qtd");
    }
    
    List<Cliente> listCliente = new ArrayList<Cliente>();
    try{
        ClienteDAO cDAO = new ClienteDAO();
        listCliente = cDAO.listar();
    }catch(Exception e){
        out.print("Erro: "+e);
    }
%>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <!--Quick Seach-->
        <link rel="stylesheet" href="quick_seach/css/bootstrap.min.css">
        
        <!--funcao para exluir-->
        <script type="text/javascript">
            function excluir(id, nome){
                if(window.confirm('Tem certeza que deseja apagar '+nome+'?')){
                    location.href='gerenciar_cliente.do?id='+id+'&tipo=excluir';
                }
            }
            
            function pegaId(id){
                document.getElementById('modal_id').value=id;
            }
        </script>
        
    </head>
    
    <body>
        <%@include file="include/menu_adm.jsp" %>
        
        <div class="container my-5">
            <div class="row"> 
                <a class="ml-auto mx-4 mb-4" href="form_cadastro_cliente.jsp"><i class="fa fa-plus"></i> <i class="fa fa-user-circle"></i></a>
            </div>
            
            <div class="form-group input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input name="consulta" value="" id="txt_consulta" placeholder="Pesquise pelo nome do cliente ou CPF" type="text" class="form-control">
            </div>
            
            <%@include file="include/alerts.jsp" %>
            
            <table id="tabela" class="table sombra">
                <thead class="thead-dark">
                    <th scope="col">Nome</th>
                    <th scope="col">CPF</th>
                    <th class="text-center" scope="col">Opções</th>
                </thead>
                
                <%
                    for(Cliente c : listCliente){    
                %>
                
                <tbody class="tabela-ativa">
                    <td><%= c.getNome() %></td>
                    <td><%= c.getCpf() %></td>
                    <td class="text-center">
                        <a href="form_altera_cliente.jsp?id=<%= c.getId() %>"><i class="fa fa-edit"></i></a>
                        <a class="mx-3" href="#" onclick="excluir(<%= c.getId() %>, '<%= c.getNome() %>')"><i class="fa fa-trash"></i></a>
                        <a href="form_compra.jsp?id=<%= c.getId() %>&op=n"><i class="fa fa-dollar"></i></a>
                        <a onclick="pegaId(<%= c.getId() %>)" class="mx-2" href="#" data-toggle="modal" data-target="#modalImg"><i class="fa fa-user"></i></a>
                    </td>
                </tbody>
                
                <%
                    }
                %>
            </table>
        </div>
            
        <!--Modal Img-->
        <div class="modal fade" id="modalImg" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="row justify-content-center my-2">
                        <h1 class="display-3">
                            <i class="fa fa-user-o"></i>
                        </h1>
                    </div>

                    <div class="modal-header">
                        <h5 class="modal-title ml-auto mr-auto">Adicionar foto</h5>
                    </div>

                    <div class="modal-body"> 
                        <div class="container">
                            <div class="col-sm-12">
                                <form method="post" action="UploadImagem" enctype="multipart/form-data">
                                    <input type="hidden" id="modal_id" name="id">
                                    <input type="hidden" name="tipo" value="img_cliente">
                                    <div class="form-group col-sm-12">
                                        <label>Foto</label>
                                        <input class="form-control-file" type="file" name="file" required>
                                    </div>
                                    <div class="form-group col-sm-12">
                                        <button class="btn btn-dark btn-block" type="submit">Adicionar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    </div>
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
            $('input#txt_consulta').quicksearch('table#tabela tbody');
        </script>
    </body>
</html>
