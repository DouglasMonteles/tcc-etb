package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ImagemDAO extends DataBaseDAO{
    PreparedStatement st;
    ResultSet rs;
    
    public Imagem carregarPorId(int id) throws Exception{
        Imagem i = new Imagem();
        this.conectar();
        String sql = "SELECT * FROM imagem WHERE id=?";
        st = conn.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if(rs.next()){
            i.setId(rs.getInt("id"));
            i.setFile(rs.getString("file"));
        }
        this.desconectar();
        return i;
    } 
    
    public int inserirImgUsuario(Imagem i, int id) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "INSERT INTO imagem (file) VALUES (?)";
        st = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        st.setString(1, i.getFile());
        ret = st.executeUpdate();
        rs = st.getGeneratedKeys();
        if(rs.next()){
            i.setId(rs.getInt(1));
        }
        String sql_img = "UPDATE usuario SET imagem_id=? WHERE id=?";
        st = conn.prepareStatement(sql_img);
        st.setInt(1, i.getId());
        st.setInt(2, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int inserirImgCliente(Imagem i, int id) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "INSERT INTO imagem (file) VALUES (?)";
        st = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        st.setString(1, i.getFile());
        ret = st.executeUpdate();
        rs = st.getGeneratedKeys();
        if(rs.next()){
            i.setId(rs.getInt(1));
        }
        String sql_img = "UPDATE cliente SET imagem_id=? WHERE id=?";
        st = conn.prepareStatement(sql_img);
        st.setInt(1, i.getId());
        st.setInt(2, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int inserirImgMed(Imagem i, int id) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "INSERT INTO imagem (file) VALUES (?)";
        st = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        st.setString(1, i.getFile());
        ret = st.executeUpdate();
        rs = st.getGeneratedKeys();
        if(rs.next()){
            i.setId(rs.getInt(1));
        }
        String sql_img = "UPDATE medicamento SET imagem_id=? WHERE id=?";
        st = conn.prepareStatement(sql_img);
        st.setInt(1, i.getId());
        st.setInt(2, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int alterar(Imagem i) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "UPDATE imagem SET file=? WHERE id=?";
        st = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        st.setString(1, i.getFile());
        st.setInt(2, i.getId());
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
}
