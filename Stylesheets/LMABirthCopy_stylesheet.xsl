<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

<html>
 
    <STYLE type="text/css">
       table       {border :none;padding:2px ;border-collapse:collapse ; background: #A1BFA4 }
       table.wb {border :solid;border-width:1px;border-collapse:collapse	 }
       td           { border: none; font-size:0.8em }
       td.input           { border: none; padding:2px;font-family: cursive; font-size:1em }
       td.wb      {color:blue; border-width:2px ;  border-style:solid; border-color:black ;padding:2px;font-family: cursive; font-size:1em; font-style:italic;}
       td.ul        {border-width:1px;border-style: none none solid none;text-align:center;font-family: cursive}
       td.th            { border-width:1px;  border:solid; font-size:0.8em ;text-align:center ; vertical-align: top}
       td.thwb       {border-width:1px;  border:solid; padding:2px;  font-size:2em }
       td.border {border-width:1px; border: solid }
    </STYLE>

 
  <body>
 <xsl:for-each select="//certificate">  
    <table width ="100%"   >     
        <tr>
        <td>       
        <p align="center" >BAPTISMS solemnized in the Parish of Saint Pancras in the County of Middlesex<br />
          in the Year One Thousand Eight Hundred and Tweny <xsl:value-of select="yeardigit"/></p>
      </td>
    </tr>
    <tr height="10" />
    
    <tr>
      <td>
        <table  width =" 100%">      
           <tr>
            <td class="th" rowspan="2" >When<br/>Baptised.</td>
            <td class="th"  rowspan="2" >Childs<br/>Christian Name</td>
            <td class="th" colspan="2" >Parents Name</td>
            <td class="th" rowspan="2">Abode</td>
            <td class="th" rowspan="2">Quality Trade or<br/>Profession</td>
            <td class="th" rowspan="2">Date of Birth and<br/>By whom the Ceremony<br/>was performed</td>
          </tr>
          <tr>
            <td class="th"  >Christian</td>
            <td class="th"  >Surname</td>          
          </tr>
          <xsl:for-each select="birth">
            <tr  height="24">
              <td class="wb" ><xsl:value-of select="date"/><br/><xsl:value-of select="entryNo"/></td>
              <td class="wb" ><xsl:value-of select="name"/></td>
              <td class="wb" ><xsl:value-of select="fathersForename"/><br/><xsl:value-of select="mothersForeame"/></td>
              <td class="wb" ><xsl:value-of select="surname"/></td>
              <td class="wb" ><xsl:value-of select="residence"/></td>
              <td class="wb" ><xsl:value-of select="occupation"/></td>
              <td class="wb" ><xsl:value-of select="dateofbirth"/><br/><xsl:value-of select="registrar"/></td>
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
		<xsl:variable name="hyperlink"> <xsl:value-of select="//edition/link"/></xsl:variable> 
		<a href=""  target="_blank" onclick="window.open('{$hyperlink}', 'newwindow', 'width=600, height=500'); return false;"  >View Image</a>
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

</xsl:for-each>
  </body>




 </html>
 </xsl:template>
</xsl:stylesheet>


