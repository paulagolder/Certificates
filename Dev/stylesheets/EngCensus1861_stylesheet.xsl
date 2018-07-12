<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/certificate">
  <html>
     <STYLE type="text/css">
       table.cert       {border-style:none;border-collapse:collapse;background-color: #F5F6CE}
       table              {border-style:none;border-collapse:collapse}
       table.wb         {border-style:solid;border-width:1px }
       td.footnote       {border: none; font-size:10px }
       td                    {border: none}
       td.input            {border-width:1px; border-style:solid;font-family: cursive;font-size:1em}
       td.inputbsb       {border-width:1px; font-family: cursive;border-style: none solid solid solid}
       td.wb               {border-width:1px; border-style:solid; text-align:center;font-size:0.8em}
       td.ul                 {border-width:1px;border-style: none none solid none}
       td.bs                 {border-width:1px;border-style: none solid none solid}
       td.bst                {border-width:1px;border-style: solid solid none solid; text-align:center; font-size:0.8em}
       td.bsb               {border-width:1px;border-style: none solid solid solid}
       td.ul                  {border-width:1px;border-style: none none solid none}
    </STYLE>
  <body>
      <table width="100%">
                <tr> 
                  <td  ><h1 align="center"><xsl:value-of select="name"/></h1></td>
                </tr>
      </table>
      <table>
               <tr>
                 <td>
    <table class="cert" width ="100%">
    <tr>
        <td>         
         <table class="wb" width =" 100%">
            <tr>
               <td align="center"><i>the undermentioned Houses are situte within the Boundaries of the</i></td>
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
          <xsl:for-each select="/certificate/people/person">
            <tr  height="24">
              <td class="input" ><xsl:value-of select="RowNo"/></td>
              <td class="input"><xsl:value-of select="address"/></td>
                 <td class="input">   
                 <xsl:value-of select="inhabited"/>
              </td>
              <td class="input">
                  <xsl:value-of select="uninhabited"/>
              </td>
              <td class="input"><xsl:value-of select="fullname"/></td>
              <td class="input"><xsl:value-of select="roleInHousehold"/></td>
              <td class="input"><xsl:value-of select="maritalStatus"/></td>
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
              <td class="input"><xsl:value-of select="occupation"/></td>
              <td class="input"><xsl:value-of select="birthplace"/></td>
              <td class="input"><xsl:value-of select="note"/></td>
            </tr>
           
          </xsl:for-each>
           <tr>
              <td class="wb" colspan="2">Total of Houses</td>
              <td class="input"><xsl:value-of select="inhabitedHouses"/></td>
              <td class="input"><xsl:value-of select="uninhabitedHouses"/></td>
              <td class="wb" colspan="3">Total of Males and Females</td>
              <td class="input"><xsl:value-of select="totalMales"/></td>
              <td class="input"><xsl:value-of select="totalFemales"/></td>
                  <td class="wb" colspan="3"></td>
            </tr>
        </table>
        </td>
    </tr>
    </table>
        <table height ="100"  width ="100%">                       
      </table>
         </td>
    </tr>
             <tr>
                 <td>
    
      <table  width ="100%">              
               <tr>
                 <td class="footnote">Data entered by&#160;By:&#160;<xsl:value-of select="author"/>
                   on&#160;:&#160;<xsl:value-of select="editdate"/></td>
               </tr>
               <tr>
                 <td class="footnote">JFTreeCert Template edited&#160;By:&#160;<xsl:value-of select="templateauthor"/>
                    on&#160;:&#160;<xsl:value-of select="templateeditdate"/></td>
               </tr>    
      </table>
         </td>
    </tr>
      </table>
  </body>
  </html>
</xsl:template>
 
</xsl:stylesheet>
