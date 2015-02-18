<%-- 
    Document   : about
    Created on : 23 sept. 2013, 16:42:55
    Author     : juanlossio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BioTex | Documentation</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>

        
        
<!--
<script type="text/javascript" src="js/javascript.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
-->

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
          <li><a href="about.jsp">About</a></li>
          <li class="active"><a href="documentation.jsp">Documentation</a></li>
          <!--<li><a href="blog.jsp">Blog</a></li>-->
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
            <table>
                <tr>
                    <td>
                        <img src="images/jar1.png" alt="Library"  width="46" />
                    </td>
                    <td><h2>&nbsp;&nbsp;JAR Library</h2>
                    </td>
                </tr>
            </table>
            <ul style="margin-left: 45px;">
              <li>
                  <a href="http://www.lirmm.fr/~lossio/BioTex.zip" target="_blank" title="Download BioTex JAR">
                    <div style="font-size: 15px;">Download BioTex JAR Library</div>
                  </a>
              </li>
            </ul>
          
            
            <br>
            <br>
         <div class="continuation">
             <div style="font-size: 16px;"><i>Tutorial for BioTex Jar Library</i></div>
          <a class="read-more-show hide" href="#">Follow the instructions below</a> 
          <div class="read-more-content">
            <a class="read-more-hide hide" href="#">Hide</a>
            <ul class="ulaninado">
                <li>
                    Before using BioTex, it is necessary to install <b>TreeTagger</b> (part-of-speech tagger tool, which assigns the grammatical category of a word).<br>
                    So, you must install TreeTagger for <i>French</i>, <i>English</i> and <i>Spanish</i> following the instructions from:
                    <a href="http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/">TreeTagger Installation</a>
                </li>
            
                
                <li>
                    Now it is possible to use BioTex. Now download <a href="http://www.lirmm.fr/~lossio/BioTex.zip" target="_blank" title="Download BioTex JAR">BioTex</a>
                    <br>You can use it for 3 languages (EN, FR, ES).
                </li>

                <li>
                    After unzipping the file, you will find:
                    <ol class="anidado">
                        <li>
                            <b>DataSetReference</b> folder = it contains three dictionaries (EN, FR, ES), which are used to automatically validate the extracted terms.
                        </li>
                        <li>
                            <b>patterns</b> folder = it contains the linguistic patterns to form the terms.
                        </li>
                        <li>
                            <b>StopWords</b> folder = which contains the list of list of stop words to filter the extracted terms.
                        </li>
                        <li>
                            <b>JarBioTexExterne.jar</b> file = BioTex Jar library containing the measures used for term extraction.
                        </li>
                        <li>
                            <b>Principal.java</b> file = the main class to call the java library and the parameters settings. 
                            For more details regarding the parameters, you can find them on the Tutorial for BioTex Web Application.
                        </li>
                    </ol>
                </li>
                
                <li>
                    <b>OUTPUTS:</b> the application gives 5 files as output:
                    <ol class="anidado">
                        <li>
                            <b>ALL_gram.txt</b> = a complete list of all extracted terms.
                        </li>
                        <li>
                            <b>t1gram.txt</b> = a term list of 1 gram (<i>e.g., aspirin</i>).
                        </li>
                        <li>
                            <b>t2gram.txt</b> = a term list of 2 grams (<i>e.g., clinical cases</i>).
                        </li>
                        <li>
                            <b>t3gram.txt</b> = a term list of 3 grams (<i>e.g., extended surgical procedure</i>).
                        </li>
                        <li>
                            <b>t4gram.txt</b> = a term list of 4 and more grams (<i>e.g., early onset familial alzheimer disease</i>).
                        </li>
                    </ol>
                </li>
                
                <li>
                    Each file got as output has 3 columns, each column is separated by ";".
                    <ol class="anidado">
                        <li>
                            <b>First column</b> = shows extracted terms.
                        </li>
                        <li>
                            <b>Second column</b> = shows <b>1</b> if the term is already in a biomedical thesaurus, or <b>0</b> otherwise.
                        </li>
                        <li>
                            <b>Third column</b> = the importance of the term in the dataset, it means the value which gives the selected measure.
                        </li>
                    </ol>
                </li>
            </ul>
              
            <a class="read-more-hide hide" href="#">Hide</a>
          </div>
            
          <div class="clr"></div>
          
        </div>
          
            
        </div>
          
          <br>
          <br>
          
        <div class="article">
            <table>
                <tr>
                    <td>
                        <img src="images/web2.jpg" alt="Web"  width="46" />
                    </td>
                    <td><h2>&nbsp;&nbsp;Web Application</h2>
                    </td>
                </tr>
            </table>
         
            <br>
         <div class="continuation">
             <div style="font-size: 16px;"><i>Tutorial for BioTex Web Application</i></div>
          <a class="read-more-show hide" href="#">Follow the instructions below</a> 
          <div class="read-more-content">
              <a class="read-more-hide hide" href="#">Hide</a>
            <ol type=1>
              <li class="steps">
                  <p><b>Choose the language for your biomedical term extraction</b></p>
                  <img src="imagestutorial/001.png" height="90" width="450" alt="BioTex" />
                  <br/>You can choose English or French, depending on the language of your corpus (set of documents).
                  <p>&nbsp;</p>
              </li>
              <li class="steps">
                  <p><b>Select the POS (Part-of-Speech) tool to use</b></p>
                  <img src="imagestutorial/002.png" height="90" width="450" alt="BioTex" />
                  <br/>Currently we work with TreeTagger. Soon there will be other POS tools.
                  <p>&nbsp;</p>
              </li>
              <li class="steps">
                  <p><b>Put the number of linguistic patterns to use</b></p>
                  <img src="imagestutorial/003.png" height="100" width="550" alt="BioTex" />
                  <br/>By default is 200 for English and French. You can change it, if you decrease the number, the precision of 
                  true biomedical terms extracted will increase. 
                  <p>&nbsp;</p>
              </li>
              <li class="steps">
                  <p><b>Select the type of document to extract</b></p>
                  <img src="imagestutorial/004.png" height="90" width="450" alt="BioTex" />
                  <br/>If you choose <b><i>All Terms</i></b>, it means that you will extract single-word terms and multi-word terms. If you choose 
                  <b><i>Multi Terms</i></b>, BioTex will extract only multi-word terms.
                  <br/>
                  For exemple:
                  <ul>
                      <li class="steps">Aspirin (single-word terms)</li>
                      <li class="steps">extended-release capsules (multi-word terms)</li>
                      <li class="steps">attention deficit hyperactivity disorder (multi-word terms)</li>
                  </ul>
                  <p>&nbsp;</p>
              </li>
              <li class="steps">
                  <p><b>Choose the measure to rank the candidat terms</b></p>
                  <img src="imagestutorial/005.png" height="140" width="550" alt="BioTex" />
                  <br/>You can select any measure, the only difference is that the <i>C-value</i> measure works on a single large document. 
                  The other measures work on a set of documents, in this way the AKE measures can be applied.
                  <p>&nbsp;</p>
              </li>
              <li class="steps">
                  <p><b>Select if your corpus is a single document or a set of documents</b></p>
                  <img src="imagestutorial/006.png" height="150" width="550" alt="BioTex" />
                  <br/>If you want to use the AKE measure and the new combined measures, you have to put into a single document the 
                  set of documents separating them by <b><i>##########END##########</i></b>
                  <br/>Example of a set of document into single document:
                  <br/>
                  <div id="example_text">
                    text of document 1
                    <br/>text of document 1
                    <br/>...
                    <br/>text of document 1
                    <br/>##########END##########
                    <br/>text of document 2
                    <br/>text of document 2
                    <br/>...
                    <br/>text of document 2
                    <br/>##########END##########
                  </div>
 
              </li>
              <li class="steps">
                  <p><b>Choose your file and click the button "Extract Terms"</b></p>
                  <img src="imagestutorial/007.png" height="160" width="550" alt="BioTex" />
                  <br/>Finally you have to choose the file that containts the text and you will got the biomedical 
                  terms with the previously selected parameters clicking the button "Extract terms".
              </li>         
            </ol>
            <a class="read-more-hide hide" href="#">Hide</a>
          </div>
            
          <div class="clr"></div>
          
        </div>
          
          <!--  article  -->
        </div>
          <!--  mainbar  -->    
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
        <script src="js/jquery.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script>
            $('.read-more-content').addClass('hide')
            $('.read-more-show, .read-more-hide').removeClass('hide')

            // Set up the toggle effect:
            $('.read-more-show').on('click', function(e) {
              $(this).next('.read-more-content').removeClass('hide');
              $(this).addClass('hide');
              e.preventDefault();
            });

            // Changes contributed by @diego-rzg
            $('.read-more-hide').on('click', function(e) {
              var p = $(this).parent('.read-more-content');
              p.addClass('hide');
              p.prev('.read-more-show').removeClass('hide'); // Hide only the preceding "Read More"
              e.preventDefault();
            });
            </script>
    </body>
      
          
</html>