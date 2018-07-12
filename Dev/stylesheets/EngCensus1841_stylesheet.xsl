
<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/certificate">
  <html>
     <STYLE type="text/css">
       table.cert        {border-style:none;border-collapse:collapse;background-color: #F5F6CE	}
       table               {border-style:none;border-collapse:collapse}
       table.wb          {border-style:solid;border-width:1 }
       td.footnote       {border-style: none; font-size:10px }
       td                    {border-style: none}
       td.b                 {border-style: none; font-weight: bold; font-size:0.8em}
       td.itrightsmall   {border-style: none; font-weight: bold; font-style:italic ;font-size:o.8em;text-align: right}
       td.input           {border-width:1; border-style:solid; font-family: cursive}
       td.inputbsb      {border-width:1; border-style:solid; font-family: cursive;border-style: none solid solid solid}
         td.inputbul      {border-width:1; border-style:solid; font-family: cursive;border-style: none none dashed none}
       td.wb               {border-width:1; border-style:solid}
       td.ul                 {border-width:1; border-style: none none solid none}
       th                     {border-style: none; font-size:0.8em}
       th.wb                {border-width:1; border-style: solid}
       th.bs                 {border-width:1;border-style: none solid none solid}
       th.bst                {border-width:1;border-style: solid solid none solid}
         th.bsts             {border-width:1;border-style: solid solid none solid; font-size:0.8em}
       th.bsb                {border-width:1;border-style: none solid solid solid}
       th.ul                  {border-width:1;border-style: none none solid none}
      td.verticaltext       {writing-mode: tb-rl;filter: flipv fliph;}
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
        <table border="0" width="100%">
          <tr>
            <td>
          <table border="0"  width =" 40%">
           <tr>
             <td  class="b" >City or Borough of</td>
            <td class="inputbul">
                  <xsl:value-of select="borough"/>
            </td>
           </tr>
            <tr>
                 <td  class="b">Parish or Township of</td>
            <td class="inputbul">
                  <xsl:value-of select="parish"/>
             </td>
            </tr>
        </table>
      </td>
      <td class="itrightsmall"  >
          Enumeration Schedule
      </td>
    </tr>
    <tr colspan="2" height="30" ><td /></tr>
    </table>

        <table border="0"   width =" 100%">
          <tr>
            <th class="bst"  rowspan="2">Place</th>
            <th class="bst" colspan="2">Houses</th>
            <th  class="bst" rowspan="2">Names<br/>of each Person who obode thereon<br/> the preceeeding night</th>
            <th class="bst" colspan="2">AGE<br/>and<br/>SEX</th>
            <th class="bst" rowspan="2">PROFESSION TRADE<br/>EMPLOYMENT,<br/>or of <br/>INDEPENDENT MEANS</th>
            <th class="bst" colspan="2">Where Born</th>
          </tr>
          <tr>
            <th  class="bsts" >uninhabited</th>
            <th  class="bsts" >inhabited</th>
            <th class="bsts" >Males</th>
            <th class="bsts" >Females</th>
            <th class="bsts" >Whether Born<br/> in same County</th>
            <th class="bsts" >Whether born<br/>England Ireland<br/>or foriegn parts</th>
          </tr>
          <xsl:for-each select="/certificate/people/person">
            <tr  height="24">
              <td class="input" ><xsl:value-of select="place"/></td>
              <td class="input">
                  <xsl:value-of select="uninhabitedHouse"/>
              </td>
                 <td class="input">   
                 <xsl:value-of select="inhabitedHouse"/>
              </td>
             <td class="input"><xsl:value-of select="name"/></td>
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
              <td class="input">
                <xsl:if test=".[birthplaceThisCounty='y']">
                 yes
                </xsl:if>
              </td>
               <td class="input">
                <xsl:if test=".[birthplaceOther='y']">
                 yes
                </xsl:if>
              </td>
         
            </tr>
           
          </xsl:for-each>
           <tr>
              <th class="wb">Total in Page</th>
              <td class="input"><xsl:value-of select="totalInhabitedHouses"/></td>
              <td class="input"><xsl:value-of select="totalUninhabitedHouses"/></td>
              <td ></td>
              <td class="input"><xsl:value-of select="totalMales"/></td>
              <td class="input"><xsl:value-of select="totalFemales"/></td>
              <td />
              <td/>
              <td/>
            </tr>
        </table>
        </td>
    </tr>
    </table>
 </td>
    </tr>
    <tr height="40" />
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
