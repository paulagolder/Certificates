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
		      <td align="left" >Administrative County</td>
		      <td class="input">
			<xsl:value-of select="county"/>
		      </td>
		      <td align="center">
			<i>The undermentioned Houses are situte within the boundaries of the</i>
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
		      <td  class="bst" >Ecclesiastical Parish of</td>
		      <td  class="bst" >County Borough, Municipal<br/>Borough or Urban District</td>
		      <td  class="bst" >Ward of Municipal Borough<br /> or of Urban District</td>          
		      <td class="bst" >Rural District</td>
		      <td class="bst" >Parliamentary Borough or<br/>Division</td>
		      <td class="bst" >Town or Village or Hamlet <br />of</td>
		      
		    </tr>
		    <tr>
		      <td class="inputbsb">
			<xsl:value-of select="parish"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="ecclesiasticalParish"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="municipalBorough"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="ward"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="ruralDistrict"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="parliamentaryBorough"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="town"/>
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
		      <td class="wb" rowspan="1" >Cols 1</td>
		      <td class="wb" rowspan="1" >2</td>
		      <td class="wb" colspan="1">3</td>
		      <td class="wb" rowspan="1">4</td>
		      <td class="wb" rowspan="1">5</td>
		      <td class="wb" rowspan="1">6</td>
		      <td class="wb" rowspan="1">7</td>
		      <td class="wb" rowspan="1">8</td>
		      <td class="wb" rowspan="1">9</td>
		      <td class="wb" rowspan="1">10</td>
		      <td class="wb" rowspan="1">11</td>
		      <td class="wb" rowspan="1">12</td>
		      <td class="wb" rowspan="1">13</td>
		      <td class="wb" rowspan="1">14</td>
		      <td class="wb" rowspan="1">15</td>
		      <td class="wb" rowspan="1">16</td>
		      <td class="wb" rowspan="1">17</td>
		    </tr>
		    <tr>
		      <td class="wb" rowspan="3">No of<br/>Schedule</td>
		      <td class="wb" rowspan="3">ROAD, STREET, &c., and<br/>No or NAME of HOUSE</td>
		      <td class="wb" colspan="4">HOUSES</td>
		      <td class="wb" rowspan="3">Number<br/>of rooms<br/>occupied<br/>if less<br/>than<br/>five</td>
		      <td class="wb" rowspan="3">Name and surname of<br/>each Person</td>
		      <td class="wb" rowspan="3">RELATION<br/>to Head<br/>of Family</td>
		      <td class="wbs" rowspan="3">CON-<br/>DITION<br/>as to<br/>Marriage</td>
		      <td class="wbs" colspan="2">AGE last<br/>Birthday<br/>of</td>
		      <td class="wb" rowspan="3">PROFESSION OR OCCUPATION</td>
		      <td class="wbs" rowspan="3">Employer,<br/> Worker,<br/>or<br/> Own account</td>
		      <td class="wbs" rowspan="3">If<br/> Working <br/>at<br/> Home</td>
		      <td class="wb"  rowspan="3">WHERE BORN</td>
		      <td class="wbs" rowspan="3">If<br/>(1) Deaf and Dumb<br/>(2) Blind<br/>(3) Lunatic<br/>(4) imbecile, feeble-minded</td>
		    </tr>
		    <tr>
		      <td class="wbs" rowspan="2 ">in-<br/>habited</td>
		      <td class="wbs" colspan="2" >Uninhabited</td>
		      <td class="wbs" rowspan="2 ">Building</td>
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
			  <xsl:value-of select="occupied"/>
			</td>
			<td class="input">
			  <xsl:value-of select="unoccupied"/>
			</td>
			<td class="input">
			  <xsl:value-of select="building"/>
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
			  <xsl:value-of select="employment"/>
			</td>
			<td class="input">
			  <xsl:value-of select="workingathome"/>
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
		<xsl:variable name="hyperlink"> <xsl:value-of select="//edition/link"/></xsl:variable> 
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
