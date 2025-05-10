package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FornecedorDAO extends DataBaseDAO{
    private PreparedStatement st;
    private ResultSet rs;
    
    public List<Fornecedor> listar() throws Exception{
        List<Fornecedor> listFornecedor = new ArrayList<>();
            this.conectar();
            String sql = "SELECT * FROM fornecedor ORDER BY nome";
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while(rs.next()){
                Fornecedor f = new Fornecedor();
                f.setId(rs.getInt("id"));
                f.setNome(rs.getString("nome"));
                f.setCnpj(rs.getString("cnpj"));
                f.setLocalizacao(rs.getString("localizacao"));
                f.setUser(rs.getString("user"));
                f.setSenha(rs.getString("senha"));
                f.setLogo(rs.getString("logo"));
                f.setStatus(rs.getBoolean("status"));
                listFornecedor.add(f);
            }
            this.desconectar();
        return listFornecedor;
    }
    
    public Fornecedor carregarPorId(int id) throws Exception{
        Fornecedor f = new Fornecedor();
            this.conectar();
            String sql = "SELECT * FROM fornecedor WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if(rs.next()){
                f.setId(rs.getInt("id"));
                f.setNome(rs.getString("nome"));
                f.setCnpj(rs.getString("cnpj"));
                f.setLocalizacao(rs.getString("localizacao"));
                f.setUser(rs.getString("user"));
                f.setSenha(rs.getString("senha"));
                f.setLogo(rs.getString("logo"));
                f.setStatus(rs.getBoolean("status"));
            }
            this.desconectar();
        return f;
    }
    
    public Fornecedor logar(String user, String senha) throws Exception{
        Fornecedor f = new Fornecedor();
            this.conectar();
            String sql = "SELECT * FROM fornecedor WHERE user=?";
            st = conn.prepareStatement(sql);
            st.setString(1, user);
            rs = st.executeQuery();
            if(rs.next()){
                if(senha.equals(rs.getString("senha"))){
                    f.setId(rs.getInt("id"));
                    f.setNome(rs.getString("nome"));
                    f.setCnpj(rs.getString("cnpj"));
                    f.setLocalizacao(rs.getString("localizacao"));
                    f.setUser(rs.getString("user"));
                    f.setSenha(rs.getString("senha"));
                    f.setLogo(rs.getString("logo"));
                    f.setStatus(rs.getBoolean("status"));
                }
            }
            this.desconectar();
        return f;
    }
    
    public int inserir(Fornecedor f) throws Exception{
        int ret=0;
            this.conectar();
            String sql = "INSERT INTO fornecedor (nome, cnpj, localizacao, user, senha, logo) VALUES (?, ?, ?, ?, ?, ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, f.getNome());
            st.setString(2, f.getCnpj());
            st.setString(3, f.getLocalizacao());
            st.setString(4, f.getUser());
            st.setString(5, f.getSenha());
            st.setString(6, f.getLogo());
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
    
    public int alterar(Fornecedor f) throws Exception{
        int ret=0;
            this.conectar();
            String sql = "UPDATE fornecedor SET nome=?, cnpj=?, localizacao=?, user=?, senha=?, logo=? WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, f.getNome());
            st.setString(2, f.getCnpj());
            st.setString(3, f.getLocalizacao());
            st.setString(4, f.getUser());
            st.setString(5, f.getSenha());
            st.setString(6, f.getLogo());
            st.setInt(7, f.getId());
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
    
    public int excluir(int id) throws Exception{
        int ret=0;
            this.conectar();
            String sql = "DELETE FROM fornecedor WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
}
