<%-- 
    Document   : administracao
    Created on : 06/03/2019, 10:37:09
    Author     : Administrador
--%>

<%@page import="java.util.concurrent.TimeUnit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
            <title>Adm. Farmácia</title>
            <meta charset="utf-8">
            <!--Bootstrap css-->
            <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/compiler/bootstrap.css">

            <!--CSS-->
            <link rel="stylesheet" type="text/css" href="css/style.css">

            <!--Font-awesome-->
            <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
	</head>

	<body class="bg-tela-principal">

		<!--Menu da Adm-->
                <%@ include file="include/menu_adm.jsp" %>

		<!--Tabela de acesso rapido-->

		<div class="container text-center" style="margin: 200px auto">

			<div class="row bg-dark text-white mb-2">
				<h4 class="centro"><i class="fa fa-bolt"></i> Acesso Rápido</h4>
			</div>

			<div class="row">
				<a class="col-sm bg-warning mx-1 my-1" href="form_cadastro_cliente.jsp">						
                                    <i class="fa fa-user-plus menu-icone"><br><span style="font-size: 12pt; font-family: Arial">Cadastrar Cliente</span></i>
				</a>

				<a class="col-sm bg-primary mx-1 my-1" href="cliente.jsp">
					<i class="fa fa-cart-arrow-down menu-icone"><br><span style="font-size: 12pt; font-family: Arial">Efetuar Vendas</span></i>
				</a>

				<a class="col-sm bg-success mx-1 my-1" href="venda.jsp">
					<i class="fa fa-dollar menu-icone"><br><span style="font-size: 12pt; font-family: Arial">Visualizar Vendas</span></i>
				</a>
			</div>

			<!--<div class="row my-2">
				<div class="col-sm">
					<a href="#">
						<i class="fa fa-question-circle text-warning fonte-question"></i>
					</a>
				</div>

				<div class="col-sm">
					<a href="#">
						<i class="fa fa-question-circle text-primary fonte-question"></i>
					</a>
				</div>

				<div class="col-sm">
					<a href="#">
						<i class="fa fa-question-circle text-success fonte-question"></i>
					</a>
				</div>
			</div>-->

			<div class="row bg-dark text-white my-3">
				<h4 class="centro">Fim</h4>
			</div>
		</div>

		<!--Jumbotron-->
		<%@include file="include/rodape.jsp" %>

		<!--Modal dos contatos
		<div class="modal fade" id="modalContatos" tabindex="-1" role="dialog">
			
			<div class="modal-dialog modal-sm text-center" role="document">
				<div class="modal-content">
					<div class="modal-header">
						
						

						<button type="button" class="close" data-dismiss="modal">
							<span>&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<h5 class="modal-title mb-2">Contatos</h5>

						<ul class="navbar-nav mb-4">
							<li class="navbar-item">(61) 9 9999-9999</li>
							<li class="navbar-item">(61) 9 9999-9999</li>
							<li class="navbar-item">(61) 9 9999-9999</li>
						</ul>

						<h5 class="modal-title">Localização</h5>
						<p>Avenida x rua y</p>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
					</div>
				</div>
			</div>

		</div>

		
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
						<p>xxxxxxxxx xxxxxx xxxxxxxx xxxxx xxxxxxxxxx xxxxx xxxxxx xxxxxxxx xxxxx xxxxxx xxxxxx</p>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
					</div>
				</div>
			</div>

		</div>-->

		<script src="node_modules/jquery/dist/jquery.js"></script>
		<script src="node_modules/popper.js/dist/umd/popper.js"></script>
		<script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
		
	</body>
</html>
