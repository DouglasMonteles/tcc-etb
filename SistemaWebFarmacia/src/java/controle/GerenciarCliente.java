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

public class GerenciarCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            int ret=0;
            Cliente c = new Cliente();
            
            try{
                ClienteDAO uDAO = new ClienteDAO();
                String tipo = request.getParameter("tipo");
                int id = Integer.parseInt(request.getParameter("id"));

                if("excluir".equals(tipo)){
                    if(uDAO.excluir(id)==1){
                        ret=1;
                        session.setAttribute("ret",ret);
                    }else{
                        session.setAttribute("ret",ret);
                    }  
                    response.sendRedirect("cliente.jsp");
                }

                String senha = request.getParameter("senha");
                String nome = request.getParameter("nome");
                String sobrenome = request.getParameter("sobrenome");
                String cpf = request.getParameter("cpf");
                String cidade = request.getParameter("cidade");
                String logradouro = request.getParameter("logradouro");
                int casa = Integer.parseInt(request.getParameter("casa"));
                int apto = Integer.parseInt(request.getParameter("apto"));
                String telCelular = request.getParameter("tel_celular");
                String telFixo = request.getParameter("tel_fixo");
                String email = request.getParameter("email");

                //Setar as informações de cliente
                c.setNome(nome);
                c.setSobrenome(sobrenome);
                c.setCpf(cpf);
                c.setCidade(cidade);
                c.setLogradouro(logradouro);
                c.setCasa(casa);
                c.setApto(apto);
                c.setTelCelular(telCelular);
                c.setTelFixo(telFixo);
                c.setEmail(email);
                c.setSenha(senha);
                
                switch(tipo){  
                    case "inserir":
                        if(uDAO.inserir(c)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("cliente.jsp");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_cadastra_cliente.jsp");
                        }   
                    ;break;
                    
                    case "inserir_online":
                        if(uDAO.inserir(c)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("index.jsp");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("index.jsp");
                        }   
                    ;break;
                    
                    case "alterarPorUsuario":
                        c.setId(id);
                        if(uDAO.alterar(c)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("cliente.jsp");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_altera_cliente.jsp?id="+id);
                        }   
                    ;break;
                       
                    case "alterarPorCliente":
                        c.setId(id);
                        if(uDAO.alterar(c)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_compra_cliente.jsp?op=n");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_altera_cliente_online.jsp?id="+id);
                        }   
                    ;break;
                }
                
            }catch(Exception ex){
                out.print(ex.getMessage());
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
