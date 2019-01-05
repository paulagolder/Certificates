<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
        <link rel="stylesheet" href="../Stylesheets/CertBrowser.css" type="text/css" />
        
        <body>
        <table>
            <tr>
                <td >
                    <xsl:for-each select="//certificate">
                        <table class="cert" width ="100%">
                            <tr>
                                <td class="title" >
                                    <h1 align="center">
                                        <xsl:value-of select="//template/name"/>
                                    </h1>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0"   width =" 100%"  >
                                        <tr>
                        
                                            <td text-align="left" class="annee"  >
                                                <xsl:value-of select="annee"/>
                                            </td>
                                            <td  >
                                                <div  style="text-align:center;" >
                                                    <xsl:value-of select="department"/>
                                                </div>
                                            </td>
                                            <td   >
                                                <div  style="text-align:right;" >
                                                    <xsl:value-of select="commune"/>
                                                </div>
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                    
                                    <table border="0"   width =" 100%">
                                        <tr>
                                            <td class="bst"  rowspan="2">Designation<br/>hameau</td>
                                            <td class="bst" colspan="3">Numeros<br/>parQuartier Village</td>
                                            <td  class="bst" rowspan="2">NOMS<br/> de famille</td>
                                            <td  class="bst" rowspan="2">PRENOMS</td>
                                            <td  class="bst" rowspan="2">Annee<br/>de naisance</td>
                                            <td  class="bst" rowspan="2">Lieu<br/>de naisance</td>
                                            <td  class="bst" rowspan="2">Natioa<br/>ite<br/>te</td>
                                            <td  class="bst" rowspan="2">Situation</td>
                                            <td  class="bst" rowspan="2">profession</td>
                                            <td  class="bst" rowspan="2">Employeur</td>
                                        </tr>
                                         <tr>
                                
                                            <td  class="bsts"  >de maisons</td>
                                            <td class="bsts" >de menages</td>
                                               <td class="bsts" >individual</td>
                                         
                                        </tr>
                                        <xsl:for-each select="//person">
                                            <tr  height="24">
                                                <td class="input" >
                                                    <xsl:value-of select="location"/>
                                                </td>
                                                <td class="input">
                                                    <xsl:value-of select="sequence-maisons"/>
                                                </td>
                                                <td class="input">
                                                    <xsl:value-of select="sequence-menages"/>
                                                </td>
                                                <td class="input">
                                                    <xsl:value-of select="sequence-individuals"/>
                                                </td>
                                                <td class="input">
                                                    <xsl:value-of select="surname"/>
                                                </td>
                                                <td class="input">
                                                    <xsl:value-of select="forenames"/>
                                                </td>
                                                <td class="input">
                                                    
                                                    <xsl:value-of select="yearofbirth"/>
                                                    
                                                </td>
                                                <td class="input">
                                                    <xsl:value-of select="placeofbirth"/>
                                                </td>
                                                         <td class="input">
                                                    <xsl:value-of select="nationality"/>
                                                </td>
                                                <td class="input">
                                                    <xsl:value-of select="relationshiptohead"/>
                                                </td>
                                                <td class="input">
                                                    <xsl:value-of select="profession"/>
                                                </td>
                                                <td class="input">
                                                    <xsl:value-of select="employer"/>
                                                </td>
                                                
                                                
                                            </tr>
                                            
                                        </xsl:for-each>
                                        
                                        
                                    </table>
                                    
                                    <table height ="50"  width ="100%" />
                                    
                                    
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
                                                
                                                <xsl:variable name="link"> <xsl:value-of select="//link"/></xsl:variable> 
                                                <xsl:if test="$link"> 
                                                    <xsl:if test="$link!=''"> 
                                                        <a href=""  target="_blank" onclick="window.open('{link}', 'newwindow', 'width=600, height=500'); return false;"  >View Image</a>
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
                    </xsl:for-each>
                </td>
            </tr>
        </table>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>
