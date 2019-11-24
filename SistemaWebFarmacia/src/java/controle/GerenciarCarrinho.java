package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.ItemVenda;
import modelo.Medicamento;
import modelo.MedicamentoDAO;
import modelo.Venda;


public class GerenciarCarrinho extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCarrinho</title>");            
            out.println("</head>");
            out.println("<body>");
            
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            
            try {
                Venda v = (Venda) session.getAttribute("venda");
                ArrayList<ItemVenda> carrinho = v.getCarrinho();
                int qtd = Integer.parseInt(request.getParameter("qtd"));
                String op = request.getParameter("op");
                
                Medicamento m = new Medicamento();
                MedicamentoDAO mDAO = new MedicamentoDAO();
                
                switch(op){
                    case "add":
                        int id = Integer.parseInt(request.getParameter("medicamento_id"));
                        m = mDAO.carregarPorId(id);
                        double quantidade = Double.parseDouble(request.getParameter("quantidade"));
                        
                        ItemVenda item = new ItemVenda();
                        item.setMedicamento(m);
                        item.setQtd(quantidade);
                        item.setValor(m.getPreco());
                        carrinho.add(item);
                        v.setCarrinho(carrinho);
                        qtd++;
                        session.setAttribute("venda", v);
                        session.setAttribute("qtd", qtd);
                        response.sendRedirect("form_compra.jsp?op=c");
                    ;break;
                    
                    case "add_c":
                        int id_med = Integer.parseInt(request.getParameter("medicamento_id"));
                        m = mDAO.carregarPorId(id_med);
                        double quant = Double.parseDouble(request.getParameter("quantidade"));
                        
                        ItemVenda itens = new ItemVenda();
                        itens.setMedicamento(m);
                        itens.setQtd(quant);
                        itens.setValor(m.getPreco());
                        carrinho.add(itens);
                        v.setCarrinho(carrinho);
                        qtd++;
                        session.setAttribute("venda", v);
                        session.setAttribute("qtd", qtd);
                        response.sendRedirect("form_compra_cliente.jsp?op=c");
                    ;break;
                    
                    case "del":
                        int index = Integer.parseInt(request.getParameter("index"));
                        carrinho.remove(index);
                        v.setCarrinho(carrinho);
                        qtd--;
                        session.setAttribute("venda", v);
                        session.setAttribute("qtd", qtd);
                        response.sendRedirect("form_finalizar_venda.jsp");
                    ;break;
                    
                    case "del_c":
                        int index_c = Integer.parseInt(request.getParameter("index"));
                        carrinho.remove(index_c);
                        v.setCarrinho(carrinho);
                        qtd--;
                        session.setAttribute("venda", v);
                        session.setAttribute("qtd", qtd);
                        response.sendRedirect("form_finalizar_venda_cliente.jsp");
                    ;break;
                }
            } catch (Exception e) {
                out.print("Erro: "+e);
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
