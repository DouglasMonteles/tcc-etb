<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.MenuDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("sessionCliente") == null){
        response.sendRedirect("index.jsp");
    }
    
    Cliente cliente = (Cliente) session.getAttribute("sessionCliente");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-1 no-print">

    <div class="container container-fluid">
        <!--<a class="navbar-brand h1 mb-1" href="#">Farmacia <br/>Santa Cruz <i class="fa fa-empire"></i></a>-->

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSite">
                    <span class="navbar-toggler-icon"></span>
            </button>

                                                                    <!--Ligação do botao de menu-->
            <div class="collapse navbar-collapse" id="navbarSite">

                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="text-white nav-link mr-2 nav-sublinhado" href="form_compra_cliente.jsp?id=<%= cliente.getId()%>&op=n"><i class="fa fa-home"></i> Início</a>
                        </li>
                        <li class="nav-item">
                            <a class="text-white nav-link mr-2 nav-sublinhado" href="venda_cliente.jsp?id=<%= cliente.getId()%>"><i class="fa fa-dollar"></i> Compras Realizadas</a>
                        </li>
                    </ul>

                    <!--Menu Dropdown de perfil do usuario-->

                    <ul class="navbar-nav ml-auto my-1">
                            <li class="nav-item dropdown">

                                    <a class="nav-link dropdown-toggle text-white" href="#" data-toggle="dropdown" id="navDrop">
                                            <!--Imagem do usuario-->
                                            <%
                                                if(cliente.getImagem().getFile() != null){
                                            %>
                                                    <img class="img-perfil" src="img/<%= cliente.getImagem().getFile() %>"> <%= cliente.getNome() %>  
                                            <%
                                                }else{
                                            %>
                                                    <img class="img-perfil" src="img/perfil-user.png"> <%= cliente.getNome() %>
                                            <%
                                                }
                                            %>
                                    </a>


                                    <div class="dropdown-menu dropdown-menu-right text-center">
                                        <a class="dropdown-item link-perfil" href="info_cliente.jsp?id=<%= cliente.getId() %>">
                                                    <i class="fa fa-user"></i> Ver meu Cadastro
                                            </a>
                                            <a class="dropdown-item link-perfil" href="form_altera_cliente_online.jsp?id=<%= cliente.getId() %>">
                                                    <i class="fa fa-pencil"></i> Alterar meu Cadastro
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item link-perfil" href="logout.jsp">
                                                    <i class="fa fa-sign-out"></i> Sair
                                            </a>
                                    </div>
                            </li>
                    </ul>

            </div>
    </div>
</nav>
                                    
<script src="node_modules/jquery/dist/jquery.js"></script>
<script src="node_modules/popper.js/dist/umd/popper.js"></script>
<script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
                                    