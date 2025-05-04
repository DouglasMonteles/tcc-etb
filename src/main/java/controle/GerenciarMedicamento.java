package controle;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.Medicamento;
import modelo.MedicamentoDAO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, //2MB
        maxFileSize = 1024 * 1024 * 10, //10MB
        maxRequestSize = 1024 * 1024 * 50) //50MB
public class GerenciarMedicamento extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarMedicamento</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            int ret=0;
            try{
                MedicamentoDAO mDAO = new MedicamentoDAO();
                request.setCharacterEncoding("UTF-8");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String tipo = request.getParameter("tipo");
                int id = Integer.parseInt(request.getParameter("id"));

                if("excluir".equals(tipo)){
                    if(mDAO.excluir(id)==1){
                        ret=1;
                        session.setAttribute("ret",ret);
                    }else{
                        session.setAttribute("ret",ret);
                    }
                    response.sendRedirect("fornecedor.jsp");
                }

                String nome = request.getParameter("nome");
                String indicacao = request.getParameter("indicacao");
                String precaucoes = request.getParameter("precaucoes");
                Double preco = Double.parseDouble(request.getParameter("preco"));
                int lote = Integer.parseInt(request.getParameter("lote"));
                String obs = request.getParameter("obs");
                String laboratorio = request.getParameter("laboratorio");
                String composicao = request.getParameter("composicao");
                
                Part part = request.getPart("file");
                String fileName = extractFileName(part);
                part.write(request.getServletContext().getRealPath("img") + File.separator + fileName);
                
                Medicamento m = new Medicamento();
                m.setNome(nome);
                m.setIndicacao(indicacao);
                m.setPrecaucoes(precaucoes);
                m.setPreco(preco);
                m.setLote(lote);
                m.setObs(obs);
                m.setLaboratorio(laboratorio);
                m.setComposicao(composicao);
                m.setFile(fileName);
                m.setDataFabricacao(sdf.parse(request.getParameter("data_fabricacao")));
                m.setDataValidade(sdf.parse(request.getParameter("data_validade")));
                
                switch(tipo){
                    case "inserir":
                        if(mDAO.inserir(m)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("medicamento.jsp");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_cadastro_medicamento.jsp");
                        }
                    ;break;
                    
                    case "alterar":
                        m.setId(id);
                        if(mDAO.alterar(m)==1){
                            ret=1;
                            session.setAttribute("ret",ret);
                            response.sendRedirect("medicamento.jsp");
                        }else{
                            session.setAttribute("ret",ret);
                            response.sendRedirect("form_altera_medicamento.jsp?id="+id);
                        }
                    ;break;
                }
            }catch(Exception e){
                out.print(e.getMessage());
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] itens = contentDisp.split(";");
        for(String s : itens){
            if(s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
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
