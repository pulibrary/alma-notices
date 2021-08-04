<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	exclude-result-prefixes="xs"
	version="2.0">
	<xsl:function name="local:reorder-date" as="xs:date?" xmlns:local="http://www.princeton.edu">
		<xsl:param name="dateString" as="xs:string?"/>
		
		<xsl:sequence select="
			if (empty($dateString))
			then ()
			else if (not(matches($dateString,
			'^\D*(\d{2})\D*(\d{2})\D*(\d{4})\D*$')))
			then error()
			else xs:date(replace($dateString,
			'^\D*(\d{2})\D*(\d{2})\D*(\d{4})\D*$',
			'$2-$1-$3'))
			"/>
		
	</xsl:function>
</xsl:stylesheet>