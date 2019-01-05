<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
      <html>
      <link rel="stylesheet" href="../Stylesheets/CertBrowser.css" type="text/css" />
 
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
                              <xsl:value-of select="pageno"/>
                            </td>
                            <td  width="40%" class="pageno"  >
                              <div  style="text-align:right;" >
                                <xsl:value-of select="sequenceno"/>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td  colspan="2" class="heading"  >City or Borough of

                              <xsl:if test="borough!=''">
                              <span class="input" >
                                <xsl:value-of select="borough"/>
                                </span>
                              </xsl:if>
                              <xsl:if test="not(borough!='')">
                                _________________________
                              </xsl:if>

                            </td>
                            <td rowspan="2" class="heading"  style="text-align:right;" >Enumeration Schedule.</td>
                          </tr>
                          <tr>
                            <td  colspan="2" class="heading" >Parish or Township of <span class="input" ><xsl:value-of select="parish"/></span>
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
                        </tr>
                        <tr>
                          <td  class="bsts" >uninhabited</td>
                          <td  class="bsts" >inhabited</td>
                          <td class="bsts" >Males</td>
                          <td class="bsts" >Females</td>
                          <td class="bsts" >Whether Born<br/> in same County</td>
                          <td class="bsts" >Whether born<br/>England Ireland<br/>or foriegn parts</td>
                        </tr>
                        <xsl:for-each select="//person">
                          <tr  height="24">
                            <td class="input" >
                              <xsl:value-of select="place"/>
                            </td>
                            <td class="input">
                              <xsl:value-of select="uninhabitedHouse"/>
                            </td>
                            <td class="input">
                              <xsl:value-of select="inhabitedHouse"/>
                            </td>
                            <td class="input">
                              <xsl:value-of select="name"/>
                            </td>
                            <td class="input">
                              <xsl:if test="gender='male'" >
                                <xsl:value-of select="age"/>
                              </xsl:if>
                            </td>
                            <td class="input">
                              <xsl:if test="gender='female'">
                                <xsl:value-of select="age"/>
                              </xsl:if>
                            </td>
                            <td class="input">
                              <xsl:value-of select="occupation"/>
                            </td>
                            <td class="input">
                              <xsl:if test="birthplaceThisCounty='y'">
                                Y
                              </xsl:if>
                              <xsl:if test="birthplaceThisCounty='Y'">
                                Y
                              </xsl:if>
                              <xsl:if test="birthplaceThisCounty='n'">
                                N
                              </xsl:if>
                              <xsl:if test="birthplaceThisCounty='N'">
                                N
                              </xsl:if>
                            </td>
                            <td class="input">
                              <xsl:if test="birthplaceOther='y'">
                                Y
                              </xsl:if>
                              <xsl:if test="birthplaceOther='Y'">
                                Y
                              </xsl:if>
                              <xsl:if test="birthplaceOther='n'">
                                N
                              </xsl:if>
                              <xsl:if test="birthplaceOther='N'">
                                N
                              </xsl:if>
                            </td>

                          </tr>

                        </xsl:for-each>
                        <tr>
                          <td class="wb">Total in Page</td>
                          <td class="input">
                            <xsl:value-of select="totalInhabitedHouses"/>
                          </td>
                          <td class="input">
                            <xsl:value-of select="totalUninhabitedHouses"/>
                          </td>
                          <td >
                          </td>
                          <td class="input">
                            <xsl:value-of select="totalMales"/>
                          </td>
                          <td class="input">
                            <xsl:value-of select="totalFemales"/>
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
                          <td class="footnote" >Data transcribed&#160;by:&#160;<xsl:value-of select="//edition/editor"/>&#160;on:&#160;<xsl:value-of select="//edition/editdate"/>
                        </td>
                      </tr>
                      <tr>
	      <td class="comment" >Source:
		<xsl:value-of select="//edition/source"/>
	      </td>
	      <td class="comment" >
	      
		<xsl:variable name="hyperlink"> <xsl:value-of select="//edition/image"/></xsl:variable> 
	       <xsl:if test="$hyperlink"> 
	       {$hyperlink} exists
	       <xsl:if test="$hyperlink!=''"> 
	       hyperlink not is null
		<a href=""  target="_blank" onclick="window.open('{$hyperlink}', 'newwindow', 'width=600, height=500'); return false;"  >View Image</a>
	      </xsl:if>
	      </xsl:if>
	     </td>
	    </tr>
                      <tr>
                        <td class="comment" >
                          <xsl:value-of select="//edition/comment"/>
                        </td>
                      </tr>
                      <tr>
                      </tr>
                      <tr>
                        <td  class="footnote" >Template made&#160;by:&#160;<xsl:value-of select="//template/author"/>&#160;on:&#160;<xsl:value-of select="//template/editdate"/>
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
