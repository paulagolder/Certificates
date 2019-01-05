<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
		      <td width="40%" >
		      </td>
		      <td width="20%" class="pageno" style="text-align:center;" >
			<xsl:value-of select="pageno"/>
		      </td>
		      <td  width="40%" class="pageno"  >
			<div  style="text-align:right;" >
			  <xsl:value-of select="sequenceno"/>
			</div>
		      </td>
		    </tr>
		  </table>
		  <table class="wb" width =" 100%">
		    <tr>
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
		      <td class="bst">Parish[or Township] of</td>
		      <td  class="bst" >Municipal Ward of</td>
		      <td class="bst" >Parliamentary Borough of</td>
		      <td class="bst" >Town of</td>
		      <td class="bst" >Hamlet or Tything of</td>
		      <td  class="bst" >Ecclesiastical District of</td>
		    </tr>
		    <tr>
		      <td class="inputbsb">
			<xsl:value-of select="parish"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="ward"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="borough"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="town"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="hamlet"/>
		      </td>
		      <td class="inputbsb">
			<xsl:value-of select="ecclesiasticalDistrict"/>
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
		      <td class="wb" colspan="2">Houses</td>
		      <td class="wb"  rowspan="2" >Name and surname of each<br/>Person</td>
		      <td class="wb"  rowspan="2" >Relation<br/>to head<br/>of Family</td>
		      <td class="wb"  rowspan="2" >Condition</td>
		      <td class="wb" colspan="2">Age of</td>
		      <td class="wb"  rowspan="2" >Rank Profession, or Occupation</td>
		      <td class="wb"  rowspan="2" >Where Born</td>
		      <td class="wb"  rowspan="2" >Whether<br/>Blind or Deaf-<br/>-and-dumb</td>
		    </tr>
		    <tr>
		      <td class="wb" >inhabited</td>
		      <td class="wb" >uninhabited</td>
		      <td class="wb" >Males</td>
		      <td class="wb" >Females</td>
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
			  <xsl:value-of select="fullname"/>
			</td>
			<td class="input">
			  <xsl:value-of select="roleInHousehold"/>
			</td>
			<td class="input">
			  <xsl:value-of select="maritalStatus"/>
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
	    <table height ="50"  width ="100%">
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
		  <xsl:if test="$hyperlink!=''"> 
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
    
  </body>
</html>
</xsl:template>

</xsl:stylesheet>
