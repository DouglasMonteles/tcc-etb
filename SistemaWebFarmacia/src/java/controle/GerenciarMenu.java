package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Menu;
import modelo.MenuDAO;

public class GerenciarMenu extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarMenu</title>");            
            out.println("</head>");
            out.println("<body>");
            
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            Menu m = new Menu();
            int ret=0;
            String tipo = request.getParameter("tipo");
            int id = Integer.parseInt(request.getParameter("id"));
            String nome = request.getParameter("nome");
            String link = request.getParameter("link");
            String icone = request.getParameter("icone");
            
            m.setNome(nome);
            m.setLink(link);
            m.setIcone(icone);
            
            try{
                MenuDAO mDAO = new MenuDAO();
                switch(tipo){
                    case "inserir":
                        if(mDAO.inserir(m)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("menu.jsp");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_cadastro_menu.jsp");
                        }
                    ;break;
                    
                    case "alterar":
                        m.setId(id);
                        if(mDAO.alterar(m)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("menu.jsp");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_altera_menu.jsp?id="+id);
                        }
                    ;break;
                    
                    case "excluir":
                        if(mDAO.excluir(id)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                        }else{
                            session.setAttribute("ret",ret);
                        }
                        response.sendRedirect("menu.jsp");
                    ;break;
                }
            }catch(Exception e){
                out.print(e.getMessage());
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
