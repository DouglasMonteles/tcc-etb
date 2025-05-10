<%@page import="modelo.Menu"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("sessionUser") == null){
        response.sendRedirect("index.jsp");
    }
    
    Usuario user = (Usuario) session.getAttribute("sessionUser");
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
                        <%
                            for(Menu me : user.getPerfil().getMenus()){
                        %>
                            <li class="nav-item">
                                <a class="nav-link mr-2 nav-sublinhado text-white" href="<%= me.getLink() %>"><i class="<%= me.getIcone() %>"></i> <%= me.getNome() %></a>
                            </li>
                        <%
                            }
                        %>
                    </ul>

                    <!--Menu Dropdown de perfil do usuario-->

                    <ul class="navbar-nav ml-auto my-1">
                            <li class="nav-item dropdown">

                                    <a class="nav-link dropdown-toggle text-white" href="#" data-toggle="dropdown" id="navDrop">
                                            <!--Imagem do usuario-->
                                            <%
                                                if(user.getImagem().getFile() != null){
                                            %>
                                                    <img class="img-perfil" src="img/<%= user.getImagem().getFile() %>"> <%= user.getNome() %>  
                                            <%
                                                }else{
                                            %>
                                                    <img class="img-perfil" src="img/perfil-user.png"> <%= user.getNome() %>
                                            <%
                                                }
                                            %>
                                    </a>


                                    <div class="dropdown-menu dropdown-menu-right text-center">
                                        <a class="dropdown-item link-perfil" href="info_user.jsp?id=<%= user.getId() %>">
                                                    <i class="fa fa-user"></i> Ver meu Usuário
                                            </a>
                                            <a class="dropdown-item link-perfil" href="form_altera_user.jsp?id=<%= user.getId() %>">
                                                    <i class="fa fa-pencil"></i> Alterar meu Usuário
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
                                    