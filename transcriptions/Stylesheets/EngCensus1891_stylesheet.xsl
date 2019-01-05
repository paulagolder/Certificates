<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="sourcedocument/certificate">
    <html>
    <link rel="stylesheet" href="../Stylesheets/CertBrowser.css" type="text/css" />
    <body>
    
    <table width="100%">
      <tr>
	<td  >
	  <h1 align="center">
	    <xsl:value-of select="//template/name"/>
	  </h1>
	</td>
      </tr>
    </table>
    <table>
      <tr>
	<td>
	  <xsl:for-each select="//certificate">
	    <table class="cert" width ="100%">
	      <tr>
		<td>
		  <table class="wb" width =" 100%">
		    <tr>
		      <td align="left" > Administrative County  of</td>
		      <td class="input">
			<xsl:value-of select="county"/>
		      </td>
		      <td align="center">
			<i>the undermentioned Houses are situte within the Boundaries of the</i>
		      </td>
		    </tr>
		  </table>
		</td>
	      </tr>
	      <tr>
		<td>
		  <table  width ="100%">
		    <tr>
		      <td class="bst">Civil Parish</td>
		      <td  class="bst" >City or <br/>Municipal Borough</td>
		      <td  class="bst" >Municipal Ward</td>
		      <td class="bst" >Urban Sanitary District</td>
		      <td class="bst" >Town or Village or Hamlet</td>
		      <td class="bst" >Rural Sanitary District</td>
		      <td class="bst" >Parliamentary Borough or<br/>Division</td>
		      <td  class="bst" >Ecclesiastical Parish or <br/>District</td>
		    </tr>
		    <tr>
		      <td class="inputbsb">
			<xsl:value-of select="parish"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="municipalBorough"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="ward"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="urbanSanitaryDistrict"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="town"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="ruralSanitaryDistrict"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="parliamentaryBorough"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="ecclesiasticalParish"/>
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
		      <td class="wb" rowspan="2" >Road Street etc and <br/>No or Name of House</td>
		      <td class="wb" colspan="2">Houses</td>
		      <td class="wb" rowspan="2">Number<br/>of rooms<br/>occupied<br/>if less<br/>than<br/>five</td>
		      <td class="wb"  rowspan="2" >Name and surname of<br/>each Person</td>
		      <td class="wb"  rowspan="2" >Relation<br/>to<br/>Head of Family</td>
		      <td class="wb"  rowspan="2" >CON-<br/>DITION<br/>as to<br/>Marriage</td>
		      <td class="wb" colspan="2">AGE last<br/>Birthday<br/>of</td>
		      <td class="wb"  rowspan="2" >PROFESSION, or OCCUPATION</td>
		      
		      <td class="wbs"  rowspan="2">Employer</td>
		      <td class="wbs" rowspan="2">Employed</td>
		      <td class="wbs" rowspan="2">Neither<br/>Employer nor<br/> Employed</td>
		      <td class="wb"  rowspan="2" >Where Born</td>
		      <td class="wbs" rowspan="2"  >Whether<br/>if<br/>(1)Deaf and Dumb<br/>(2) Blind<br/>(3) lunatic imbecile<br/>of Idiot</td>
		    </tr>
		    <tr>
		      <td class="wbs" >in-<br/>habit-<br/>ed</td>
		      <td class="wbs"  >unin-<br/>habited<br/>(U.) or<br/>Building<br/>(B.)</td>
		      <td class="wbs" >Males</td>
		      <td class="wbs"  >Females</td>
		    </tr>
		    <xsl:for-each select="//certificate/people/person">
		      <tr  height="24">
			<td class="input" >
			  <xsl:value-of select="RowNo"/>
			</td>
			<td class="input">
			  <xsl:value-of select="address"/>
			</td>
			<td class="input">
			  <xsl:value-of select="inhabited"/>
			</td>
			<td class="input">
			  <xsl:value-of select="uninhabited"/>
			</td>
			<td class="input">
			  <xsl:value-of select="roomsOccupied"/>
			</td>
			<td class="input">
			  <xsl:value-of select="fullname"/>
			</td>
			<td class="input">
			  <xsl:value-of select="roleInHousehold"/>
			</td>
			<td class="input">
			  <xsl:value-of select="maritalStatus"/>
			</td>
			<td class="input">
			  <xsl:if test=".[gender='male']" >
			    <xsl:value-of select="age"/>
			  </xsl:if>
			</td>
			<td class="input">
			  <xsl:if test=".[gender='female']">
			    <xsl:value-of select="age"/>
			  </xsl:if>
			</td>
			<td class="input">
			  <xsl:value-of select="occupation"/>
			</td>
			<td class="input">
			  <xsl:value-of select="employer"/>
			</td>
			<td class="input">
			  <xsl:value-of select="employed"/>
			</td>
			<td class="input">
			  <xsl:value-of select="neitherEmployernorEmployed"/>
			</td>
			<td class="input">
			  <xsl:value-of select="birthplace"/>
			</td>
			<td class="input">
			  <xsl:value-of select="note"/>
			</td>
		      </tr>
		      
		    </xsl:for-each>
		    <tr>
		      <td class="wb" colspan="2">Total of Houses</td>
		      <td class="input">
			<xsl:value-of select="inhabitedHouses"/>
		      </td>
		      <td class="input">
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
	    <table height ="100"  width ="100%">
	    </table>
	  </xsl:for-each>
	</td>
      </tr>
      <tr>
	<td>
	  <table class="wb" width =" 100%">
	    <tr>
	      <td align="left" > PRO reference</td>
	      <td class="input">
		<xsl:value-of select="proReference"/>
	      </td>
	      <td width="50%"/>
	    </tr>
	  </table>
	</td>
      </tr>
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
