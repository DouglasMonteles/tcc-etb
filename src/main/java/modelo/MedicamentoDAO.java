package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class MedicamentoDAO extends DataBaseDAO{
    private PreparedStatement st;
    private ResultSet rs;
    
    public List<Medicamento> listar() throws Exception{
        List<Medicamento> listMed = new ArrayList<>();
            this.conectar();
            String sql = "SELECT * FROM medicamento ORDER BY id DESC";
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while(rs.next()){
                Medicamento m = new Medicamento();
                m.setId(rs.getInt("id"));
                m.setNome(rs.getString("nome"));
                m.setDataFabricacao(rs.getDate("data_fabricacao"));
                m.setDataValidade(rs.getDate("data_validade"));
                m.setIndicacao(rs.getString("indicacao"));
                m.setPrecaucoes(rs.getString("precaucoes"));
                m.setPreco(rs.getDouble("preco"));
                m.setLote(rs.getInt("lote"));
                m.setObs(rs.getString("obs"));
                m.setLaboratorio(rs.getString("laboratorio"));
                m.setComposicao(rs.getString("composicao"));
                m.setFile(rs.getString("file"));
                listMed.add(m);
            }
            this.desconectar();
        return listMed;
    }
    
    public Medicamento carregarPorId(int id) throws Exception{
        Medicamento m = new Medicamento();
            this.conectar();
            String sql = "SELECT * FROM medicamento WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if(rs.next()){
                m.setId(rs.getInt("id"));
                m.setNome(rs.getString("nome"));
                m.setDataFabricacao(rs.getDate("data_fabricacao"));
                m.setDataValidade(rs.getDate("data_validade"));
                m.setIndicacao(rs.getString("indicacao"));
                m.setPrecaucoes(rs.getString("precaucoes"));
                m.setPreco(rs.getDouble("preco"));
                m.setLote(rs.getInt("lote"));
                m.setObs(rs.getString("obs"));
                m.setLaboratorio(rs.getString("laboratorio"));
                m.setComposicao(rs.getString("composicao"));
                m.setFile(rs.getString("file"));
            }
            this.desconectar();
        return m;
    }
    
    public int inserir(Medicamento m) throws Exception{
        int ret = 0;
            this.conectar();
            String sql = "INSERT INTO medicamento (nome, data_fabricacao, data_validade, indicacao, precaucoes, preco, lote, obs, laboratorio, composicao, file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, m.getNome());
            st.setDate(2, new Date(m.getDataFabricacao().getTime()));
            st.setDate(3, new Date(m.getDataValidade().getTime()));
            st.setString(4, m.getIndicacao());
            st.setString(5, m.getPrecaucoes());
            st.setDouble(6, m.getPreco());
            st.setInt(7, m.getLote());
            st.setString(8, m.getObs());
            st.setString(9, m.getLaboratorio());
            st.setString(10, m.getComposicao());
            st.setString(11, m.getFile());
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
    
    public int alterar(Medicamento m) throws Exception{
        int ret = 0;
            this.conectar();
            String sql = "UPDATE medicamento SET nome=?, data_fabricacao=?, data_validade=?, indicacao=?, precaucoes=?, preco=?, lote=?, obs=?, laboratorio=?, composicao=?, file=? WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, m.getNome());
            st.setDate(2, new Date(m.getDataFabricacao().getTime()));
            st.setDate(3, new Date(m.getDataValidade().getTime()));
            st.setString(4, m.getIndicacao());
            st.setString(5, m.getPrecaucoes());
            st.setDouble(6, m.getPreco());
            st.setInt(7, m.getLote());
            st.setString(8, m.getObs());
            st.setString(9, m.getLaboratorio());
            st.setString(10, m.getComposicao());
            st.setString(11, m.getFile());
            st.setInt(12, m.getId());
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
    
    public int excluir(int id) throws Exception{
        int ret = 0;
            this.conectar();
            String sql = "DELETE FROM medicamento WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ret = st.executeUpdate();
            this.desconectar();
        return ret;
    }
}
