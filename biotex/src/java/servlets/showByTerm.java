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
public class showByTerm extends HttpServlet {

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
        try {
            ArrayList<CandidatTerm> list_candidat_terms = (ArrayList)request.getSession().getAttribute("list_candidat_terms");
            int term_validated = Integer.parseInt(request.getParameter("term_validated").toString());
    
            int len = list_candidat_terms.size();            
    
            String html = "";
    if(term_validated == 1){
        html = "<table width='100%' cellspacing = '10' style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:13px;'>"
                + "<tr> "
                + "<th>N&deg;</th>"
                + "<th>Extracted Term</th> "
                + "<th colspan=3>Biomedical term? Y/N/DK</th> "
                + "</tr> ";
            for(int i=0;i<len;i++){
                html = html + "<tr>" + 
                                "<td>"+(i+1)+"</td>";
                if(list_candidat_terms.get(i).getIsTrueTerm()==1){
                    html = html + "<td><div style='color:green'>"+list_candidat_terms.get(i).getTerm() + "</div>"
                                    + "<div class='sourcename'>Validated by : "+ list_candidat_terms.get(i).getSourceDictionary() +"</div></td>";
                }else{
                    html = html + "<td style='color:red'>"+list_candidat_terms.get(i).getTerm()+"</td>";
                }
                html = html + "<style type='text/css'>"+
                    "#si1_"+i+",#no1_"+i+",#dontknow1_"+i+"{" +
                        "display:none;"+
                    "}"+ 
                   "#si1_"+i+",#si2_"+i+",#no1_"+i+",#no2_"+i+",#dontknow1_"+i+",#dontknow2_"+i+"{"+
                        "float: left;"+
                    "}"+
                "</style>"+
            "<div id='botones'>"+
                "<td>"+
                  "<div id='si1_"+i+"'>"+
                  	"<a id='a_envoyer' href='#' style='border: 0;'><img class='imagenes' src='images/si1.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                  "<div id='si2_"+i+"'>"+
                  	"<a id='a_annuler' href='#' style='border: 0;' onclick='modify_True_Term("+i+","+1+")' ><img class='imagenes' src='images/si2.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                "</td>"+
                "<td>"+
                  "<div id='no1_"+i+"'>"+
                  	"<a id='yyy' href='#' style='border: 0;'><img class='imagenes' src='images/no1.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                  "<div id='no2_"+i+"'>"+
                  	"<a id='xxx' href='#' style='border: 0;' onclick='modify_True_Term("+i+","+-1+")' ><img class='imagenes' src='images/no2.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                "</td>"+
                "<td>"+
                  "<div id='dontknow1_"+i+"'>"+
                  	"<a id='yyy' href='#' style='border: 0;'><img class='imagenes' src='images/dontknow3.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                  "<div id='dontknow2_"+i+"'>"+
                  	"<a id='xxx' href='#' style='border: 0;' onclick='modify_True_Term("+i+","+0+")' ><img class='imagenes' src='images/dontknow4.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                "</td>"+
            "</div>";
                
                if(list_candidat_terms.get(i).getIsTrueTerm()==1){
                    html = html + "<script type='text/javascript' language='javascript'> "
                                + "$('#si2_"+i+"').css('display', 'none'); "
                                + "$('#no1_"+i+"').css('display', 'none'); "
                                + "$('#dontknow1_"+i+"').css('display', 'none');"
                                + "$('#dontknow2_"+i+"').css('display', 'inline');"
                                + "$('#no2_"+i+"').css('display', 'inline'); "
                                + "$('#si1_"+i+"').css('display', 'inline'); "
                                + "</script>";
                }else{
                    if(list_candidat_terms.get(i).getIsTrueTerm()==-1){
                        html = html + "<script type='text/javascript' language='javascript'> "
                                    + "$('#no2_"+i+"').css('display', 'none'); "
                                    + "$('#si1_"+i+"').css('display', 'none'); "
                                    + "$('#dontknow1_"+i+"').css('display', 'none');"
                                    + "$('#dontknow2_"+i+"').css('display', 'inline');"
                                    + "$('#si2_"+i+"').css('display', 'inline'); "
                                    + "$('#no1_"+i+"').css('display', 'inline'); "
                                    + "</script>";
                    }else{
                        if(list_candidat_terms.get(i).getIsTrueTerm()==0){
                            html = html + "<script type='text/javascript' language='javascript'> "
                                        + "$('#si1_"+i+"').css('display', 'none'); "
                                        + "$('#no1_"+i+"').css('display', 'none'); "
                                        + "$('#dontknow2_"+i+"').css('display', 'none');"
                                        + "$('#no2_"+i+"').css('display', 'inline'); "
                                        + "$('#si2_"+i+"').css('display', 'inline'); "
                                        + "$('#dontknow1_"+i+"').css('display', 'inline');"
                                        + "</script>";
                        }
                    }
                }
                                
            html = html + "</tr>";
            }
            html = html + "</table>";
    }else{
        if(term_validated == 2){
            html = "<table width='100%' cellspacing = '10' style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:13px;'>"
                + "<tr> "
                + "<th>N&deg;</th>"
                + "<th>Extracted Term</th> "
                + "<th colspan=3>Biomedical term? Y/N/DK</th> "
                + "</tr> ";
            for(int i=0;i<len;i++){
                if(list_candidat_terms.get(i).getIsTrueTerm()==1){
                    html = html + "<tr>" + 
                                "<td>"+(i+1)+"</td>";
                    
                    html = html + "<td><div style='color:green'>"+list_candidat_terms.get(i).getTerm() + "</div>"
                                    + "<div class='sourcename'>Source: "+ list_candidat_terms.get(i).getSourceDictionary() +"</div></td>";
                    
                    html = html + "<style type='text/css'>"+
                    "#si1_"+i+",#no1_"+i+",#dontknow1_"+i+"{" +
                        "display:none;"+
                    "}"+ 
                   "#si1_"+i+",#si2_"+i+",#no1_"+i+",#no2_"+i+",#dontknow1_"+i+",#dontknow2_"+i+"{"+
                        "float: left;"+
                    "}"+
                "</style>"+
            "<div id='botones'>"+
                "<td>"+
                  "<div id='si1_"+i+"'>"+
                  	"<a id='a_envoyer' href='#' style='border: 0;'><img class='imagenes' src='images/si1.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                  "<div id='si2_"+i+"'>"+
                  	"<a id='a_annuler' href='#' style='border: 0;' onclick='modify_True_Term("+i+","+1+")' ><img class='imagenes' src='images/si2.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                "</td>"+
                "<td>"+
                  "<div id='no1_"+i+"'>"+
                  	"<a id='yyy' href='#' style='border: 0;'><img class='imagenes' src='images/no1.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                  "<div id='no2_"+i+"'>"+
                  	"<a id='xxx' href='#' style='border: 0;' onclick='modify_True_Term("+i+","+-1+")' ><img class='imagenes' src='images/no2.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                "</td>"+
                "<td>"+
                  "<div id='dontknow1_"+i+"'>"+
                  	"<a id='yyy' href='#' style='border: 0;'><img class='imagenes' src='images/dontknow3.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                  "<div id='dontknow2_"+i+"'>"+
                  	"<a id='xxx' href='#' style='border: 0;' onclick='modify_True_Term("+i+","+0+")' ><img class='imagenes' src='images/dontknow4.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                "</td>"+
            "</div>";
                    
                    html = html + "<script type='text/javascript' language='javascript'> "
                                + "$('#si2_"+i+"').css('display', 'none'); "
                                + "$('#no1_"+i+"').css('display', 'none'); "
                                + "$('#dontknow1_"+i+"').css('display', 'none');"
                                + "$('#dontknow2_"+i+"').css('display', 'inline');"
                                + "$('#no2_"+i+"').css('display', 'inline'); "
                                + "$('#si1_"+i+"').css('display', 'inline'); "
                                + "</script>";
                    html = html + "</tr>";
                }               
            }
            html = html + "</table>";
        }else{
            if(term_validated == 3){
                html = "<table width='100%' cellspacing = '10' style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:13px;'>"
                + "<tr> "
                + "<th>N&deg;</th>"
                + "<th>Extracted Term</th> "
                + "<th colspan=3>Biomedical term? Y/N/DK</th> "
                + "</tr> ";
            for(int i=0;i<len;i++){
                
                if(list_candidat_terms.get(i).getIsTrueTerm()==0 || list_candidat_terms.get(i).getIsTrueTerm()==-1){
                    html = html + "<tr>" + 
                                "<td>"+(i+1)+"</td>";
                    
                    html = html + "<td style='color:red'>"+list_candidat_terms.get(i).getTerm()+"</td>";
                    
                    html = html + "<style type='text/css'>"+
                    "#si1_"+i+",#no1_"+i+",#dontknow1_"+i+"{" +
                        "display:none;"+
                    "}"+ 
                   "#si1_"+i+",#si2_"+i+",#no1_"+i+",#no2_"+i+",#dontknow1_"+i+",#dontknow2_"+i+"{"+
                        "float: left;"+
                    "}"+
                "</style>"+
            "<div id='botones'>"+
                "<td>"+
                  "<div id='si1_"+i+"'>"+
                  	"<a id='a_envoyer' href='#' style='border: 0;'><img class='imagenes' src='images/si1.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                  "<div id='si2_"+i+"'>"+
                  	"<a id='a_annuler' href='#' style='border: 0;' onclick='modify_True_Term("+i+","+1+")' ><img class='imagenes' src='images/si2.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                "</td>"+
                "<td>"+
                  "<div id='no1_"+i+"'>"+
                  	"<a id='yyy' href='#' style='border: 0;'><img class='imagenes' src='images/no1.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                  "<div id='no2_"+i+"'>"+
                  	"<a id='xxx' href='#' style='border: 0;' onclick='modify_True_Term("+i+","+-1+")' ><img class='imagenes' src='images/no2.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                "</td>"+
                "<td>"+
                  "<div id='dontknow1_"+i+"'>"+
                  	"<a id='yyy' href='#' style='border: 0;'><img class='imagenes' src='images/dontknow3.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                  "<div id='dontknow2_"+i+"'>"+
                  	"<a id='xxx' href='#' style='border: 0;' onclick='modify_True_Term("+i+","+0+")' ><img class='imagenes' src='images/dontknow4.jpg' border='0' style='width: 48px; height: 25px;' /></a>"+
                  "</div>"+
                "</td>"+
            "</div>";
                
                if(list_candidat_terms.get(i).getIsTrueTerm()==-1){
                        html = html + "<script type='text/javascript' language='javascript'> "
                                    + "$('#no2_"+i+"').css('display', 'none'); "
                                    + "$('#si1_"+i+"').css('display', 'none'); "
                                    + "$('#dontknow1_"+i+"').css('display', 'none');"
                                    + "$('#dontknow2_"+i+"').css('display', 'inline');"
                                    + "$('#si2_"+i+"').css('display', 'inline'); "
                                    + "$('#no1_"+i+"').css('display', 'inline'); "
                                    + "</script>";
                }else{
                    if(list_candidat_terms.get(i).getIsTrueTerm()==0){
                        html = html + "<script type='text/javascript' language='javascript'> "
                                    + "$('#si1_"+i+"').css('display', 'none'); "
                                    + "$('#no1_"+i+"').css('display', 'none'); "
                                    + "$('#dontknow2_"+i+"').css('display', 'none');"
                                    + "$('#no2_"+i+"').css('display', 'inline'); "
                                    + "$('#si2_"+i+"').css('display', 'inline'); "
                                    + "$('#dontknow1_"+i+"').css('display', 'inline');"
                                    + "</script>";
                    }
                }
                                
            html = html + "</tr>";
                }
                
            }
            html = html + "</table>";
            }
        }
    }
 
    out.println(html);
        } finally {            
            out.close();
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
