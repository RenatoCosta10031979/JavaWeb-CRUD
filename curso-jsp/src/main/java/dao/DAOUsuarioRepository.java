package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {
	
	private Connection connection;
	
	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public ModelLogin gravarUsuario(ModelLogin objeto) throws SQLException {
		
		
		if(objeto.isNovo()) {
		
		String sql = "INSERT INTO model_login(nome,email,login,senha) VALUES(?, ?, ?, ?)";
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		
		preparedSql.setString(1, objeto.getNome());
		preparedSql.setString(2, objeto.getEmail());
		preparedSql.setString(3, objeto.getLogin());
		preparedSql.setString(4, objeto.getSenha());
		
		preparedSql.execute();
		
		connection.commit();
		
		} else {
			String sql = "UPDATE public.model_login SET nome=?, email=?, login=?, senha=? WHERE id = "+objeto.getId()+"";
			PreparedStatement prepareSql = connection.prepareStatement(sql);
			
			prepareSql.setString(1, objeto.getNome());
			prepareSql.setString(2, objeto.getEmail());
			prepareSql.setString(3, objeto.getLogin());
			prepareSql.setString(4, objeto.getSenha());
			
			prepareSql.executeUpdate();
			connection.commit();
		
		}
		//consulta o dados do usuário após gravar os dados no banco de dados
		return this.consultaUsuario(objeto.getLogin());
	}
	
	public ModelLogin consultaUsuario(String login) throws SQLException {
		
		ModelLogin modelLogin = new ModelLogin();
		
		String sql = " select * from model_login where upper(login) = upper('"+login+"')";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		
		
		ResultSet resultado = statement.executeQuery();
		
		while (resultado.next()) {
			
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setSenha(resultado.getString("senha"));
			
		}
		
		return modelLogin;
		
	}
	
	public boolean validarLogin(String login) throws Exception{
		String sql = "select count(1) > 0 as existe from model_login where upper(login) = upper ('"+login+"')";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();
		
		resultado.next();
		return resultado.getBoolean("existe");
	
	}
}