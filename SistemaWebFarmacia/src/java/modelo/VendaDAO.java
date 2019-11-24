package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class VendaDAO extends DataBaseDAO{
    PreparedStatement st;
    ResultSet rs;
    
    public ArrayList<Venda> listar() throws Exception{
        ArrayList<Venda> listVenda = new ArrayList<Venda>();
        this.conectar();
        String sql = "SELECT * FROM venda ORDER BY id DESC";
        st = conn.prepareStatement(sql);
        rs = st.executeQuery();
        while(rs.next()){
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            v.setDataVenda(rs.getDate("data_venda"));
            v.setDataEntrega(rs.getDate("data_entrega"));
            v.setDataPagamento(rs.getDate("data_pagamento"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setVendedor(uDAO.carregarPorId(rs.getInt("usuario_id")));
            listVenda.add(v);
        }
        this.desconectar();
        return listVenda;
    }
    
    public ArrayList<Venda> listarVendasCliente(int id) throws Exception{
        ArrayList<Venda> listVenda = new ArrayList<Venda>();
        this.conectar();
        String sql = "SELECT * FROM venda WHERE cliente_id=? ORDER BY id DESC";
        st = conn.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        while(rs.next()){
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            v.setDataVenda(rs.getDate("data_venda"));
            v.setDataEntrega(rs.getDate("data_entrega"));
            v.setDataPagamento(rs.getDate("data_pagamento"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setVendedor(uDAO.carregarPorId(rs.getInt("usuario_id")));
            listVenda.add(v);
        }
        this.desconectar();
        return listVenda;
    }
    
    public Venda carregarPorId(int id) throws Exception{
        this.conectar();
        String sql = "SELECT * FROM venda WHERE id=?";
        st = conn.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        Venda v = new Venda();
        if (rs.next()) {
            v.setId(rs.getInt("id"));
            v.setDataVenda(rs.getDate("data_venda"));
            v.setDataEntrega(rs.getDate("data_entrega"));
            v.setDataPagamento(rs.getDate("data_pagamento"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setVendedor(uDAO.carregarPorId(rs.getInt("usuario_id")));
            v.setCarrinho(this.itensVenda(id));
        }
        this.desconectar();
        return v;
    }
    
    public int carregarVendasPorMesAno(int mes, int ano) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "SELECT * FROM venda WHERE MONTH(data_venda) = ? AND YEAR(data_venda) = ?";
        st = conn.prepareStatement(sql);
        st.setInt(1, mes);
        st.setInt(2, ano);
        rs = st.executeQuery();
        Venda v = new Venda();
        while(rs.next()) {
            ret++;
        }
        this.desconectar();
        return ret;
    }
    
    public ArrayList<Venda> carregarMaiorQtdVenda(int mes, int ano) throws Exception{
        int ret=0;
        ArrayList<Venda> listId = new ArrayList<Venda>();
        this.conectar();
        String sql = "SELECT * FROM venda WHERE MONTH(data_venda) = ? AND YEAR(data_venda) = ?";
        st = conn.prepareStatement(sql);
        st.setInt(1, mes);
        st.setInt(2, ano);
        rs = st.executeQuery();
        while(rs.next()) {
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            listId.add(v);
        }
        this.desconectar();
        return listId;
    }
    
    public int registrar(Venda v) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "INSERT INTO venda (usuario_id,cliente_id,data_venda) VALUES(?,?,now())";
        st = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        st.setInt(1, v.getVendedor().getId());
        st.setInt(2, v.getCliente().getId());
        ret = st.executeUpdate();
        rs = st.getGeneratedKeys();
        if(rs.next()){
            v.setId(rs.getInt(1));
        }
        for(ItemVenda i:v.getCarrinho()){
            String sql_item = "INSERT INTO item_venda (venda_id, medicamento_id, qtd, valor) VALUES(?,?,?,?)";
            st = conn.prepareStatement(sql_item);
            st.setInt(1, v.getId());
            st.setInt(2, i.getMedicamento().getId());
            st.setDouble(3, i.getQtd());
            st.setDouble(4, i.getValor());
            st.executeUpdate();
        }
        this.desconectar();
        return ret;
    }
    
    public int registrarC(Venda v) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "INSERT INTO venda (cliente_id,data_venda) VALUES(?,now())";
        st = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        st.setInt(1, v.getCliente().getId());
        ret = st.executeUpdate();
        rs = st.getGeneratedKeys();
        if(rs.next()){
            v.setId(rs.getInt(1));
        }
        for(ItemVenda i:v.getCarrinho()){
            String sql_item = "INSERT INTO item_venda (venda_id, medicamento_id, qtd, valor) VALUES(?,?,?,?)";
            st = conn.prepareStatement(sql_item);
            st.setInt(1, v.getId());
            st.setInt(2, i.getMedicamento().getId());
            st.setDouble(3, i.getQtd());
            st.setDouble(4, i.getValor());
            st.executeUpdate();
        }
        this.desconectar();
        return ret;
    }
    
    public int registrarPagamento(int id) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "UPDATE  venda set data_pagamento=now() WHERE id=?";
        st = conn.prepareStatement(sql);
        st.setInt(1, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int registrarPagamentoCompraOnline(int vendedor_id, int id) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "UPDATE  venda SET usuario_id=?, data_pagamento=now() WHERE id=?";
        st = conn.prepareStatement(sql);
        st.setInt(1, vendedor_id);
        st.setInt(2, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    public int registrarEntrega(int id) throws Exception{
        int ret=0;
        this.conectar();
        String sql = "UPDATE  venda set data_entrega=now() WHERE id=?";
        st = conn.prepareStatement(sql);
        st.setInt(1, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public int cancelarVendaPorCliente(int id) throws Exception{
        int ret=0;
        this.conectar();
        String sql_item_venda = "DELETE FROM item_venda WHERE venda_id=?";
        st = conn.prepareStatement(sql_item_venda);
        st.setInt(1, id);
        st.executeUpdate();
        String sql_venda = "DELETE FROM venda WHERE id=?";
        st = conn.prepareStatement(sql_venda);
        st.setInt(1, id);
        ret = st.executeUpdate();
        this.desconectar();
        return ret;
    }
    
    public ArrayList<ItemVenda> itensVenda(int id) throws Exception{
        ArrayList<ItemVenda> listItensVenda = new ArrayList<ItemVenda>();
        this.conectar();
        String sql = "SELECT * FROM item_venda WHERE venda_id=? ORDER BY id";
        st = conn.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        while (rs.next()) {
            ItemVenda iv = new ItemVenda();
            iv.setId(rs.getInt("id"));
            iv.setQtd(rs.getDouble("qtd"));
            iv.setValor(rs.getDouble("valor"));
            MedicamentoDAO mDAO = new MedicamentoDAO();
            iv.setMedicamento(mDAO.carregarPorId(rs.getInt("medicamento_id")));
            listItensVenda.add(iv);
        }
        this.desconectar();
        return listItensVenda;
    }
    
    
}
