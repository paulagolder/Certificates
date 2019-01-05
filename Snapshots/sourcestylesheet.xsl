<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/snapshots">
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
                  <td  ><h1 align="center">Snapshot </h1></td>
                </tr>
                 <tr> 
                  <td  ><h2 align="left"><xsl:value-of select="title"/></h2></td>
                </tr>
         </table>
  <xsl:for-each select="snapshot">

      <table width="100%">
                <tr> 
                  <td  ><h1 align="center"><xsl:value-of select="title"/></h1></td>
                </tr>
         </table>
      <xsl:for-each select="sources/source">

        <table width="100%">
          <xsl:for-each select="images/image">
          
            <tr  height="24">
            <td> imag</td>
              <td class="input" ><xsl:value-of select="title"/></td>
               <xsl:variable name="hlink"><xsl:value-of select="url" /></xsl:variable>
              <td class="input"><a href="{$hlink}" target="image">image</a></td>
           </tr>
          </xsl:for-each>
    
          <xsl:for-each select="transcriptions/transcription">
          
            <tr  height="24">
            <td> imag</td>
              <td class="input" ><xsl:value-of select="title"/></td>
              <xsl:variable name="hlink"><xsl:value-of select="url" /></xsl:variable>
              <td class="input"><a href="{$hlink}" target="transcription" >transcription.</a></td>
           </tr>
          </xsl:for-each>
    </table>
 </xsl:for-each>
      <table  width ="100%">
               <tr>
                 <td class="footnote">Data entered by&#160;By:&#160;<xsl:value-of select="edition/editor"/>
                   on&#160;:&#160;<xsl:value-of select="edition/editdate"/></td>
               </tr>
      </table>
        </xsl:for-each>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
