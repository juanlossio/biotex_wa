<%-- 
    Document   : resultado
    Created on : 30 oct. 2013, 16:47:16
    Author     : juanlossio
--%>

<%@page import="Object.CandidatTerm"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<CandidatTerm> list_candidat_terms = (ArrayList)request.getSession().getAttribute("list_candidat_terms");
    int term_validated = Integer.parseInt(request.getParameter("term_validated").toString());
    int len = list_candidat_terms.size();            
    
    int num_term_by_val = 0;
    if(term_validated == 1){//Todos los términos
        num_term_by_val = len;
    }else{
        if(term_validated == 2){//Only validated
            for(int r=0;r<list_candidat_terms.size();r++){
                if(list_candidat_terms.get(r).getIsTrueTerm()==1){
                    num_term_by_val++;
                }
            }
        }else{
            if(term_validated == 3){//Not validated
                for(int r=0;r<list_candidat_terms.size();r++){
                    if(list_candidat_terms.get(r).getIsTrueTerm()<=0){
                        num_term_by_val++;
                    }
                }
            }
        }
    }
    
    int div_page = num_term_by_val/120;
    int mod_page = num_term_by_val%120;
    int num_page;
    if(mod_page>0){
        num_page = div_page + 1;
    }else{
        num_page = div_page;
    }
    
    String pagination = "<p class='pages'> "
            + "<small>Number of terms : " + num_term_by_val + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Page 1 of " + num_page + " &nbsp;</small>";
            //+ "<span>1</span> ";
            for(int j=0;j<num_page;j++){       
                pagination = pagination + "<a href='#' onclick='show_term_interval("+j+")'>"+ (j+1) +"</a>";
            }
            pagination = pagination //+ "<a href='#'>&raquo;</a>"
            + "</p>";
    
    
    String html = "";
    if(term_validated == 1){
        html = "<div class='listOkapi'><table width='100%' cellspacing = '10' style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:13px;'>"
                + "<tr> "
                + "<th>N&deg;</th>"
                + "<th>Extracted Term</th> "
                + "<th colspan=3>Biomedical term? Y/N/DK</th> "
                + "</tr> ";
                int i = 0;
                while(i<120 && i<len){
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
            i++;
            }
            html = html + "</table></div>";
    }else{
        if(term_validated == 2){
            html = "<div class='listOkapi'><table width='100%' cellspacing = '10' style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:13px;'>"
                + "<tr> "
                + "<th>N&deg;</th>"
                + "<th>Extracted Term</th> "
                + "<th colspan=3>Biomedical term? Y/N/DK</th> "
                + "</tr> ";
            //for(int i=0;i<len;i++){
            int i = 0;
            int count_terms = 0;
            while(count_terms<120 && i<len){
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
                    count_terms++;
                }  
                i++; 
                
            }
            html = html + "</table></div>";
        }else{
            if(term_validated == 3){
                html = "<div class='listOkapi'><table width='100%' cellspacing = '10' style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:13px;'>"
                + "<tr> "
                + "<th>N&deg;</th>"
                + "<th>Extracted Term</th> "
                + "<th colspan=3>Biomedical term? Y/N/DK</th> "
                + "</tr> ";
            //for(int i=0;i<len;i++){
            int i = 0;
            int count_terms = 0;
            while(count_terms<120 && i<len){
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
                count_terms++;
                }
            i++;   
            }
            html = html + "</table></div>";
            }
        }
    }
    html = pagination + html + pagination;
    out.print(html);
%>
