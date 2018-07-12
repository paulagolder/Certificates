<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="sourcedocument/certificate">   
  <html>
    <STYLE type="text/css">
       table        {border :none;padding:2px ;border-collapse:collapse ; background: #A1BFA4 }
       table.wb   {border :solid;border-width:1px;border-collapse:collapse	 }
       td            { border: none; font-size:0.8em }
       td.input    { border: none; padding:2px;font-family: cursive; font-size:1em }
       td.wb       {border-width:1px ; border:solid; padding:2px;font-family: cursive; font-size:1em}
       td.ul         {border-width:1px;border-style: none none solid none;text-align:center;font-family: cursive}
       td.th         { border:none; font-size:0.8em ;text-align:center ; vertical-align: top}
       td.thwb     {border-width:1px;  border:solid; padding:2px;  font-size:2em }
       td.border  {border-width:1px; border: solid }
    </STYLE>
    
  <body>
    <table width ="100%"   >   
        <tr>
        <td>
          
        <table  width =" 100%">
          <tr>
            <td align="left"><b>CERTIFIED COPY OF AN ENTRY OF DEATH </b></td>
            <td align="right"><b>GIVEN AT THE GENERAL REGISTER OFFICE </b></td>
          </tr>
           <tr>
            <td align="left"></td>
             <td align="right">Application Number<xsl:value-of select="applicationnumber"/></td>
          </tr>
          <tr></tr>
        </table>
      </td>
    </tr>
    <tr  height="10" />
    <tr>
        <td>          
        <table class="wb"  width =" 100%">                   
          <tr>            
            <td  align="left" colspan="2"  >REGISTRATION DISTRICT</td>
                  <td class="input" ><xsl:value-of select="district"/></td>
          </tr>
          <tr >  
            <td colspan="5">  
          <hr/>
            </td>
          </tr>
           <tr>
              <td  class="input" ><xsl:value-of select="year"/></td>
              <td  >DEATH in the Sub-district of</td>
             <td  class="input" ><xsl:value-of select="subdistrict"/></td>
             <td  >in the</td>
               <td    class="input" ><xsl:value-of select="county"/></td>
          </tr>
          <tr></tr>
         
        </table>
      </td>
    </tr>
    <tr>
      <td>
        <table  width =" 100%">

           <tr>
             <td class="th" >Columns<br/>No.</td>
             <td class="th" >1<br/>When and<br/>where died</td>
             <td class="th" >2<br/>Name and Surname</td>
             <td class="th" >3<br/>Sex</td>
             <td class="th" >4<br/>Age</td>
             <td class="th" >5<br/>Occupation</td>
             <td class="th" >6<br/>Cause of Death</td>
             <td class="th" >7<br/>Signature, description and<br/>residence of informant</td>
             <td class="th" >8<br/>When<br/>Registered</td>
             <td class="th" >9<br/>Signature of<br/>registrar</td>
          </tr>
          
          <xsl:for-each select="death">
            <tr  height="24">
              <td class="wb" ><xsl:value-of select="entryno"/></td>
              <td class="wb" ><xsl:value-of select="whenandwhere"/></td>
              <td class="wb" ><xsl:value-of select="name"/></td>
              <td class="wb" ><xsl:value-of select="gender"/></td>
              <td class="wb" ><xsl:value-of select="age"/></td>
              <td class="wb" ><xsl:value-of select="occupation"/></td>
              <td class="wb" ><xsl:value-of select="causeofdeath"/></td>
              <td class="wb" ><xsl:value-of select="informant"/></td>
              <td class="wb" ><xsl:value-of select="registrationdate"/></td>
              <td class="wb" ><xsl:value-of select="registrar"/></td>
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
