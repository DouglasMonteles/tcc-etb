<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelo.MedicamentoDAO"%>
<%@page import="modelo.Medicamento"%>
<%@page import="java.util.ArrayList"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/y");
    DecimalFormat df = new DecimalFormat("R$ #,##0.00");
    if(session.getAttribute("sessionUser") != null){
        response.sendRedirect("administracao.jsp");
    }
    
    if(session.getAttribute("qtd") != null){
        session.removeAttribute("qtd");
    }
    
    List<Medicamento> list = new ArrayList<Medicamento>();
    try {
         MedicamentoDAO mDAO = new MedicamentoDAO();
         list = mDAO.listar();
    } catch (Exception e) {
        out.print("Erro: "+e);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Sistema Web Farmácia</title>
        <meta charset="utf-8">
        <!--Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <!--Font-awesome-->
        <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
        
        <!--Mascara-->
        <link href="dashboard/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
    </head>

    <body class="bg-tela-principal">
        
    <!--Menu-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-1">

        <div class="container">
            <a class="navbar-brand h1 mb-1" href="#">Farmácia Santa Cruz</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSite">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!--Ligação do botao de menu-->
            <div class="collapse navbar-collapse" id="navbarSite">
                
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="#" class="text-white nav-link mr-2 nav-sublinhado" data-toggle="modal" data-target="#modalContatos">
                            <i class="fa fa-phone"></i> Contatos
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="text-white nav-link mr-2 nav-sublinhado" href="#" data-toggle="modal" data-target="#modalSobre">
                            <i class="fa fa-info"></i> Sobre
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="text-white nav-link mr-2 nav-sublinhado" href="#" data-toggle="modal" data-target="#modalCliente">
                            <i class="fa fa-user-circle"></i> Área do Cliente
                        </a>
                    </li>
                </ul>
            
            </div>
            
            <div class="row">
                <div class="ml-auto nav-item ">
                    <a class="text-white nav-link nav-sublinhado" href="#" data-toggle="modal" data-target="#modalColaborador">
                        <i class="fa fa-user-o"></i> Área do Colaborador
                    </a>
                </div>
            </div>
        </div>
    </nav>
        
        
    <!--Carousel-->
    <div class="carousel slide" id="carouselSite" data-ride="carousel">
            <!--Indicadores do slide-->
            <ol class="carousel-indicators">
                <li target="#carouselSite" data-slide-to="0" class="active"></li>
                <li target="#carouselSite" data-slide-to="1"></li>
            </ol>

            <!--Imagens e texto do carrossel-->
            <div class="carousel-inner">

                <div class="carousel-item active">
                    
                    <img src="img/santa-cruz.jpg" class="img-fluid d-block img-carousel">
                    
                </div>

                <div class="carousel-item">
                    <img src="img/tabela_periodica_farmacia.jpg" class="img-fluid d-block img-carousel">

                    <!--<div class="carousel-caption d-done d-md-block text-white">
                        <h1></h1>
                        <p class="lead">Texto do slide</p>
                    </div>-->
                </div>
            </div>
            <!--Botoes de ir e voltar-->
            <a class="carousel-control-prev" href="#carouselSite" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
                <span class="sr-only">Anterior</span>
            </a>

            <a class="carousel-control-next" href="#carouselSite" role="button" data-slide="next">
                <span class="carousel-control-next-icon"></span>
                <span class="sr-only">Proximo</span>
            </a>
        </div>

        <!--Cards-->
        <div class="container mt-5">
            <!--Centraliza os elementos com a tela pequena-->
            <div class="row justify-content-sm-center">
                <%
                    int cont=0;
                    for(Medicamento m : list){
                %>
                <div class="col-sm-6 col-md-4">
                    <div class="card mb-5">
                        <% if(m.getFile() != null){ %>
                            <img src="img/<%= m.getFile() %>" class="card-img-top" style="height: 200px">
                        <% }else{ %>
                            <img src="img/med.png" class="card-img-top" style="height: 200px">
                        <% } %>
                        <div class="card-body">
                            <h4 class="card-title"><%= m.getNome() %></h4>
                            <h6 class="card-sub-title my-3 text-muted">Validade: <%= sdf.format(m.getDataValidade()) %></h6>
                            <p class="card-text" style="color: green"><strong><%= df.format(m.getPreco()) %></strong></p>
                            <button class="btn btn-block btn-dark" data-toggle="modal" data-target="#modalCliente">Comprar</button>
                        </div>
                    </div>
                </div>
                <%
                        cont++;
                        if(cont==9){
                            ;break;
                        }
                    }
                %>
            </div>
        </div>

    <!--Rodape-->
    <%@include file="include/rodape.jsp" %>

    <!--Modal dos contatos e sobre-->
    <div class="modal fade" id="modalContatos" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm text-center" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Contatos da Farmácia</h5>

                    <button type="button" class="close" data-dismiss="modal">
                            <span>&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <h5 class="modal-title mb-2">Contatos</h5>

                    <ul class="navbar-nav mb-4">
                            <li class="navbar-item">(61) 3029-2013</li>
                            <li class="navbar-item"><i class="fa fa-whatsapp"></i> (61) 9 8424-9706</li>
                    </ul>

                    <h5 class="modal-title">Localização</h5>
                    <p>EQNP 22/26 - BL. "G" LT. 3 LJ. 3 no P. Sul em Ceilândia</p>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <!--Modal Sobre-->
    <div class="modal fade" id="modalSobre" tabindex="-1" role="dialog">
        <div class="modal-dialog text-center" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <h5 class="modal-title">Sobre</h5>

                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <p style="text-align: justify">Empresa farmacêutica que atua na comercialização de medicamentos para o tratamento de diversas infermidades, além da orientação com profissionais da saúde capacitados para melhor lhe orientar.</p>
                    <p>Venha nos fazer um visita.</p>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
    
    <!--Modal Cliente-->
    <div class="modal fade" id="modalCliente" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="row justify-content-center my-2">
                    <h1 class="display-3">
                        <i class="fa fa-user-circle-o"></i>
                    </h1>
                </div>
                <div class="modal-header">
                    <h5 class="modal-title ml-auto mr-auto">Acessar área do Cliente</h5>
                </div>

                <div class="modal-body">
                    <div class="container">
                        <div class="col-sm-12">
                            <form method="post" action="verifica_login.do">
                                <input type="hidden" name="tipo" value="login_cliente">
                                <div class="form-group col-sm-12">
                                    <label>CPF</label>
                                    <input maxlength="14" onkeypress="formatar(this,'000.000.000-00')" id="cpf" class="form-control" type="text" name="login" required>
                                </div>
                                <div class="form-group col-sm-12">
                                    <label>Senha</label>
                                    <input class="form-control" type="password" name="senha" required>
                                </div>
                                <div class="form-group col-sm-12">
                                    <button class="btn btn-primary btn-block" type="submit">Acessar</button>
                                </div>
                            </form>
                            
                            <a class="nav-link" href="form_cadastro_cliente_online.jsp">Registrar-se</a>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
    
    <!--Modal Cliente-->
    <div class="modal fade" id="modalColaborador" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="row justify-content-center my-2">
                    <h1 class="display-3">
                        <i class="fa fa-users"></i>
                    </h1>
                </div>
                
                <div class="modal-header">
                    <h5 class="modal-title ml-auto mr-auto">Acessar área do Colaborador</h5>
                </div>

                <div class="modal-body">
                    <div class="container">
                        <div class="col-sm-12">
                            <form method="post" action="verifica_login.do">
                                <input type="hidden" name="tipo" value="login_colaborador">
                                <div class="form-group col-sm-12">
                                    <label>Usuário</label>
                                    <input class="form-control" type="text" name="login" required>
                                </div>
                                <div class="form-group col-sm-12">
                                    <label>Senha</label>
                                    <input class="form-control" type="password" name="senha" required>
                                </div>
                                <div class="form-group col-sm-12">
                                    <button class="btn btn-primary btn-block" type="submit">Acessar</button>
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

    <script src="node_modules/jquery/dist/jquery.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
    
    <script src="js/jquery.min.js" type="text/javascript"></script>
    
    </body>
</html>
