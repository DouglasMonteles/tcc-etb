package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;

public class VerificaLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerificaLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession session = request.getSession();
            String tipo = request.getParameter("tipo");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            
            try {
                switch(tipo){
                    case "login_colaborador":
                        UsuarioDAO uDAO = new UsuarioDAO();
                        Usuario u = uDAO.logar(login, senha);
                        if(u.getId()>0){
                            session.setAttribute("sessionUser", u);
                            response.sendRedirect("administracao.jsp");
                        }else{
                            out.print("<script>"
                                    + "alert('Usuário ou Senha Incorretos!');"
                                    + "location.href='index.jsp'"
                                    + "</script>");
                        }
                    ;break;
                    
                    case "login_cliente":
                        ClienteDAO cDAO = new ClienteDAO();
                        Cliente c = cDAO.logar(login, senha);
                        if(c.getId()>0){
                            session.setAttribute("sessionCliente", c);
                            response.sendRedirect("form_compra_cliente.jsp?id="+c.getId()+"&op=n");
                        }else{
                            out.print("<script>"
                                    + "alert('Usuário ou Senha Incorretos!');"
                                    + "location.href='index.jsp'"
                                    + "</script>");
                        }
                        ;break;
                }
            } catch (Exception e) {
                out.print("Erro: "+e.getMessage());
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
