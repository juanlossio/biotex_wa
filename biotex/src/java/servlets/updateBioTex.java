/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Object.CandidatTerm;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juanlossio
 */
public class updateBioTex extends HttpServlet {

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

        int id_term = Integer.parseInt(request.getParameter("id_term").toString());
        int is_term = Integer.parseInt(request.getParameter("is_term").toString());        

        if(id_term >= 0){
                CandidatTerm ct = list_candidat_terms.get(id_term);
                ct.setIsTrueTerm(is_term);
                if(ct.getSourceDictionary().equalsIgnoreCase("")){
                    ct.setSourceDictionary("Manually");
                }
                
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                
                out.println(list_candidat_terms.get(id_term).getIsTrueTerm());
                out.flush();
                out.close();
        }
        request.getSession().setAttribute("list_candidat_terms",(ArrayList<CandidatTerm>)list_candidat_terms);
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
