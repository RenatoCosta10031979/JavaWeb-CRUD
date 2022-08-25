<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<style type="text/css">
form {
	position: absolute;
	top: 30%;
	left: 30%;
	right: 30%;
}

h4 {
	position: absolute;
	top: 15%;
	left: 46%;
	font-size: 30px;
	color: #000000;
  font-family: Arial, Helvetica, sans-serif;

}

#usuario{
	
  font-family: Arial, Helvetica, sans-serif;

}

#senha {
  font-family: Arial, Helvetica, sans-serif;
}

h6 {
	position: absolute;
	top: 80%;
	left: 30%;
	color: #842029;
	background-color: #f8d7da;
	border-color: #f5c2c7;
	
}

button#button {
	background-color: #0000FF;
}
</style>

</head>
<body>
	
	<h4>Login</h4>
	<!-- USUÁRIO -->
	<form action="<%= request.getContextPath()%>/ServletLogin" method="POST"
		class="row g-3 needs-validation" novalidate>
		<input type="hidden" value="<%=request.getParameter("url")%>"
			name="url" autocomplete="off">

		<div class="mb-3">
			<label id="usuario" class="text-dark">Usuário</label> <input
				class="form-control shadow-none p-2 mb-1.5 bg-light rounded"
				name="login" type="text" required="required">

			<div class="invalid-feedback">informe o login</div>
			<div class="valid-feedback">validando o login...</div>

		</div>


	<!-- SENHA -->
		<div class="mb-3">
			<label id="senha" class="text-dark">Senha</label> <input
				class="form-control shadow-none p-2 mb-1.5 bg-light rounded"
				name="senha" type="password" required="required" autocomplete="off">

			<div class="invalid-feedback">informe a senha</div>
			<div class="valid-feedback">validando a senha...</div>


		</div>



		<div class="d-grid gap-2 col-6 mx-auto">
			<button id="button" type="submit" value="enviar"
				class="btn btn-success">Acessar</button>
		</div>
	</form>
	<h6>${msg}</h6>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(() => {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  const forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.from(forms).forEach(form => {
	    form.addEventListener('submit', event => {
	      if (!form.checkValidity()) {
	        event.preventDefault()
	        event.stopPropagation()
	      }

	      form.classList.add('was-validated')
	    }, false)
	  })
	})()
		
		</script>

</body>
</html>