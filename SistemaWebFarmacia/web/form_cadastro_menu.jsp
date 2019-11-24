<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Menu</title>
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
                <h4 class="centro">Cadastro de Menu</h4>
            </div>
            <div class="row justify-content-center">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <div class="row">
                        <div class="col-sm-12">
                            <form action="gerenciar_menu.do" method="post">
                                <input type="hidden" name="id" value="0">
                                <input type="hidden" name="tipo" value="inserir">

                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <label for="inputNomeMenu">Nome do Menu</label>
                                        <input class="form-control" type="text" id="inputNomeMenu" name="nome" placeholder="Informe o nome do menu" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <label for="inputLink">Link</label>
                                        <input class="form-control" type="text" id="inputDesc" name="link" placeholder="Informe o link o menu" required>
                                    </div>
                                </div>
                                
                                <div class="form-row">
                                    <div class="form-group col-sm-12">
                                        <label for="inputIcone">Icone</label>
                                        <input class="form-control" type="text" id="inputIcone" name="icone" placeholder="Informe o icone o menu">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary display-1">Cadastrar Menu</button>
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
