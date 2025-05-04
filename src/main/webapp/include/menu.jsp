<%@page contentType="text/html" pageEncoding="UTF-8"%>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-1">

    <div class="container">
        <a class="navbar-brand h1 mb-1" href="#">Empresa</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSite">
            <span class="navbar-toggler-icon"></span>
        </button>

                        <!--Ligação do botao de menu-->
        <div class="collapse navbar-collapse" id="navbarSite">

            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a href="contatos_sobre.jsp" class="nav-link mr-2 nav-sublinhado text-white" data-toggle="modal" data-target="#modalContatos">Contatos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mr-2 nav-sublinhado text-white" href="contatos_sobre.jsp" data-toggle="modal" data-target="#modalSobre">Sobre</a>
                </li>
            </ul>


                <!--Menu dropdown-->
            <ul class="navbar-nav ml-auto">

                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle nav-sublinhado text-white" href="#" data-toggle="dropdown" id="navDrop">
                        Entrar
                </a>
                                    <!--Alinha o menu dropdown a esquerda-->
                        <div class="dropdown-menu dropdown-menu-right">
                            <div class="container  px-2">
                                <form class="p-1" method="post" action="./verifica_login.do">
                                    <div class="form-row">
                                        <div class="form-group col-sm-12">
                                            <label for="inputUsuario">Usuário</label>
                                            <input class="form-control" type="text" name="user" id="inputUsuario" placeholder="CPF ou Matricula" required>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-sm-12">
                                            <label for="inputSenha">Senha</label>
                                            <input class="form-control" type="password" name="senha" id="inputSenha" placeholder="Mínimo de 6 caracters" required>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="col-sm-12">
                                            <button class="btn btn-block btn-primary" type="submit">Entrar</button>
                                        </div>
                                    </div>
                                </form>
                                
                                <div class="dropdown-divider"></div>
                                
                                <div class="form-row">
                                    <a class="dropdown-item" href="#">Esqueceu a senha?</a>
                                </div>
                            </div>
                        </div>

                    </li>

            </ul>

        </div>
    </div>
</nav>