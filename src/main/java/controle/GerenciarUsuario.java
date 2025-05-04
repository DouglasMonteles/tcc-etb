package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Perfil;
import modelo.Usuario;
import modelo.UsuarioDAO;

public class GerenciarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Usuario u = new Usuario();
            int ret=0;
            try{
                UsuarioDAO uDAO = new UsuarioDAO();
                String tipo = request.getParameter("tipo");
                int id = Integer.parseInt(request.getParameter("id"));
                
                if("excluir".equals(tipo)){
                    if(uDAO.excluir(id)==1){
                        ret=1;
                        session.setAttribute("ret",ret);
                    }else{
                        session.setAttribute("ret",ret);
                    }
                    response.sendRedirect("usuario.jsp");
                }
                
                String user = request.getParameter("user");
                String senha = request.getParameter("senha");
                String nome = request.getParameter("nome");
                String sobrenome = request.getParameter("sobrenome");
                String cpf = request.getParameter("cpf");
                String sexo = request.getParameter("sexo");
                String cidade = request.getParameter("cidade");
                String logradouro = request.getParameter("logradouro");
                int casa = Integer.parseInt(request.getParameter("casa"));
                int apto = Integer.parseInt(request.getParameter("apto"));
                String telCelular = request.getParameter("tel_celular");
                String telFixo = request.getParameter("tel_fixo");
                String email = request.getParameter("email");
                int perfil = Integer.parseInt(request.getParameter("perfil"));

                //Setar as informações
                u.setNome(nome);
                u.setSobrenome(sobrenome);
                u.setCpf(cpf);
                u.setSexo(sexo);
                u.setCidade(cidade);
                u.setLogradouro(logradouro);
                u.setCasa(casa);
                u.setApto(apto);
                u.setTelCelular(telCelular);
                u.setTelFixo(telFixo);
                u.setEmail(email);
                u.setUser(user);
                u.setSenha(senha);
                //chave estrangeira
                Perfil p = new Perfil();
                p.setId(perfil);
                u.setPerfil(p);
                u.setData_Nasc(sdf.parse(request.getParameter("data_nascimento")));
                
                switch(tipo){  
                    case "inserir":
                        if(uDAO.inserir(u)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("usuario.jsp");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_cadastro_user.jsp");
                        }   
                    ;break;
                    
                    case "alterar":
                        u.setId(id);
                        if(uDAO.alterar(u)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("usuario.jsp");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_altera_user.jsp?id="+id);
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
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
