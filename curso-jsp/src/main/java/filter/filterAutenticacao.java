package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

//intercepta todas as requisições que vierem do projeto ou mapeamento
@WebFilter(urlPatterns = { "/principal/*" })
public class filterAutenticacao implements Filter {

	private static Connection connection;

	public filterAutenticacao() {
	}

	// Encerra os processo quando o servidor é parado
	// Mataria os processo de conexão com o banco de dados
	public void destroy() {

		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Intercepta as requisições e a as respostas no sistema
	// Tudo que fizer no sistema vai passar por aqui
	// Validadação de autenticação
	// Dar commit e rollback de transações do banco de dados
	// Validar e fazer redirecionamento de páginas
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();

			String usuarioLogado = (String) session.getAttribute("usuario");
			String urlParaAutenticar = req.getServletPath(); // url que está sendo acessada

			// Validar se está logado senão redireciona para a tela de login
			if (usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/principal/ServletLogin")) { // não está
																											// logado

				RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
				request.setAttribute("msg", "Por favor realize o login!");
				redireciona.forward(request, response);
				return; // Para a execução e redireciona para o login
			} else {
				chain.doFilter(request, response);
			}
			
			connection.commit(); // comita as alterações no bando de dados

		} catch (Exception e) {
			e.printStackTrace();
			
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			
			
			
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}

	}

	// Inicia os processo ou recursos quando o servidor sobe o projeto
	// Iniciar a conexão com o banco de dados
	public void init(FilterConfig fConfig) throws ServletException {

		connection = SingleConnectionBanco.getConnection();
	}

}
