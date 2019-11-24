package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.VendaDAO;

public class RegistrarSituacaoVenda extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrarSituacaoVenda</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession session = request.getSession();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String tipo = request.getParameter("tipo");
            int id =Integer.parseInt(request.getParameter("id"));
            int ret=0;
            
            try{
                VendaDAO vDAO = new VendaDAO();
                switch(tipo){
                    case "pagamento":
                        vDAO.registrarPagamento(id);
                        response.sendRedirect("venda.jsp");
                    ;break;
                    
                    case "e_pagamento":
                        int vend_id = Integer.parseInt(request.getParameter("vendedor_id"));
                        vDAO.registrarPagamentoCompraOnline(vend_id, id);
                        response.sendRedirect("venda.jsp");
                    ;break;

                    case "entrega":
                        vDAO.registrarEntrega(id);
                        response.sendRedirect("venda.jsp");
                    ;break;
                    
                    case "cancelarByCliente":
                        int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
                        vDAO.cancelarVendaPorCliente(id);
                        response.sendRedirect("venda_cliente.jsp?id="+id_cliente);
                    ;break;
                }
                
            }catch(Exception e){
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
