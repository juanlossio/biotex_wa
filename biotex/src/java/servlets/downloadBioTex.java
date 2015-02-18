/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Object.CandidatTerm;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juanlossio
 */
public class downloadBioTex extends HttpServlet {

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
        
        ArrayList<CandidatTerm> list_candidat_terms = (ArrayList)request.getSession().getAttribute("list_candidat_terms");
        String lang = (String)request.getSession().getAttribute("language");
        int term_validated = Integer.parseInt(request.getParameter("term_validated").toString()); 
        
        
            
        int name_file = (int) (Math.random() * 1000000);
            
            String folder_file = "/tmp";
            String file = folder_file + File.separator + "resultBioTex"+name_file+".xml";
            
            int count = 0;
            FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            
            bw.write("<?xml version='1.0' encoding='UTF-8'?>");
            bw.newLine();
            bw.write("<Terms>");
            bw.newLine();
                            
            while(count<1500 && count<list_candidat_terms.size()){
                if(term_validated==1){
                    bw.write("<Term id=\""+(count+1)+"\">");
                    bw.newLine();
                        bw.write("<name_term>"+ list_candidat_terms.get(count).getTerm() +"</name_term>");
                        bw.newLine();
                        bw.write("<is_true_term validated_by=\""+list_candidat_terms.get(count).getSourceDictionary()+"\">"+ list_candidat_terms.get(count).getIsTrueTerm() +"</is_true_term>");
                        bw.newLine();
                    bw.write("</Term>");
                    bw.newLine();
                }else{
                    if(term_validated==2 && list_candidat_terms.get(count).getIsTrueTerm()==1){
                        bw.write("<Term id=\""+(count+1)+"\">");
                        bw.newLine();
                            bw.write("<name_term>"+ list_candidat_terms.get(count).getTerm() +"</name_term>");
                            bw.newLine();
                            bw.write("<is_true_term validated_by=\""+list_candidat_terms.get(count).getSourceDictionary()+"\">"+ list_candidat_terms.get(count).getIsTrueTerm() +"</is_true_term>");
                            bw.newLine();
                        bw.write("</Term>");
                        bw.newLine();
                    }else{
                        if(term_validated==3 && list_candidat_terms.get(count).getIsTrueTerm()<=0){
                            bw.write("<Term id=\""+(count+1)+"\">");
                            bw.newLine();
                                bw.write("<name_term>"+ list_candidat_terms.get(count).getTerm() +"</name_term>");
                                bw.newLine();
                                bw.write("<is_true_term validated_by=\""+list_candidat_terms.get(count).getSourceDictionary()+"\">"+ list_candidat_terms.get(count).getIsTrueTerm() +"</is_true_term>");
                                bw.newLine();
                            bw.write("</Term>");
                            bw.newLine();
                        }
                    }
                }
                count++;
            }
            bw.write("</Terms>");
            bw.newLine();
            bw.close();
            fw.close();
            
            response.setContentType("text/html;charset=UTF-8");
            try
            {
                String nFile = "resultBioTex"+name_file+".xml";	
                FileInputStream archivo = new FileInputStream(file); 
                int longitud = archivo.available();
                byte[] datos = new byte[longitud];
                archivo.read(datos);
                archivo.close();

                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition","attachment;filename="+nFile);    

                ServletOutputStream ouputStream = response.getOutputStream();
                ouputStream.write(datos);
                ouputStream.flush();
                ouputStream.close();

            }
            catch(Exception e)
            { 
                e.printStackTrace();
            }  
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
