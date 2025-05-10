package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO extends DataBaseDAO{
    PerfilDAO pDAO = new PerfilDAO();
    ImagemDAO iDAO = new ImagemDAO();
    private PreparedStatement st;
    private ResultSet rs;
    
    public List<Usuario> listar() throws Exception{
        List<Usuario> listUsuario = new ArrayList<>();
            this.conectar();
            String sql = "SELECT * FROM usuario ORDER BY nome";
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setSobrenome(rs.getString("sobrenome"));
                u.setCpf(rs.getString("cpf"));
                u.setData_Nasc(rs.getDate("data_nasc"));
                u.setSexo(rs.getString("sexo"));
                u.setUser(rs.getString("user"));
                u.setSenha(rs.getString("senha"));
                u.setCidade(rs.getString("cidade"));
                u.setLogradouro(rs.getString("logradouro"));
                u.setCasa(rs.getInt("casa"));
                u.setApto(rs.getInt("apto"));
                u.setTelCelular(rs.getString("tel_celular"));
                u.setTelFixo(rs.getString("tel_fixo"));
                u.setEmail(rs.getString("email"));
                u.setPerfil(pDAO.carregarPorId(rs.getInt("perfil_id")));
                u.setImagem(iDAO.carregarPorId(rs.getInt("imagem_id"))); 
                listUsuario.add(u);
            }
            this.desconectar();
        return listUsuario;
    }
    
    public Usuario carregarPorId(int id) throws Exception{
        Usuario u = new Usuario();
            this.conectar();
            String sql = "SELECT * FROM usuario WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if(rs.next()){
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setSobrenome(rs.getString("sobrenome"));
                u.setCpf(rs.getString("cpf"));
                u.setData_Nasc(rs.getDate("data_nasc"));
                u.setSexo(rs.getString("sexo"));
                u.setUser(rs.getString("user"));
                u.setSenha(rs.getString("senha"));
                u.setCidade(rs.getString("cidade"));
                u.setLogradouro(rs.getString("logradouro"));
                u.setCasa(rs.getInt("casa"));
                u.setApto(rs.getInt("apto"));
                u.setTelCelular(rs.getString("tel_celular"));
                u.setTelFixo(rs.getString("tel_fixo"));
                u.setEmail(rs.getString("email"));
                u.setPerfil(pDAO.carregarPorId(rs.getInt("perfil_id")));
                u.setImagem(iDAO.carregarPorId(rs.getInt("imagem_id")));
            }
            this.desconectar();
        return u;
    }
    
    public Usuario logar(String user, String senha) throws Exception{
        Usuario u = new Usuario();
            this.conectar();
            String sql = "SELECT * FROM usuario WHERE user=?";
            st = conn.prepareStatement(sql);
            st.setString(1, user);
            rs = st.executeQuery();
            if(rs.next()){ 
                if (senha.equals(rs.getString("senha"))){
                    u.setId(rs.getInt("id"));
                    u.setNome(rs.getString("nome"));
                    u.setSobrenome(rs.getString("sobrenome"));
                    u.setCpf(rs.getString("cpf"));
                    u.setData_Nasc(rs.getDate("data_nasc"));
                    u.setSexo(rs.getString("sexo"));
                    u.setUser(rs.getString("user"));
                    u.setSenha(rs.getString("senha"));
                    u.setCidade(rs.getString("cidade"));
                    u.setLogradouro(rs.getString("logradouro"));
                    u.setCasa(rs.getInt("casa"));
                    u.setApto(rs.getInt("apto"));
                    u.setTelCelular(rs.getString("tel_celular"));
                    u.setTelFixo(rs.getString("tel_fixo"));
                    u.setEmail(rs.getString("email"));
                    u.setPerfil(pDAO.carregarPorId(rs.getInt("perfil_id")));
                    u.setImagem(iDAO.carregarPorId(rs.getInt("imagem_id")));
                }
            }
            this.desconectar();
        return u;
    }
    
    public int inserir(Usuario u) throws Exception{
        int ret=0;
            this.conectar();
            String sql = "INSERT INTO usuario (nome, sobrenome, cpf, data_nasc, sexo, user, senha, cidade, logradouro, casa, apto, tel_celular, tel_fixo, email, perfil_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, u.getNome());
            st.setString(2, u.getSobrenome());
            st.setString(3, u.getCpf());
            st.setDate(4, new Date(u.getData_Nasc().getTime()));
            st.setString(5, u.getSexo());
            st.setString(6, u.getUser());
            st.setString(7, u.getSenha());
            st.setString(8, u.getCidade());
            st.setString(9, u.getLogradouro());
            st.setInt(10, u.getCasa());
            st.setInt(11, u.getApto());
            st.setString(12, u.getTelCelular());
            st.setString(13, u.getTelFixo());
            st.setString(14, u.getEmail());
            st.setInt(15, u.getPerfil().getId());
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
    
    public int alterar(Usuario u) throws Exception{
        int ret=0;
            this.conectar();
            String sql = "UPDATE usuario SET nome=?, sobrenome=?, cpf=?, data_nasc=?, sexo=?, user=?, senha=?, cidade=?, logradouro=?, casa=?, apto=?, tel_celular=?, tel_fixo=?, email=?, perfil_id=? WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, u.getNome());
            st.setString(2, u.getSobrenome());
            st.setString(3, u.getCpf());
            st.setDate(4, new Date(u.getData_Nasc().getTime()));
            st.setString(5, u.getSexo());
            st.setString(6, u.getUser());
            st.setString(7, u.getSenha());
            st.setString(8, u.getCidade());
            st.setString(9, u.getLogradouro());
            st.setInt(10, u.getCasa());
            st.setInt(11, u.getApto());
            st.setString(12, u.getTelCelular());
            st.setString(13, u.getTelFixo());
            st.setString(14, u.getEmail());
            st.setInt(15, u.getPerfil().getId());
            st.setInt(16, u.getId());
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
    
    public int excluir(int id) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "DELETE FROM usuario WHERE id=?";
        st = conn.prepareStatement(sql);
        st.setInt(1, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
}
