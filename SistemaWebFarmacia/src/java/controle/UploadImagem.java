package controle;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.Imagem;
import modelo.ImagemDAO;

@WebServlet(name = "UploadImagem", urlPatterns = {"/UploadImagem"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, //2MB
        maxFileSize = 1024 * 1024 * 10, //10MB
        maxRequestSize = 1024 * 1024 * 50) //50MB

public class UploadImagem extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        int ret=0;
        int id = Integer.parseInt(request.getParameter("id"));
        String tipo = request.getParameter("tipo");
        
        Part part = request.getPart("file");
        String fileName = extractFileName(part);//extrai o nome do arquivo
        //String savePath = "C:\\Users\\Marlene\\Documents\\NetBeansProjects\\upload\\web\\img\\" + File.separator + fileName;
        //File fileSaveDir = new File(savePath);
        
        part.write(request.getServletContext().getRealPath("img") + File.separator + fileName);
        //part.write(savePath + File.separator);
        
        Imagem i = new Imagem();
        i.setFile(fileName);
        //up.setPath(savePath);
        
        try {
            ImagemDAO iDAO = new ImagemDAO();
            
            switch(tipo){
                case "img_usuario":
                    if(iDAO.inserirImgUsuario(i, id) == 1){
                        ret=1;
                        session.setAttribute("ret",ret);
                        response.sendRedirect("usuario.jsp");
                    }else{
                        ret=0;
                        session.setAttribute("ret", ret);
                        response.sendRedirect("usuario.jsp");
                    }
                ;break;
                
                case "img_cliente":
                    if(iDAO.inserirImgCliente(i, id) == 1){
                        ret=1;
                        session.setAttribute("ret",ret);
                        response.sendRedirect("cliente.jsp");
                    }else{
                        ret=0;
                        session.setAttribute("ret", ret);
                        response.sendRedirect("cliente.jsp");
                    }
                ;break;
                
                case "img_med":
                    if(iDAO.inserirImgMed(i, id) == 1){
                        ret=1;
                        session.setAttribute("ret",ret);
                        response.sendRedirect("medicamento.jsp");
                    }else{
                        ret=0;
                        session.setAttribute("ret", ret);
                        response.sendRedirect("medicamento.jsp");
                    }
                ;break;
            }
        } catch (Exception ex) {
            out.println(ex.getMessage());
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

}
