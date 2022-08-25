<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<style type="text/css">

#msg{
position: absolute;
color: green;
font-family: Arial, Helvetica, sans-serif;
left: 60%;
}

</style>
</head>

<jsp:include page="head.jsp"></jsp:include>
<body>
	<!-- Pre-loader start -->

	<jsp:include page="theme-loader.jsp"></jsp:include>
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<jsp:include page="navbarmainmenu.jsp"></jsp:include>
					<div class="pcoded-content">
						<!-- Page-header start -->
						<jsp:include page="page-header.jsp"></jsp:include>
						<div class="pcoded-inner-content">
						
							<!-- Main-body start -->
							<div class="main-body">
						
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
											
										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
												

													<div class="card-block">
														<h4 class="sub-title">Cadastro de Usuário</h4>

														<form class="form-material"
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="post">

															 <div class="form-group form-default">
                                                                <input type="text" name="id" id="id" class="form-control"  readonly="readonly" value="${modolLogin.id}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">ID:</label>
                                                            </div>

															<div class="form-group form-default">
																<input type="text" name="nome" id="nome"
																	class="form-control" required="required"
																	value="${modolLogin.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Nome:</label>
															</div>
															<div class="form-group form-default">
																<input type="email" name="email" id="email"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.email}">
																<span class="form-bar"></span> <label
																	class="float-label">Email:</label>
															</div>
															<div class="form-group form-default">
																<input type="text" name="login" id="login"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.login}">
																<span class="form-bar"></span> <label
																	class="float-label">Login:</label>
															</div>

															<div class="form-group form-default">
																<input type="password" name="senha" id="senha"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.senha}">
																<span class="form-bar"></span> <label
																	class="float-label">Senha:</label>
															</div>

															<button class="btn btn-primary waves-effect waves-light">Novo</button>
															<button class="btn btn-success waves-effect waves-light">Salvar</button>
															<button class="btn btn-danger waves-effect waves-light">Excluir</button>
																	<span id="msg">${msg}</span>
														</form>
														


													</div>
												</div>
											</div>
										</div>

									</div>

								</div>


								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="javascriptFile.jsp"></jsp:include>
</body>

</html>