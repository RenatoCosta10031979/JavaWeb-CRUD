package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {
	
	private static String banco = "jdbc:postgresql://localhost:5432/Java-web?autoReconnect=true";
	private static String user = "postgres";
	private static String senha = "P@ssw0rd";
	private static Connection connection = null;
	
	public static Connection getConnection() {
		return connection;
	}
	
	static {
		conectar();
	}
	
	public SingleConnectionBanco() { // quando tiver uma instância vai conectar
		conectar();
	
	}
	
	private static void conectar() {
		 try {
			 
			 if(connection == null) {
				 Class.forName("org.postgresql.Driver"); // carregamento de drive de conexão banco de dados
				 connection = DriverManager.getConnection(banco, user, senha);
				 connection.setAutoCommit(false); // para não efetuar alterações no banco sem nosso comando
			 }
			 
		 }catch ( Exception e) {
			 e.printStackTrace(); // mostra qualquer erro no momento da conexão
		 }
	}

}