<%-- 
    Document   : result
    Created on : 23 oct. 2013, 11:10:38
    Author     : juanlossio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Object.CandidatTerm"%> 
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <title>BioTex | Results & Evaluation</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="stylebutton.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="js/cufon-yui.js"></script>
    <script type="text/javascript" src="js/arial.js"></script>
    <script type="text/javascript" src="js/cuf_run.js"></script>
    <script type="text/javascript" src="js/javascript.js"></script>  
    <script type="text/javascript" language="javascript">
        function modify_True_Term(idterm,isterm){
            event.preventDefault();
            $.ajax({
                type : "GET",
                url : "/biotex/updateBioTex", 
                data : {id_term: idterm, is_term: isterm}, 
                success : function(msg) {
                    //console.log("success:"+msg);
                    if(isterm == 1){
                        $("#si2_"+idterm).css("display", "none");
                        $("#no1_"+idterm).css("display", "none");
                        $("#dontknow1_"+idterm).css("display", "none");
                        $("#dontknow2_"+idterm).css("display", "inline");
                        $("#no2_"+idterm).css("display", "inline");
                        $("#si1_"+idterm).css("display", "inline");
                    }else{
                        if(isterm == -1){
                            $("#no2_"+idterm).css("display", "none");
                            $("#si1_"+idterm).css("display", "none");
                            $("#dontknow1_"+idterm).css("display", "none");
                            $("#dontknow2_"+idterm).css("display", "inline");
                            $("#si2_"+idterm).css("display", "inline");
                            $("#no1_"+idterm).css("display", "inline");
                        }else{
                            if(isterm == 0){
                                $("#dontknow2_"+idterm).css("display", "none");
                                $("#si1_"+idterm).css("display", "none");
                                $("#no1_"+idterm).css("display", "none");
                                $("#no2_"+idterm).css("display", "inline");
                                $("#si2_"+idterm).css("display", "inline");
                                $("#dontknow1_"+idterm).css("display", "inline");
                            }
                        }
                    }
                },
                error: function(request, textStatus, errorThrown)
                {
                    alert("Refresh page");
                    //alert("Load again the application" + textStatus);
                    //alert("error:" + errorThrown);
                    //alert("error:" + request);
                },
                complete: function(request, textStatus)
                {
                    //console.log("complete" + request.responseText);
                    //console.log("complete" + textStatus);
                }
            });
        }  
        
        function modify_showTerms() 
        {
            var ter_val = term_validated.value;
            //alert(ter_val);
            $.ajax({
                type : "GET",
                //url : "/biotexv/showByTerm", 
                url: "resultByValidation.jsp",
                data : {term_validated: ter_val}, 
                success : function(msg) {
                    $("#container_results").html(msg);
                },
                error: function(request, textStatus, errorThrown)
                {
                    alert("Refresh page");
                    //alert("error:" + textStatus);
                    //alert("error:" + errorThrown);
                    //alert("error:" + request);
                },
                complete: function(request, textStatus)
                {
                    //console.log("complete" + request.responseText);
                    //console.log("complete" + textStatus);
                }
            });
        }
        
        function show_term_by_validation_by_interval(index) 
        {
            var ter_val = term_validated.value;
            //alert(ter_val+ "  -  "+index);
            event.preventDefault();
            $.ajax({
                type : "GET",
                //url : "/biotexv/showByTerm", 
                url: "resultPagination.jsp",
                data : {term_validated: ter_val, indice: index}, 
                success : function(msg) {
                    $("#container_results").html(msg);
                },
                error: function(request, textStatus, errorThrown)
                {
                    alert("Refresh page");
                    //alert("error:" + textStatus);
                    //alert("error:" + errorThrown);
                    //alert("error:" + request);
                },
                complete: function(request, textStatus)
                {
                    //console.log("complete" + request.responseText);
                    //console.log("complete" + textStatus);
                }
            });
        }
    </script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
          <h1><a href="index.jsp">BioTex</a> <small><b>BIO</b>medical <b>T</b>erm <b>EX</b>traction</small></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.jsp">Extraction</a></li>
          <li class="active"><a href="result.jsp">Evaluation</a></li>
          <li><a href="about.jsp">About</a></li>
          <li><a href="documentation.jsp">Documentation</a></li>
          <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
          <%
            ArrayList<CandidatTerm> list_candidat_terms = (ArrayList)request.getSession().getAttribute("list_candidat_terms");
            String language = (String)request.getSession().getAttribute("language");

            int len = list_candidat_terms.size();
        %>
        <div class="article">
          <h2>List of Extracted Terms</h2>
          <div class="clr"></div> 
        <%
        String html = "<div class='listOkapi'>"
                + "<table width='100%' cellspacing = '10' style='font-family:Verdana, Arial, Helvetica, sans-serif; font-size:13px;'>"
                + "<tr> "
                + "<th>N&deg;</th>"
                + "<th>Extracted Term</th> "
                + "<th colspan=3>Biomedical term? Y/N/DK</th> "
                + "</tr> ";
            
            int i = 0;
            if(list_candidat_terms != null){
                while(i<120 && i<len){
            //for(int i=0;i<len;i++){
                    html = html + "<tr>" + 
                                    "<td>"+(i+1)+"</td>";
                    if(list_candidat_terms.get(i).getIsTrueTerm()==1){
                        html = html + "<td><div style='color:green'>"+list_candidat_terms.get(i).getTerm() + "</div>"
                                        + "<div class='sourcename'>Validate by : "+list_candidat_terms.get(i).getSourceDictionary()+"</div></td>";
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
            }
            
            html = html + "</table></div>";
        %>
        
        <form action="downloadBioTex">
            See the terms <select id="term_validated" name="term_validated" onchange="javascript:show_term_by_validation_by_interval(0)">
                <option value="1">All</option> 
                <option value="2">Only validated</option> 
                <option value="3">Not validated</option> 
            </select>
            &nbsp;&nbsp;&nbsp;
            <input class='multi-line-button' type="submit" value="Download XML File" name="dato">
        </form>
        
        <!--<a id="save_file_xml" class="multi-line-button" href="#" style="width:110px">
            <div class='title'>Download XML File</div>
        </a>-->
        
        
            <div id="container_results">
                <%
                    int div_page = len/120;
                    int mod_page = len%120;
                    int num_page;
                    if(mod_page>0){
                        num_page = div_page + 1;
                    }else{
                        num_page = div_page;
                    }
                %>
                
                <p class="pages">
                    <small>Number of terms : <%=len%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Page 1 of <%=num_page%> &nbsp;</small> 
                    <!--<span>1</span>-->
                    <%for(int j=0;j<num_page;j++){%>        
                          <a href="#" onclick='javascript:show_term_by_validation_by_interval(<%= j %>)'><%= (j+1) %></a> 
                    <%}%>
                    <!--<a href="#">&raquo;</a>-->
                </p>

                <%= html %>

                <br/>
                <p class="pages">
                    <small>Number of terms : <%=len%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Page 1 of <%=num_page%> &nbsp;</small> 
                    <!--<span>1</span>-->
                    <%for(int j=0;j<num_page;j++){%>        
                          <a href="#" onclick='javascript:show_term_by_validation_by_interval(<%= j %>)'><%=(j+1)%></a> 
                    <%}%>
                    <!--<a href="#">&raquo;</a>-->
                </p>
            </div> 
        
        
        </div>
        
      </div>

        
    <div class="sidebar">
                <div class="gadget">
                  <h2 class="star">Institutions</h2>
                  <div class="clr"></div>
                  <a href="http://www.lirmm.fr/" target="_blank" title="Laboratory of Informatics, Robotics, and Microelectronics of Montpellier">
                    <img src="images/01_lirmm_logo.png" alt="Laboratory of Informatics, Robotics, and Microelectronics of Montpellier" height="70" width="165" />
                    <!--<img src="images/lirmm-logo.gif" alt="Laboratory of Informatics, Robotics, and Microelectronics of Montpellier" height="70" width="150" />-->
                </a>
                  </br>
                    <a href="http://www.umontpellier.fr/" target="_blank" title="University of Montpellier">
                        <img src="images/01_UM.png" alt="University of Montpellier" width="110" />
                        <!--<img src="images/um21.png" alt="" height="60" width="120" />-->
                    </a>
                 </br>
                    <a href="http://www.cnrs.fr/" target="_blank" title="National Center for Scientific Research">
                        <img src="images/cnrs.jpg" alt="" height="70" width="70" />
                    </a>&nbsp;&nbsp;
                    <a href="http://tetis.teledetection.fr/index.php/fr/" target="_blank" title="Territoires, Environnement, Télédetection et Information Spatiale">
                        <img src="images/01_logo_tetis.jpg" alt="" height="70" width="70" />
                    </a>
                <br/>
                <br/>
                </div>
                <div class="gadget">
                  <h2 class="star"><span>Sponsors</span></h2>
                  <div class="clr"></div>
                  <ul class="ex_menu">
                    <li><a href="https://sites.google.com/site/sifrproject/" target="_blank"><img src="images/sifrproject.png" alt="" height="50" width="130" /></a><br/>
                    </li>
                  </ul>
                </div>
        </div>
                    
              <div class="clr"></div>
            </div>
          </div>
          
          <div class="footer">
            <div class="footer_resize">
                <p class="lf">&copy; Copyright <a href="http://www.lirmm.fr/~lossio/" target="_blank">Juan Antonio <b>Lossio Ventura</b></a>.</p>
                <p class="rf"><a href="https://sites.google.com/site/sifrproject/" target="_blank">SIFR Project</a></p>
              <div class="clr"></div>
            </div>
          </div>
        </div>
        
    </body>  
    
</html>