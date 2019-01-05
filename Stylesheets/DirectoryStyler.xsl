<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
<!-- XSLT document for the Default Template -->
	<xsl:template match="/list">
      <html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
			<title>Test</title>
			<link rel="stylesheet" href="./Stylesheets/directorystyles.css"/>

		<script language="javascript" src="Hider.js">
		<!-- For some weird reason Opera baulks if we don't stick some content here.
		It might be because the tag turns into a self-closing tag because there's no
		content - Opera might not be able to handle self-closing script tags. (I don't
		think SCRIPT tags are supposed to be self-closing in XHTML1.1 anyway? -->
			a
		</script>
  </head>
		<body>
		<table>
		<tr><th> Transcripts</th><th> Images</th></tr>
		<tr>
		<td>
		<ul class="dir">
			<xsl:apply-templates select="/list/directory[1]/directory[@name='transcriptions']"/>
		</ul>
			</td>
			<td>
			<ul class="dir">
			<xsl:apply-templates select="/list/directory[1]/directory[@name='images']"/>
		</ul>
			</td>
			</tr>
			</table>
		</body>
		</html>
	</xsl:template>
	
	<xsl:template match="directory">
		<xsl:if test="./*">
			<li class="dirwithchild"><a href="#" onclick="hide('d{@name}');"><xsl:value-of select="@name"/></a></li>
			<ul id="d{@name}" style="visibility: hidden; display: none;">
				<xsl:for-each select="directory">
					<xsl:apply-templates select="."/>
					
				</xsl:for-each>
				<xsl:for-each select="file">
					<xsl:apply-templates select="."/>
					 
				</xsl:for-each>
			</ul>
		</xsl:if>
		<xsl:if test="not(./*)">
			<li id="d{@name}" class="dir"><xsl:value-of select="@name"/></li>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="file">
		<li class="file"><a href="{@path}" target="certificate" ><xsl:value-of select="@name"/></a></li>
	</xsl:template>
	<xsl:template match="image">
		<li class="file"><a href="{@path}" target="image" ><xsl:value-of select="@name"/></a></li>
	</xsl:template>
</xsl:stylesheet>
