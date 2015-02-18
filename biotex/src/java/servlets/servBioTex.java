/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Object.CandidatTerm;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author juanlossio
 */
@MultipartConfig

public class servBioTex extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        
        ArrayList<CandidatTerm> list_candidat_terms = null;
        
        //On commence
        //String currentDir = System.getProperty("user.dir");
        String folder_file = "/tmp";
        int name_file = (int) (Math.random() * 1000000);
        
        String pos_tagger = request.getParameter("pos_tagger");
        String num_patterns = request.getParameter("num_patterns");
        String typeterms = request.getParameter("typeterms");
        String measure = request.getParameter("measure");
        String normalization = request.getParameter("normalization");
        String text_language = request.getParameter("text_language");
        String typesource = request.getParameter("typesource");
        
           
        if(typesource.equalsIgnoreCase("2")){
            measure = measure + "_" + normalization.substring(0, 1);
        }
        
        final Part filePart = request.getPart("file_text");
        final String fileName = getFileName(filePart);
        String nom_fichier = name_file + fileName;
        
        FileWriter fw = null;
        BufferedWriter bw = null;
        
        BufferedReader reader = null;
        
        try {
            reader = new BufferedReader(new InputStreamReader(filePart.getInputStream()));
            fw = new FileWriter(folder_file+File.separator+nom_fichier);
            bw = new BufferedWriter(fw);
            String line;
            
            while((line = reader.readLine()) != null) {
                bw.write(line.trim());
                bw.newLine();
            }
            filePart.delete();
            reader.close();
            bw.close();
            fw.close();

            /****************************************
             * **************************************
             * * **************************************
             * * **************************************
             * * **************************************
            C A M B I A R       A Q U I I I I I 
            * * **************************************
            * * **************************************
            * * **************************************
            * * **************************************
            */
            //list_candidat_terms = Execution.main_execution(text_language,Integer.parseInt(num_patterns),typeterms,measure,Integer.parseInt(typesource),folder_file+File.separator+nom_fichier,pos_tagger);

            /* TODO output your page here. You may use following sample code. */
            //getServletContext().setAttribute("list_candidat_terms",(ArrayList<CandidatTerm>)list_candidat_terms);
            //request.setAttribute("xxx",new Integer(1));
            
            //request.getSession().setAttribute("service", service);
            //RequestDispatcher rd = request.getRequestDispatcher("/ListBooks.jsp");
            //rd.forward(request, response);
                
                
            
            //request.setAttribute("language",text_language);
            request.getSession().setAttribute("language",text_language);
            request.getSession().setAttribute("list_candidat_terms",(ArrayList<CandidatTerm>)list_candidat_terms);
            RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
            rd.forward(request, response);
            
        } catch(Exception ex) {     
            out.println("<html>");
            out.println("<head>");
            out.println("<title>ERROR</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>"+ex.toString()+"</h1>");
            //out.println("<h1>"+currentDir+File.separator+fileName+"</h1>");
            out.println("<br/> " + pos_tagger);
            out.println("<br/> " + num_patterns);
            out.println("<br/> " + typeterms);
            out.println("<br/> " + measure);
            out.println("<br/> " + normalization);
            out.println("<br/> " + text_language);
            out.println("<br/> " + typesource);
            //out.println("<br/> " + list_candidat_terms.size());
            //out.println("<br/> " + fileName);
            out.println("</body>");
            out.println("</html>");
            
            out.close();
        }
        
    }

    private String getFileName(final Part part){
        //final String partHeader = part.getHeader("content-disposition");
        for(String content : part.getHeader("content-disposition").split(";")){
            if(content.trim().startsWith("filename")){
                return content.substring(content.indexOf("=")+1).trim().replace("\"", "");
            }
        }
        return null;
    }
    
    private static String show_list_terms(ArrayList<CandidatTerm> list_candidat_terms){
        String html = "";
        //for(int i=0;i<list_candidat_terms.size();i++){
        for(int i=0;i<list_candidat_terms.size();i++){
            html = html + "<br/>" + list_candidat_terms.get(i).getTerm()+"   "+list_candidat_terms.get(i).getImportance();
        }
        return html;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
