package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO extends DataBaseDAO{
    ImagemDAO iDAO = new ImagemDAO();
    private PreparedStatement st;
    private ResultSet rs;
    
    public List<Cliente> listar() throws Exception{
        List<Cliente> listCliente = new ArrayList<>();
            this.conectar();
            String sql = "SELECT * FROM cliente ORDER BY nome";
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while(rs.next()){
                Cliente u = new Cliente();
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setSobrenome(rs.getString("sobrenome"));
                u.setCpf(rs.getString("cpf"));
                u.setSenha(rs.getString("senha"));
                u.setCidade(rs.getString("cidade"));
                u.setLogradouro(rs.getString("logradouro"));
                u.setCasa(rs.getInt("casa"));
                u.setApto(rs.getInt("apto"));
                u.setTelCelular(rs.getString("tel_celular"));
                u.setTelFixo(rs.getString("tel_fixo"));
                u.setEmail(rs.getString("email"));
                u.setImagem(iDAO.carregarPorId(rs.getInt("imagem_id")));
                listCliente.add(u);
            }
            this.desconectar();
        
        return listCliente;
    }
    
    public Cliente carregarPorId(int id) throws Exception{
        Cliente u = new Cliente();
            this.conectar();
            String sql = "SELECT * FROM cliente WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if(rs.next()){
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setSobrenome(rs.getString("sobrenome"));
                u.setCpf(rs.getString("cpf"));
                u.setSenha(rs.getString("senha"));
                u.setCidade(rs.getString("cidade"));
                u.setLogradouro(rs.getString("logradouro"));
                u.setCasa(rs.getInt("casa"));
                u.setApto(rs.getInt("apto"));
                u.setTelCelular(rs.getString("tel_celular"));
                u.setTelFixo(rs.getString("tel_fixo"));
                u.setEmail(rs.getString("email"));
                u.setImagem(iDAO.carregarPorId(rs.getInt("imagem_id")));
            }
            this.desconectar();
        return u;
    }
    
    public Cliente logar(String cpf, String senha) throws Exception{
        Cliente u = new Cliente();
            this.conectar();
            String sql = "SELECT * FROM cliente WHERE cpf=?";
            st = conn.prepareStatement(sql);
            st.setString(1, cpf);
            rs = st.executeQuery();
            if(rs.next()){
                if (senha.equals(rs.getString("senha"))){
                    u.setId(rs.getInt("id"));
                    u.setNome(rs.getString("nome"));
                    u.setSobrenome(rs.getString("sobrenome"));
                    u.setCpf(rs.getString("cpf"));
                    u.setSenha(rs.getString("senha"));
                    u.setCidade(rs.getString("cidade"));
                    u.setLogradouro(rs.getString("logradouro"));
                    u.setCasa(rs.getInt("casa"));
                    u.setApto(rs.getInt("apto"));
                    u.setTelCelular(rs.getString("tel_celular"));
                    u.setTelFixo(rs.getString("tel_fixo"));
                    u.setEmail(rs.getString("email"));
                    u.setImagem(iDAO.carregarPorId(rs.getInt("imagem_id")));
                }
            }
            this.desconectar();
        return u;
    }
    
    public int inserir(Cliente u) throws Exception{
        int ret=0;
            this.conectar();
            String sql = "INSERT INTO cliente (nome, sobrenome, cpf, senha, cidade, logradouro, casa, apto, tel_celular, tel_fixo, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, u.getNome());
            st.setString(2, u.getSobrenome());
            st.setString(3, u.getCpf());
            st.setString(4, u.getSenha());
            st.setString(5, u.getCidade());
            st.setString(6, u.getLogradouro());
            st.setInt(7, u.getCasa());
            st.setInt(8, u.getApto());
            st.setString(9, u.getTelCelular());
            st.setString(10, u.getTelFixo());
            st.setString(11, u.getEmail());
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
    
    public int alterar(Cliente u) throws Exception{
        int ret=0;
            this.conectar();
            String sql = "UPDATE cliente SET nome=?, sobrenome=?, cpf=?, senha=?, cidade=?, logradouro=?, casa=?, apto=?, tel_celular=?, tel_fixo=?, email=? WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, u.getNome());
            st.setString(2, u.getSobrenome());
            st.setString(3, u.getCpf());
            st.setString(4, u.getSenha());
            st.setString(5, u.getCidade());
            st.setString(6, u.getLogradouro());
            st.setInt(7, u.getCasa());
            st.setInt(8, u.getApto());
            st.setString(9, u.getTelCelular());
            st.setString(10, u.getTelFixo());
            st.setString(11, u.getEmail());
            st.setInt(12, u.getId());
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
    
    public int excluir(int id) throws Exception{
        int ret=0;
            this.conectar();
            String sql = "DELETE FROM cliente WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
}
