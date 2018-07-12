<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="sourcedocument/certificate">
      <html>
     <link rel="stylesheet" href="../Stylesheets/xCertBrowser.css" type="text/css" />
        <link rel="stylesheet" href="../Stylesheets/Birth.css" type="text/css" />

        <body>
          <table width ="100%"   >
            <tr>
              <td>
                <table  width =" 100%">
                  <tr>
                  <td align="left">
                    <b>CERTIFIED COPY OF AN ENTRY OF BIRTH </b>
                  </td>
                  <td align="right">
                    <b>GIVEN AT THE GENERAL REGISTER OFFICE </b>
                  </td>
                </tr>
                <tr>
                <td align="left">
                </td>
                <td align="right">Application Number <xsl:value-of select="year"/>
              </td>
            </tr>
            <tr>
            </tr>
          </table>
        </td>
      </tr>
      <tr height="10" />
      <tr>
        <td>
          <table class="wb"  width =" 100%">
            <tr>
              <td  align="left" colspan="2"  >REGISTRATION DISTRICT</td>
              <td  class="input" >
                <xsl:value-of select="district"/>
              </td>
            </tr>
            <tr >
              <td colspan="5">
                <hr/>
              </td>
            </tr>
            <tr>
            <td   class="input"  >
              <xsl:value-of select="year"/>
            </td>
            <td  >BIRTH in the Sub-district of</td>
            <td    class="input" >
              <xsl:value-of select="subdistrict"/>
            </td>
            <td  >in the</td>
            <td   class="input" >
              <xsl:value-of select="county"/>
            </td>
          </tr>
          <tr>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>
        <table  width =" 100%">
          <tr>
            <td class="th" >Columns<br/>No.</td>
            <td class="th" >1<br/>When and<br/>where born</td>
            <td class="th" >2<br/>Name if any</td>
            <td class="th" >3<br/>Sex</td>
            <td class="th" >4<br/>Name and surname<br/>of father</td>
            <td class="th" >5<br/>Name, surname and<br/>maiden suname<br/>of mother</td>
            <td class="th" >6<br/>Occupation<br/>of father</td>
            <td class="th" >7<br/>Signature, description and<br/>residence of informant</td>
            <td class="th" >8<br/>When<br/>Registered</td>
            <td class="th" >9<br/>Signature of<br/>registrar</td>
            <td class="th" >10<br/>Name entered<br/>after registration</td>
          </tr>
          <xsl:for-each select="birth">
            <tr  height="24">
            <td class="wb" >
              <xsl:value-of select="entryNo"/>
            </td>
            <td class="wb" >
              <xsl:value-of select="whenAndWhere"/>
            </td>
            <td class="wb" >
              <xsl:value-of select="name"/>
            </td>
            <td class="wb" >
              <xsl:value-of select="gender"/>
            </td>
            <td class="wb" >
              <xsl:value-of select="fathersName"/>
            </td>
            <td class="wb" >
              <xsl:value-of select="mothersName"/>
            </td>
            <td class="wb" >
              <xsl:value-of select="fathersOccupation"/>
            </td>
            <td class="wb" >
              <xsl:value-of select="informant"/>
            </td>
            <td class="wb" >
              <xsl:value-of select="registrationDate"/>
            </td>
              <td class="wb" ><xsl:value-of select="registrar"/></td>
              <td class="wb" ><xsl:value-of select="nameEnteredLate"/></td>
            </tr>
          </xsl:for-each>
        </table>
        </td>
    </tr>
      <tr  height="30" />
    <tr>
          <td> 
             <table width="100%">
              <tr>
                 </tr>
                 <tr>
                 <td class="footnote" >Data transcribed&#160;by:&#160;<xsl:value-of select="../edition/editor"/>&#160;on:&#160;<xsl:value-of select="../edition/editdate"/>
                 </td>
                 </tr>
                 <tr>
	      <td class="comment" >Source:
		<xsl:value-of select="//edition/source"/>
	      </td>
	      <td class="comment" >
		<xsl:variable name="hyperlink"> <xsl:value-of select="//edition/image"/></xsl:variable> 
		   <xsl:choose>
	        <xsl:when test="string(normalize-space($hyperlink))">
		<a href=""  target="_blank" onclick="window.open('{$hyperlink}', 'newwindow', 'width=600, height=500'); return false;"  >View Image</a>
	        </xsl:when> 
	        </xsl:choose>
	        </td>
	    </tr>
                 <tr>
                 <td class="comment" >
                 <xsl:value-of select="../edition/comment"/>
                 </td>
                 </tr>
                 <tr>
                 </tr>
                 <tr>
              <td  class="footnote" >Template made&#160;by:&#160;<xsl:value-of select="../template/author"/>&#160;on:&#160;<xsl:value-of select="../template/editdate"/>
                 </td>
          </tr>
        </table>
          </td>
        </tr>
    </table>
  </body>
 </html>
 </xsl:template>
 <xsl:template match="sourcedocument/edition"  />
 <xsl:template match="sourcedocument/template"  /> 
</xsl:stylesheet>


