package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PerfilDAO extends DataBaseDAO{
    private PreparedStatement st;
    private ResultSet rs;
    
    public List<Perfil> listar() throws Exception{
        List<Perfil> listPerfil = new ArrayList<>();
            this.conectar();
            String sql = "SELECT * FROM perfil ORDER BY nome";
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while(rs.next()){
                Perfil p = new Perfil();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setDescricao(rs.getString("descricao"));
                listPerfil.add(p);
            }
            this.desconectar();
        return listPerfil;
    }
    
    public Perfil carregarPorId(int id) throws Exception{
        Perfil p = new Perfil();
        
            this.conectar();
            String sql = "SELECT * FROM perfil WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if(rs.next()){
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setDescricao(rs.getString("descricao"));
                p.setMenus(this.menusPerfil(id));
            }
            this.desconectar();
        
        return p;
    }
    
    public int inserir(Perfil p) throws Exception{
        int ret=0;
            this.conectar();
            String sql = "INSERT INTO perfil (nome, descricao) VALUES (?, ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, p.getNome());
            st.setString(2, p.getDescricao());
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
    
    public int alterar(Perfil p) throws Exception{
        int ret=0;
            this.conectar();
            String sql = "UPDATE perfil SET nome=?, descricao=? WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, p.getNome());
            st.setString(2, p.getDescricao());
            st.setInt(3, p.getId());
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
    
    public int excluir(int id) throws Exception{
        int ret=0;
            this.conectar();
            String sql = "DELETE FROM perfil WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
    
    public int vincular(int id_menu, int id_perfil) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "INSERT INTO perfil_menu (menu_id, perfil_id) VALUES (?, ?);";
        st = conn.prepareStatement(sql);
        st.setInt(1, id_menu);
        st.setInt(2, id_perfil);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int desvincular(int id_menu, int id_perfil) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "DELETE FROM perfil_menu WHERE menu_id=? AND perfil_id=?";
        st = conn.prepareStatement(sql);
        st.setInt(1, id_menu);
        st.setInt(2, id_perfil);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public ArrayList<Menu> menusPerfil(int id_perfil) throws Exception{
        ArrayList<Menu> listMenu = new ArrayList<Menu>();
        this.conectar();
        String sql = "SELECT m.* FROM menu AS m, perfil_menu AS pm WHERE pm.menu_id=m.id AND pm.perfil_id=?";
        st = conn.prepareStatement(sql);
        st.setInt(1, id_perfil);
        rs = st.executeQuery();
        while(rs.next()){
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            listMenu.add(m);
        }
        this.desconectar();
        return listMenu;
    }
    
    public ArrayList<Menu> menusNaoPerfil(int id_perfil) throws Exception{
        this.conectar();
        ArrayList<Menu> listNaoMenu = new ArrayList<Menu>();
        String sql = "SELECT * FROM menu WHERE id NOT IN(SELECT menu_id FROM perfil_menu WHERE perfil_id=?)";
        st = conn.prepareStatement(sql);
        st.setInt(1, id_perfil);
        rs = st.executeQuery();
        while(rs.next()){
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            listNaoMenu.add(m);
        }
        this.desconectar();
        return listNaoMenu;
    }
}
