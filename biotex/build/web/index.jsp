<%-- 
    Document   : index
    Created on : 23 oct. 2013, 10:21:19
    Author     : juanlossio
--%>
<%@page import="Object.CandidatTerm"%>
<%@page import="Object.CandidatTerm"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>BioTex | Extraction</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
        <script type="text/javascript" src="js/javascript.js"></script>
    </head>
    <body>
        <%
            ArrayList<CandidatTerm> list_candidat_terms = null;
            list_candidat_terms = new ArrayList<CandidatTerm>();
        %>
        <div class="main">
          <div class="header">
            <div class="header_resize">
              <div class="logo">
                <h1><a href="index.jsp">BioTex</a> <small><b>BIO</b>medical <b>T</b>erm <b>EX</b>traction</small></h1>
            </div>
              <div class="menu_nav">
                <ul>
                  <li class="active"><a href="index.jsp">Extraction</a></li>
                  <!--<li><a href="evaluation.jsp">Evaluation</a></li>-->
                  <li><a href="about.jsp">About</a></li>
                  <!--<li><a href="blog.jsp">Blog</a></li>-->
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
                  <table>
                        <tr>
                            <td><img class="contacto_img" src="images/warning.gif" alt="attention" width="50" /></td>
                            <td>
                                <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
                                    <p style="font-size: 14px;"><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
                                        We <b>strongly recommend</b> to use the last version of <b><i><a href="documentation.jsp">BioTex Java Library</a></i></b>, 
                                        to know more, <a href="documentation.jsp"><b><i>click here</i></b></a>
                                            <i>(last modification: 16/02/2015)</i>
                                    </p>
                                </div>
                            </td>
                        </tr>
                  </table>
                  
                                
                  <table>
                        <tr>
                            <td><img class="contacto_img"  src="images/error.png" alt="error" width="50" /></td>
                                <td>
                                    <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                                        <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                                            <strong>Alert:</strong><i>The <b>Web application </b> version is being updated and will be integrated in the <a href="http://bioportal.lirmm.fr/" target="_blank">BioPortal French Annotator</a>. (last modification: 16/02/2015)</i>
                                        </p>
                                    </div>
                                    
                                </td>
                        </tr>
                  </table>
                  <table>
                      <tr>
                          <td><img class="contacto_img" src="images/information3.png" alt="Address" /></td>
                          <td><div><i>This application <b>does not work</b> with <b>Firefox</b>, it only works with Google Chrome, Safari and Internet Explorer</i></div></td>
                      </tr>
                  </table>
                                                    

                  <form action = "servBioTex" method = "post" enctype="multipart/form-data">
            <!--<div class='listOkapi'>-->
                <table id="tab1" border = "0" width = "100%" cellspacing = "10" align="left">
                    <tr>
                        <td colspan = "2" bgcolor = "E0F7FC" >Part-of-Speech tagger</td>
                    </tr>
                    <tr>
                        <td align="right">Choose your language</td>
                        <td>
                            <select id="text_language" name="text_language">
                                <option value="english">English</option> 
                                <option value="french">French</option> 
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Select tagger</td>
                        <td>
                            <select id="pos_tagger" name="pos_tagger">
                                <option value="TreeTagger">TreeTagger</option> 
                            </select>
                        </td>
                    </tr>
                    <tr>
                            <td colspan = "2" bgcolor = "E0F7FC" >Patterns Information</td>
                    </tr>
                    <tr>
                        <td align="right">Number of linguistic patterns<div class='sourcename'>used to filter candidate terms</div></td>
                        <td>
                            <input id="num_patterns" name="num_patterns" type="text" value="200" readonly />
                            <ul class="spinner">
                                <li>
                                    <input type="button" value="&#9650;" onclick="RotateSpinner('num_patterns', true)" />
                                </li>
                                <li>
                                    <input type="button" value="&#9660;" onclick="RotateSpinner('num_patterns', false)" />
                                </li>
                            </ul>
                            <div class='sourcename'>Patterns extracted from <a href="http://www.nlm.nih.gov/research/umls/" target="_blank">UMLS</a> for English and from <a href="http://www.ncbi.nlm.nih.gov/mesh" target="_blank">MeSH</a> for French<br/>Ex: Noun Noun; Noun Prep:det Noun; ... <a href="#">more examples</a></div>

                                <!--<input class="input_objet" id="patterns" type="text" name="patterns" value="150" maxlength="40" size="50" />-->

                        </td>
                    </tr>
                    <tr>
                        <td colspan = "2" bgcolor = "E0F7FC" >Type of terms to extract</td>
                    </tr>
                    <tr>
                        <td width="33%">
                            <div class='option_class'><input type='radio' id="typeterms" name='typeterms' value='all'> All Terms<br/>
                                    <div class='sourcename'>single word + multi word term</div>
                            </div>
                        </td>
                        <td>
                            <div class='option_class'><input type='radio' id="typeterms" name='typeterms' value='multi' checked> Multi Terms<br/>
                                    <div class='sourcename'>multi word term</div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan = "2" bgcolor = "E0F7FC" >Measures selection and data</td>
                    </tr>
                    <tr>
                        <td align="right">Select ranking measure</td>
                        <td>
                            <div id="div_measure">
                                <select id="measure" name="measure" onchange="javascript:modify_normalization(this.form)" >
                                    <option value="C_value">C-value</option>
                                    <option value="F-OCapi">F-OCapi</option>
                                    <option value="F-TFIDF-C" selected>F-TFIDF-C</option>
                                    <!--<option value="C-Okapi">C-Okapi</option>
                                    <option value="C-TFIDF">C-TFIDF</option>-->
                                    <option value="Okapi">Okapi</option>
                                    <option value="TFIDF">TFIDF</option>
                                </select>
                            </div>
                            <div id="div_normalisation">
                                <select id="normalization" name="normalization">
                                    <option value="MAX">MAX</option>
                                    <option value="SUM">SUM</option>
                                    <option value="AVG">AVG</option>
                                </select>
                            </div>
        
                            <div class="sourcename">&nbsp;&nbsp;<a href="http://hal-lirmm.ccsd.cnrs.fr/docs/00/85/98/46/PDF/Juan_Lossio_Paper.pdf" target="_blank">read more</a></div>
                    </tr>
                    <tr>
                        <td align="right">Type of documents</td>
                        <td>
                            <div class='option_class'>
                                <input type='radio' id="typesource1" name='typesource' onchange="show_message_doc1(this.form)" value="1">Single Document
                                &nbsp;&nbsp;
                                <input type='radio' id="typesource2" name='typesource' onchange="show_message_doc2(this.form)" value="2" checked >Set of Documents
                                <div class="sourcename" id='text_type_source' style='display: '>You must merge all documents of your corpus into one single file, separating them with ##########END##########</div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">File source</td>
                        <td>
                            <input id="file_text" name="file_text" type="file" lang="en">
                            <div class="sourcename" id='text_type_source' style='display: '>Only <b>".txt"</b> accepted as file extension</div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="right">&nbsp;&nbsp;<input type="submit" value="Extract Terms" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
            
        </form>       
                <!--<p class="pages"><small>Page 1 of 2 &nbsp;&nbsp;&nbsp;</small> <span>1</span> <a href="#">2</a> <a href="#">&raquo;</a></p>-->
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