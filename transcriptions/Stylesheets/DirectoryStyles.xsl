<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
<!-- XSLT document for the Default Template -->
	<xsl:template match="/list">
      <html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
			<title>Test</title>
			<link rel="stylesheet" href="style.css"/>
		</head>
		<body>
		<script language="javascript" src="Hider.js">
		<!-- For some weird reason Opera baulks if we don't stick some content here.
		It might be because the tag turns into a self-closing tag because there's no
		content - Opera might not be able to handle self-closing script tags. (I don't
		think SCRIPT tags are supposed to be self-closing in XHTML1.1 anyway? -->
			a
		</script>		
		<ul class="dir">
			<xsl:apply-templates select="/list/directory[1]"/>
		</ul>
			
		</body>
		</html>
	</xsl:template>
	
	<xsl:template match="directory">
		<xsl:if test="./*">
			<li class="dirwithchild"><a href="#" onclick="hide('d{translate(@path, '/', '')}');"><xsl:value-of select="@name"/></a></li>
			<ul id="d{translate(@path, '/', '')}" style="visibility: hidden; display: none;">
				<xsl:for-each select="directory">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				<xsl:for-each select="file">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</ul>
		</xsl:if>
		<xsl:if test="not(./*)">
			<li class="dir"><xsl:value-of select="@name"/></li>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="file">
		<li class="file"><xsl:value-of select="@name"/></li>
	</xsl:template>
</xsl:stylesheet>
