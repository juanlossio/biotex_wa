<%-- 
    Document   : about
    Created on : 23 sept. 2013, 16:42:55
    Author     : juanlossio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BioTex | About</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
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
          <!--<li><a href="evaluation.jsp">Evaluation</a></li>-->
          <li class="active"><a href="about.jsp">About</a></li>
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
        <div class="article">
          <h2>About <b>BioTex</b> Project</h2>
          <div class="clr"></div>
          It is a system that extracts biomedical terms from free text. 
          The terminology is ranked using an extension and combination of different measures as 
          <i>C-value</i>, <i>Okapi BM25</i>, and <i>TFIDF</i>. <b>BioTex</b> is implemented for extracting English and French biomedical terms.
        </div>
        <div class="article">
          <h2>Details</h2>
          <div class="clr"></div>
          For more information, read these articles about the methodology to extract biomedical terms :
          <ul>
            <!--<li class="courses">
                            <b><i>"Combining C-value and Keyword Extraction Methods for Biomedical Terms Extraction"</i> - LBM2013 </b>
                            <a href="http://www.lirmm.fr/~lossio/acl2013.pdf" target="_blank" title="Download Paper"><img src="images/pdf.jpg" height="20" width="16" alt="PDF" /></a>
                    <br/>Juan Antonio Lossio Ventura, Clement Jonquet, Mathieu Roche, Maguelonne Teisseire, LIRMM, CNRS, University of Montpellier 2, Irstea. Tokyo 2013.
            </li>
            <li class="courses">
                            <b><i>"Towards a mixed approach to extract biomedical terms from documents" in press</i> - The International Journal of Knowledge Discovery in Bioinformatics (IJKDB)  2014 </b>
                            <a href="#" title="Download Paper"><img src="images/pdf.jpg" height="20" width="16" alt="PDF" /></a>
                    <br/>Juan Antonio Lossio Ventura, Clement Jonquet, Mathieu Roche, Maguelonne Teisseire, LIRMM, CNRS, University of Montpellier 2, Irstea.
            </li>-->
                <li class="courses">
                        <h4>
                                <a href="http://www.lirmm.fr/~lossio/PolTAL2014.pdf" target="_blank" title="Download Paper"><img src="images/pdf.jpg" height="20" width="16" alt="PDF" /></a>
                                <strong><i>Yet another ranking function for automatic multi-word term extraction</i></strong> - PolTAL 2014
                        </h4>
                        <strong>Juan Antonio Lossio-Ventura</strong>, Clement Jonquet, Mathieu Roche, Maguelonne Teisseire. LIRMM, CNRS, University of Montpellier 2, Irstea. PolTAL 2014 – 9th International Conference on Natural Language Processing.
                </li>
                <li class="courses">
                    <h4>
                            <a href="http://www.lirmm.fr/~lossio/IJKDB2014.pdf" target="_blank" title="Download Paper"><img src="images/pdf.jpg" height="20" width="16" alt="PDF" /></a>
                            <strong><i>Towards a mixed approach to extract biomedical terms from documents</i></strong> - IJKDB 2014
                    </h4>
                    <strong>Juan Antonio Lossio-Ventura</strong>, Clement Jonquet, Mathieu Roche, Maguelonne Teisseire. LIRMM, CNRS, University of Montpellier 2, Irstea. International Journal of Knowledge Discovery in Bioinformatics (IJKDB).
                </li>
                <li class="courses">
                    <h4>
                            <a href="http://www.lirmm.fr/~lossio/LBM2013.pdf" target="_blank" title="Download Paper"><img src="images/pdf.jpg" height="20" width="16" alt="PDF" /></a>
                            <strong><i>Combining C-value and Keyword Extraction Methods for Biomedical Terms Extraction</i></strong> - LBM2013
                    </h4>
                    <strong>Juan Antonio Lossio-Ventura</strong>, Clement Jonquet, Mathieu Roche, Maguelonne Teisseire. LIRMM, CNRS, University of Montpellier 2, Irstea. 5th International Symposium on Languages in Biology and Medicine.
                </li>
            </ul>
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
        
        <!--<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div>-->
    </body>
      
          
</html>