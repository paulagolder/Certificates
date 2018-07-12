<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">


  <html>
    <STYLE type="text/css">
       table       {border :none;padding:2px ;border-collapse:collapse ; background: #A1BFA4 }
       table.wb {border :solid;border-width:1px;border-collapse:collapse	 }
       td           { border: none; font-size:0.8em }
       td.footnote           { border: none; font-size:10px }
       td.input           { border: none; padding:2px;font-family: cursive; font-size:1em }
       td.inputnb           { border-style: solid solid none solid; padding:2px;font-family: cursive; font-size:1em }
       td.inputnt           { border-style: none solid solid solid; padding:2px;font-family: cursive; font-size:1em }
       td.wb      {border-width:1px ; border:solid; padding:2px;font-family: cursive; font-size:1em}
       td.ul        {border-width:1px;border-style: none none solid none;text-align:center;font-family: cursive}
       td.th            { border:none; font-size:0.8em ;text-align:center ; vertical-align: top}
       td.thwb       {border-width:1px;  border:solid; padding:2px;  font-size:1em }
       td.border {border-width:1px; border: solid }
    </STYLE>
    
  <body>
         <xsl:for-each select="//sourcedocument">
    <table>
      <tr>
        <td>
         <xsl:for-each select="./certificate">
    <table width ="100%"  border="0" >
        <tr>
        <td>
        <table  width =" 100%">
          <tr>
            <td align="left"><b>CERTIFIED COPY OF AN ENTRY OF MARRIAGE </b></td>
            <td align="right"><b>GIVEN AT THE GENERAL REGISTER OFFICE </b></td>
          </tr>
           <tr>
            <td align="left"></td>
            <td align="right">Application Number</td><td class="input"><xsl:value-of select="applicationnumber"/></td>
          </tr>
          <tr></tr>
        </table>
      </td>
    </tr>
       <xsl:for-each select="./marriage">
    <tr>
       <td>
         <table class="wb"  width ="100%">
            <tr>
              <td>
                 <table class="wb"  width =" 100%">             
                    <tr>  
                      <td  align="left" class="input" ><xsl:value-of select="year"/></td>
                      <td  align="left"  >Marriage solemnized at</td>
                      <td class="input" ><xsl:value-of select="location1"/></td>
                      <td  align="left"   >in the</td>
                      <td class="input"><xsl:value-of select="location2"/></td>
                      <td  align="left"   >of</td>
                      <td class="input"><xsl:value-of select="location3"/></td>
                      <td  align="left"   >in the County of</td>
                      <td class="input"><xsl:value-of select="location4"/></td>
                   </tr>         
                 </table>
               </td>
            </tr>
            <tr>
               <td>
                 <table class="wb"  width =" 100%">
                  <tr>
                     <td class="thwb" >No.</td>
                     <td class="thwb" >When Married</td>
                     <td class="thwb" >Name and Surname</td>
                     <td class="thwb" >Age</td>
                     <td class="thwb" >Condition</td>
                     <td class="thwb" >Rank or Profession</td>
                     <td class="thwb" >Residence at time of Marriage</td>
                     <td class="thwb" >Fathers Name and Surname</td>
                     <td class="thwb" >Rank or profession of Father</td>
                  </tr>
                 <tr  >
                     <td rowspan="2"  class="wb" ><xsl:value-of select="entryno"/></td>
                    <td  rowspan="2" class="wb" ><xsl:value-of select="when"/></td>
                    <td class="inputnb" ><xsl:value-of select="groom.name"/></td>
                    <td class="inputnb" ><xsl:value-of select="groom.age"/></td>
                    <td class="inputnb" ><xsl:value-of select="groom.condition"/></td>
                    <td class="inputnb" ><xsl:value-of select="groom.profession"/></td>
                    <td class="inputnb" ><xsl:value-of select="groom.residence"/></td>
                    <td class="inputnb" ><xsl:value-of select="groom.father"/></td>
                    <td class="inputnb" ><xsl:value-of select="groom.fatheroccupation"/></td>
                 </tr>
                 <tr>
                    <td class="inputnt" ><xsl:value-of select="bride.name"/></td>
                    <td class="inputnt" ><xsl:value-of select="bride.age"/></td>
                    <td class="inputnt" ><xsl:value-of select="bride.condition"/></td>
                    <td class="inputnt" ><xsl:value-of select="bride.profession"/></td>
                    <td class="inputnt" ><xsl:value-of select="bride.residence"/></td>
                    <td class="inputnt" ><xsl:value-of select="bride.father"/></td>
                    <td class="inputnt" ><xsl:value-of select="bride.fatheroccupation"/></td>
                 </tr>
                </table>
               </td>
             </tr>
             <tr>
              <td> 
                 <table width="100%">      
                    <tr>
                      <td>Married in the</td><td class="input"><xsl:value-of select="location5"/></td>
                      <td >according to the Rites and Ceremonies of the Established Church by </td><td class="input" ><xsl:value-of select="licence"/></td>
                      <td> or after</td><td class="input" ><xsl:value-of select="banns"/></td>
                       <td>by me</td>
                     </tr>
                     <tr>
                       <td colspan="4" align="right" class="input" ><xsl:value-of select="official"/></td>
                     </tr>
                 </table>
           </td>
        </tr>
        <tr>
          <td> 
             <table width="100%">      
               <tr>
                   <td rowspan="3" width="40">This marriage was solemnized between us</td>
                   <td class="ul" ><xsl:value-of select="groom.signature"/></td>
                   <td rowspan="3" width ="40"> in the presence of us</td>
                   <td class="ul" ><xsl:value-of select="witness.first"/></td>
               </tr>
                 <tr>
                   <td class="ul"  ><xsl:value-of select="bride.signature"/></td>
                   <td class="ul" ><xsl:value-of select="witness.second"/></td>
               </tr>     
               <tr>
                   <td  > </td>
                   <td  > </td>
               </tr>     
             </table> 
          </td>
        </tr>
    </table>   

      </td>
    </tr>
           </xsl:for-each>
    </table>
 </xsl:for-each>
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
