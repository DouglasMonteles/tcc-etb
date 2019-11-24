package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Perfil;
import modelo.PerfilDAO;

public class GerenciarPerfil extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarPerfil</title>");            
            out.println("</head>");
            out.println("<body>");
            
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            int ret=0;
            int id = Integer.parseInt(request.getParameter("id"));
            String tipo = request.getParameter("tipo");
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");
            
            try {
                Perfil p = new Perfil();
                PerfilDAO pDAO = new PerfilDAO();
                p.setNome(nome);
                p.setDescricao(descricao);
                switch(tipo){
                    case "cadastrar":
                        if(pDAO.inserir(p)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("perfil.jsp");
                        }else{
                            ret=0;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_cadastrar_perfil.jsp");
                        }
                        ;break;
                        
                    case "alterar":
                        p.setId(id);
                        if(pDAO.alterar(p)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("perfil.jsp");
                        }else{
                            ret=0;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_alterar_perfil.jsp?id="+id);
                        }
                        ;break;
                        
                    case "excluir":
                        if(pDAO.excluir(id)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                        }else{
                            ret=0;
                            session.setAttribute("ret",ret);
                        }
                        response.sendRedirect("perfil.jsp");
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
