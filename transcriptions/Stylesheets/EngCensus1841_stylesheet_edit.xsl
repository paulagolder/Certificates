<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
      <html>
       <link rel="stylesheet" href="./CertBrowser.css" type="text/css" />
        <body>
          <table>
            <tr>
              <td >
                <xsl:for-each select="//certificate">
                  <table class="cert" width ="100%">
                    <tr>
                      <td class="title" >
                        <h1 align="center">
                          <xsl:value-of select="//template/name"/>
                        </h1>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <table border="0"   width =" 100%"  >
                          <tr>
                            <td width="40%" >
                            </td>
                            <td width="20%" text-align="center" class="pageno"  >
                              <input type="text"  >
                              <xsl:attribute name="title">PageNo</xsl:attribute>
                              <xsl:attribute name="name">//certificate/pageno[<xsl:value-of select="position()" />]</xsl:attribute>
                              <xsl:attribute name="value"><xsl:value-of select="pageno"/></xsl:attribute>
                              <xsl:attribute name="size">3</xsl:attribute>
                              </input>
                            </td>
                            <td  width="40%" class="pageno"  >
                              <div  style="text-align:right;" >
                                <input type="text" >
                                <xsl:attribute name="name">//certificate/sequenceno[<xsl:value-of select="position()" />]</xsl:attribute>
                                <xsl:attribute name="value"><xsl:value-of select="sequenceno"/></xsl:attribute>
                                <xsl:attribute name="size">3</xsl:attribute>
                                </input>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td  colspan="2" class="heading"  >City or Borough of
                            <input type="text" placeholder="borough" class="heading">
                              <xsl:attribute name="title">Borough</xsl:attribute>
                              <xsl:attribute name="name">//certificate/borough</xsl:attribute>
                              <xsl:attribute name="value"><xsl:value-of select="borough"/></xsl:attribute>
                              </input>
                            </td>
                            <td rowspan="2" class="heading"  style="text-align:right;" >Enumeration Schedule.</td>
                          </tr>
                          <tr>
                            <td  colspan="2" class="heading" >Parish or Township of 
                            <input type="text" class="heading" >
                            <xsl:attribute name="title">Parish</xsl:attribute>
                            <xsl:attribute name="name">//certificate/parish</xsl:attribute>
                            <xsl:attribute name="value"><xsl:value-of select="parish"/></xsl:attribute>
                            </input>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>


                      <table border="0"   width =" 100%">
                        <tr>
                          <td class="bst"  rowspan="2">Place</td>
                          <td class="bst" colspan="2">Houses</td>
                          <td  class="bst" rowspan="2">Names<br/>of each Person who obode thereon<br/> the preceeeding night</td>
                          <td class="bst" colspan="2">AGE<br/>and<br/>SEX</td>
                          <td class="bst" rowspan="2">PROFESSION TRADE<br/>EMPLOYMENT,<br/>or of <br/>INDEPENDENT MEANS</td>
                          <td class="bst" colspan="2">Where Born</td>
                          <td class="bst" rowspan="2" colspan="2" >
                          <a>
                          <xsl:attribute name="href">CertBrowser.php?action=addline&amp;object=person&amp;lineno=0
                          </xsl:attribute>
                          <img>
                          <xsl:attribute name="src" >./add.png</xsl:attribute>
                          </img>
                          </a>
                          </td>
                        </tr>
                        <tr>
                        <td  class="bsts" ><div class="vertical-text"><div class="vertical-text__inner">uninhabited</div></div></td>
                        <td  class="bsts" ><div class="vertical-text"><div class="vertical-text__inner">inhabited</div></div></td>
                        <td  class="bsts" ><div class="vertical-text"><div class="vertical-text__inner">Males</div></div></td>
                        <td  class="bsts" ><div class="vertical-text"><div class="vertical-text__inner">Females</div></div></td>
                        <td  class="bsts" >
                         <div class="vertical-text"><div class="vertical-text__inner">Whether Born</div></div>
                        <div class="vertical-text"><div class="vertical-text__inner">in same County</div></div>
                        </td>
                        <td  class="bsts" >
                        <div class="vertical-text"><div class="vertical-text__inner">Whether Born</div></div>
                        <div class="vertical-text"><div class="vertical-text__inner">England Ireland</div></div>
                        <div class="vertical-text"><div class="vertical-text__inner">or foriegn parts</div></div>
                        </td>
                        </tr>
                        <xsl:for-each select="//person">
                          <tr  height="24">
                            <td class="input" >
                            <input type="text"  class="cell"  >
                              <xsl:attribute name="title">Place</xsl:attribute>
                              <xsl:attribute name="name">//certificate/people/person*/place[<xsl:value-of select="position()" />]</xsl:attribute>
                              <xsl:attribute name="value"> <xsl:value-of select="place"/></xsl:attribute>
                              </input>
                            </td>
                            <td class="input">  
                            <input type="text"  class="cell"  >
                            <xsl:attribute name="title">UninhabitedHouse</xsl:attribute>
                              <xsl:attribute name="name">//certificate/people/person*/uninhabitedHouse[<xsl:value-of select="position()" />]</xsl:attribute>
                              <xsl:attribute name="value"><xsl:value-of select="uninhabitedHouse"/></xsl:attribute>
                              <xsl:attribute name="size">3</xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                            <input type="text"  class="cell"  >
                              <xsl:attribute name="title">InhabitedHouse</xsl:attribute>
                              <xsl:attribute name="name">//certificate/people/person*/inhabitedHouse[<xsl:value-of select="position()" />]</xsl:attribute>
                              <xsl:attribute name="value"><xsl:value-of select="inhabitedHouse"/></xsl:attribute>
                              <xsl:attribute name="size">3</xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                              <input type="text" class="cell"  >
                              <xsl:attribute name="title">Name</xsl:attribute>
                              <xsl:attribute name="name">//certificate/people/person*/name[<xsl:value-of select="position()" />]</xsl:attribute>
                              <xsl:attribute name="value">  <xsl:value-of select="name"/></xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                            <input type="text"  class="cell" >
                              <xsl:attribute name="title">MaleAge</xsl:attribute>
                              <xsl:attribute name="name">//certificate/people/person*/gender=male;//certificate/people/person*/age[<xsl:value-of select="position()" />]</xsl:attribute>
                              <xsl:attribute name="value">
                              <xsl:if test="gender='male'" >
                              <xsl:value-of select="age"/>
                              </xsl:if>
                              </xsl:attribute>
                              <xsl:attribute name="size">3</xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                            <input type="text" class="cell" >
                            <xsl:attribute name="title">FemaleAge</xsl:attribute>
                            <xsl:attribute name="name">//certificate/people/person*/gender=female;//certificate/people/person*/age[<xsl:value-of select="position()" />]</xsl:attribute>
                            <xsl:attribute name="value">
                            <xsl:if test="gender='female'">
                            <xsl:value-of select="age"/>
                            </xsl:if>
                            </xsl:attribute>
                            <xsl:attribute name="size">3</xsl:attribute>
                            </input>

                            </td>
                            <td class="input">
                            <input type="text"  class="cell">
                              <xsl:attribute name="title">Occupation</xsl:attribute>
                              <xsl:attribute name="name">//certificate/people/person*/occupation[<xsl:value-of select="position()" />]</xsl:attribute>
                              <xsl:attribute name="value"><xsl:value-of select="occupation"/></xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                            <input type="text"  class="cell">
                              <xsl:attribute name="title">BornThisCounty</xsl:attribute>
                              <xsl:attribute name="name">//certificate/people/person*/birthplaceThisCounty[<xsl:value-of select="position()" />]</xsl:attribute>
                              <xsl:attribute name="value"><xsl:value-of select="birthplaceThisCounty"/></xsl:attribute>
                              <xsl:attribute name="size">3</xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                            <input type="text" class="cell">
                              <xsl:attribute name="title">BornOtherCounty</xsl:attribute>
                              <xsl:attribute name="name">//certificate/people/person*/birthplaceOther[<xsl:value-of select="position()" />]</xsl:attribute>
                              <xsl:attribute name="value"><xsl:value-of select="birthplaceOther"/></xsl:attribute>
                              <xsl:attribute name="size">3</xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                            <a>
                            <xsl:attribute name="href">CertBrowser.php?action=addline&amp;object=person&amp;lineno=<xsl:value-of select="position()" />
                            </xsl:attribute>
                            <img>
                            <xsl:attribute name="src" >./add.png</xsl:attribute>
                            </img>
                            </a>
                            </td>
                            <td class="input">
                            <a>
                            <xsl:attribute name="href">CertBrowser.php?action=delline&amp;object=person&amp;lineno=<xsl:value-of select="position()" />
                            </xsl:attribute>
                            <img>
                            <xsl:attribute name="src" >./delete.png</xsl:attribute>
                            </img>
                            </a>
                            </td>

                          </tr>

                        </xsl:for-each>
                        <tr>
                          <td class="wb">Total in Page</td>
                          <td class="input">
                          <input type="text" class="cell"  >
                          <xsl:attribute name="name">//certificate/totalInhabitedHouses[<xsl:value-of select="position()" />]</xsl:attribute>
                            <xsl:attribute name="value"><xsl:value-of select="totalInhabitedHouses"/></xsl:attribute>
                            <xsl:attribute name="size">3</xsl:attribute>
                            </input>
                          </td>
                          <td class="input">
                          <input type="text" class="cell"  >
                          <xsl:attribute name="name">certificate/totalUninhabitedHouses[<xsl:value-of select="position()" />]</xsl:attribute>
                            <xsl:attribute name="value"><xsl:value-of select="totalUninhabitedHouses"/></xsl:attribute>
                            <xsl:attribute name="size">3</xsl:attribute>
                            </input>
                          </td>
                          <td >
                          </td>
                          <td class="input">
                          <input type="text" class="cell"  >
                          <xsl:attribute name="name">//certificate/totalMales[<xsl:value-of select="position()" />]</xsl:attribute>
                          <xsl:attribute name="value"><xsl:value-of select="totalMales"/></xsl:attribute>
                            <xsl:attribute name="size">3</xsl:attribute>
                            </input>
                          </td>
                          <td class="input">
                          <input type="text" class="cell"  >
                          <xsl:attribute name="name">//certificate/totalFemales[<xsl:value-of select="position()" />]</xsl:attribute>
                          <xsl:attribute name="value"><xsl:value-of select="totalFemales"/></xsl:attribute>
                            <xsl:attribute name="size">3</xsl:attribute>
                            </input>
                          </td>
                          <td />
                          <td/>
                          <td/>
                        </tr>
                      </table>
                      <table height ="50"  width ="100%" />
                    </td>
                  </tr>

                  <tr>
                    <td>
                      <table width="100%">
                        <tr>
                        </tr>
                        <tr>
                          <td class="footnote" colspan="2" >Data transcribed&#160;by:&#160;
                             <xsl:value-of select="//edition/editor"/>
                             &#160;on:&#160;
                             <xsl:value-of select="//edition/editdate"/>
                        </td>
                      </tr>
                      <tr>
                      <td class="commentlabel" >Source:</td>
                      <td class="comment" >
                      <input type="text" placeholder="source" class="cell" >
                      <xsl:attribute name="name">//edition/source</xsl:attribute>
                      <xsl:attribute name="value"><xsl:value-of select="//edition/source"/></xsl:attribute>
                      </input>
                      </td>
                      <td class="commentlabel" >Link:</td>
                      <td class="comment" >
                      <input type="text" placeholder="image source" class="cell" >
                      <xsl:attribute name="name">//edition/link</xsl:attribute>
                      <xsl:attribute name="value"><xsl:value-of select="//edition/image"/></xsl:attribute>
                      </input>
                      </td>
                      <td class="input">
                      <a>
                      <xsl:attribute name="href"><xsl:value-of select="//edition/image"/></xsl:attribute>
                      <xsl:attribute name="target">sourceimage</xsl:attribute>
                      VIEW
                      </a>
                      </td>
                      </tr>
                      <tr>
                      <td class="commentlabel" >Comment:</td>
                      <td class="comment" colspan="3" >
                          <textarea  placeholder="comment" class="cell"  >
                          <xsl:attribute name="name">//edition/comment</xsl:attribute>
                          <xsl:attribute name="cols">50</xsl:attribute>
                          <xsl:value-of select="//edition/comment"/>
                          </textarea>
                        </td>
                      </tr>
                      <tr>
                      </tr>
                      <tr>
                      <td  class="footnote" colspan="2" >Template made&#160;by:&#160;
                               <xsl:value-of select="//template/author"/>
                               &#160;on:&#160;
                             <xsl:value-of select="//template/editdate"/>
                      </td>
                    </tr>
                  </table>

                </td>
              </tr>
            </table>
          </xsl:for-each>
        </td>
      </tr>
    </table>
  </body>
</html>
  </xsl:template>
</xsl:stylesheet>
