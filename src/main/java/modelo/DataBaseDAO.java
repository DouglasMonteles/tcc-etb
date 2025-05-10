package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseDAO {
    
    public Connection conn;
    
    public void conectar() throws Exception{
        
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost/db_farmacia";
        String user = "root";
        String pass = "etb";
        
        Class.forName(driver);
        conn = DriverManager.getConnection(url,user,pass);
    }
    
    public void desconectar() throws Exception{
        if(!conn.isClosed()){
            conn.close();
        }
    }
    
}
