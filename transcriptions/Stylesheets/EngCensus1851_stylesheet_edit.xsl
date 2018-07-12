<?xml version="1.0"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <link rel="stylesheet" href="../Stylesheets/CertBrowser.css" type="text/css" />
      <body>
        <table>
          <tr>
            <td>
              <xsl:for-each select="//certificate">
                <table class="cert" width ="100%">
                  <tr>
                    <td class="title"  >
                      <h1 align="center">
                        <xsl:value-of select="//template/name"/>
                      </h1>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table  width ="100%">
                        <tr>
                          <td width="40%" height = "50px" >
                          </td>
                          <td width="20%" text-align="center" class="pageno"  >
                            <input type="text"  >
                              <xsl:attribute name="title">PageNo</xsl:attribute>
                              <xsl:attribute name="name">//certificate/pageno[<xsl:value-of select="position()" />]</xsl:attribute>
                              <xsl:attribute name="value">
                                <xsl:value-of select="pageno"/>
                              </xsl:attribute>
                              <xsl:attribute name="size">3</xsl:attribute>
                            </input>
                          </td>
                          <td  width="40%" class="pageno"  >
                            <div  style="text-align:right;" >
                              <input type="text" >
                                <xsl:attribute name="name">//certificate/sequenceno[<xsl:value-of select="position()" />]</xsl:attribute>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="sequenceno"/>
                                </xsl:attribute>
                                <xsl:attribute name="size">3</xsl:attribute>
                              </input>
                            </div>
                          </td>
                        </tr>
                      </table>
                      <tr width="100%" height = "10px" >
                      </tr>
                      <table  width ="100%">
                        <tr>
                          <td class="bst">Parish[or Township] of</td>
                          <td  class="bst" >Ecclesiastical District of</td>
                          <td class="bst" >City or Borough of</td>
                          <td class="bst" >Town of</td>
                          <td class="bst" >Village of</td>
                        </tr>
                        <tr>
                          <td class="inputbsb">
                            <input type="text"  >
                              <xsl:attribute name="title">Parish</xsl:attribute>
                              <xsl:attribute name="name">//certificate/parish</xsl:attribute>
                              <xsl:attribute name="value">
                                <xsl:value-of select="parish"/>
                              </xsl:attribute>
                            </input>
                          </td>
                          <td class="inputbsb">
                            <input type="text"  >
                              <xsl:attribute name="title">ecclesiasticalDistrict</xsl:attribute>
                              <xsl:attribute name="name">//certificate/ecclesiasticalDistrict</xsl:attribute>
                              <xsl:attribute name="value">
                                <xsl:value-of select="ecclesiasticalDistrict"/>
                              </xsl:attribute>
                            </input>
                          </td>
                          <td class="inputbsb">
                            <input type="text"  >
                              <xsl:attribute name="title">borough</xsl:attribute>
                              <xsl:attribute name="name">//certificate/borough</xsl:attribute>
                              <xsl:attribute name="value">
                                <xsl:value-of select="borough"/>
                              </xsl:attribute>
                            </input>
                          </td>
                          <td class="inputbsb">
                            <input type="text"  >
                              <xsl:attribute name="title">town</xsl:attribute>
                              <xsl:attribute name="name">//certificate/town</xsl:attribute>
                              <xsl:attribute name="value">
                                <xsl:value-of select="town"/>
                              </xsl:attribute>
                            </input>
                          </td>
                          <td class="inputbsb">
                            <input type="text"  >
                              <xsl:attribute name="title">village</xsl:attribute>
                              <xsl:attribute name="name">//certificate/village</xsl:attribute>
                              <xsl:attribute name="value">
                                <xsl:value-of select="village"/>
                              </xsl:attribute>
                            </input>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr height="24" />
                  <tr>
                    <td>
                      <table width =" 100%">
                        <tr>
                          <td class="wb" rowspan="2" >No of<br/>Schedule</td>
                          <td class="wb" rowspan="2" >Road Street etc<br/>and No or Name<br/>of House</td>
                          <td class="wb"  rowspan="2" >Name and surname of each<br/>Person</td>
                          <td class="wb"  rowspan="2" >Relation<br/>to head<br/>of Family</td>
                          <td class="wb"  rowspan="2" >Condition</td>
                          <td class="wb" colspan="2">Age of</td>
                          <td class="wb"  rowspan="2" >Rank Profession, or Occupation</td>
                          <td class="wb"  rowspan="2" >Where Born</td>
                          <td class="wb"  rowspan="2" >Whether<br/>Blind or Deaf-<br/>-and-dumb</td>
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
                          <td class="wb" >Males</td>
                          <td class="wb" >Females</td>
                        </tr>
                        <xsl:for-each select="//certificate/people/person">
                          <tr  height="24">
                            <td class="input" >
                              <input type="text"  class="cell"  >
                                <xsl:attribute name="title">householdReference</xsl:attribute>
                                <xsl:attribute name="name">//certificate/people/person*/householdReference[<xsl:value-of select="position()" />]</xsl:attribute>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="householdReference"/>
                                </xsl:attribute>
                                <xsl:attribute name="size">3</xsl:attribute>
                              </input>
                            </td>
                            <td class="input" >
                              <input type="text"  class="cell"  >
                                <xsl:attribute name="title">address</xsl:attribute>
                                <xsl:attribute name="name">//certificate/people/person*/address[<xsl:value-of select="position()" />]</xsl:attribute>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="address"/>
                                </xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                              <input type="text"  class="cell"  >
                                <xsl:attribute name="title">fullname</xsl:attribute>
                                <xsl:attribute name="name">//certificate/people/person*/fullname[<xsl:value-of select="position()" />]</xsl:attribute>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="fullname"/>
                                </xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                              <input type="text"  class="cell"  >
                                <xsl:attribute name="title">roleInHousehold</xsl:attribute>
                                <xsl:attribute name="name">//certificate/people/person*/roleInHousehold[<xsl:value-of select="position()" />]</xsl:attribute>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="roleInHousehold"/>
                                </xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                              <input type="text"  class="cell"  >
                                <xsl:attribute name="title">maritalStatus</xsl:attribute>
                                <xsl:attribute name="name">//certificate/people/person*/maritalStatus[<xsl:value-of select="position()" />]</xsl:attribute>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="maritalStatus"/>
                                </xsl:attribute>
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
                              <input type="text"  class="cell"  >
                                <xsl:attribute name="title">occupation</xsl:attribute>
                                <xsl:attribute name="name">//certificate/people/person*/occupation[<xsl:value-of select="position()" />]</xsl:attribute>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="occupation"/>
                                </xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                              <input type="text"  class="cell"  >
                                <xsl:attribute name="title">birthplace</xsl:attribute>
                                <xsl:attribute name="name">//certificate/people/person*/birthplace[<xsl:value-of select="position()" />]</xsl:attribute>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="birthplace"/>
                                </xsl:attribute>
                              </input>
                            </td>
                            <td class="input">
                              <input type="text"  class="cell"  >
                                <xsl:attribute name="title">note</xsl:attribute>
                                <xsl:attribute name="name">//certificate/people/person*/note[<xsl:value-of select="position()" />]</xsl:attribute>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="note"/>
                                </xsl:attribute>
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
                      <td class="wb" >Total of Houses</td>
                      <td class="input">
                        <xsl:value-of select="inhabitedHouses"/>
                        <xsl:value-of select="uninhabitedHouses"/>
                      </td>
                      <td class="wb" colspan="3">Total of Males and Females</td>
                      <td class="input">
                        <xsl:value-of select="totalMales"/>
                      </td>
                      <td class="input">
                        <xsl:value-of select="totalFemales"/>
                      </td>
                      <td class="wb" colspan="3">
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </xsl:for-each>
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
                    <xsl:attribute name="value">
                      <xsl:value-of select="//edition/source"/>
                    </xsl:attribute>
                  </input>
                </td>
                <td class="commentlabel" >Link:</td>
                <td class="comment" >
                  <input type="text" placeholder="image source" class="cell" >
                    <xsl:attribute name="name">//edition/image</xsl:attribute>
                    <xsl:attribute name="value">
                      <xsl:value-of select="//edition/image"/>
                    </xsl:attribute>
                  </input>
                </td>
                <td class="input">
                  <a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="//edition/image"/>
                    </xsl:attribute>
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
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
