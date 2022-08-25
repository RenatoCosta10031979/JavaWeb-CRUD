<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">h3{color:red}</style>

<meta charset="UTF-8">
<title>Tela de erro</title>
</head>
<body>
<h3>Mensagem de erro :( <br>Entre em contato com a equipe de suporte!</h3>

<% 
	out.println(request.getAttribute("msg"));
%>

</body>
</html>