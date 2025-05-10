package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Fornecedor;
import modelo.FornecedorDAO;

public class GerenciarFornecedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarFornecedor</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession session = request.getSession();
            Fornecedor f = new Fornecedor();
            
            try {
                int ret=0;
                FornecedorDAO fDAO = new FornecedorDAO();
                request.setCharacterEncoding("UTF-8");
                int id = Integer.parseInt(request.getParameter("id"));
                String tipo = request.getParameter("tipo");
                String nome = request.getParameter("nome");
                String cnpj = request.getParameter("cnpj");
                String localizacao = request.getParameter("localizacao");
                String logo = request.getParameter("logo");
                String user = request.getParameter("user");
                String senha = request.getParameter("senha");
                
                f.setNome(nome);
                f.setCnpj(cnpj);
                f.setLocalizacao(localizacao);
                f.setLogo(logo);
                f.setUser(user);
                f.setSenha(senha);
                
                switch(tipo){
                    case "inserir":
                        if(fDAO.inserir(f)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("fornecedor.jsp");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_cadastro_fornecedor.jsp");
                        }
                    ;break;
                    
                    case "alterar":
                        f.setId(id);
                        if(fDAO.alterar(f)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("fornecedor.jsp");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_altera_fornecedor.jsp?id="+id);
                        }
                    ;break;
                        
                    case "excluir":
                        if(fDAO.excluir(id)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                        }else{
                            session.setAttribute("ret",ret);
                        }
                        response.sendRedirect("fornecedor.jsp");
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
