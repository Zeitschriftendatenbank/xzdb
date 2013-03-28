<?xml version="1.0" encoding="UTF-8"?>
<!-- New document created with EditiX at Fri Mar 22 11:18:04 CET 2013 -->
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:sru="http://www.loc.gov/zing/srw/" 
	xmlns:slim="http://www.loc.gov/MARC21/slim"
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes">
	<xsl:output media-type="text/json" method="text" indent="yes"/>
	<xsl:template match="/">
		<xsl:call-template name="array">
			<xsl:with-param name="value">
				<xsl:apply-templates select="//slim:record"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="//slim:record">
		<xsl:call-template name="list_object">
			<xsl:with-param name="adding">
				<xsl:if test="position() > 1">1</xsl:if>
			</xsl:with-param>
			<xsl:with-param name="properties">
				<xsl:for-each select="slim:datafield[@tag='016']">
					<xsl:variable name="sf2" select="slim:subfield[@code='2']" />
					<xsl:if test="$sf2='DE-101'">
						<xsl:call-template name="keyvalue">
							<xsl:with-param name="adding">
								<xsl:if test="position() > 1">1</xsl:if>
							</xsl:with-param>
							<xsl:with-param name="key">ppn</xsl:with-param>
							<xsl:with-param name="value">
								<xsl:value-of select="slim:subfield[@code='a']"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sf2='DE-600'">
						<xsl:call-template name="keyvalue">
							<xsl:with-param name="adding">
								<xsl:if test="position() > 1">1</xsl:if>
							</xsl:with-param>
							<xsl:with-param name="key">zdbid</xsl:with-param>
							<xsl:with-param name="value">
								<xsl:value-of select="slim:subfield[@code='a']"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="slim:datafield[@tag='022']">
					<xsl:call-template name="key">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="name">issn</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="array">
						<xsl:with-param name="value">
							<xsl:for-each select="slim:datafield[@tag='022']">
								<xsl:call-template name="value">
									<xsl:with-param name="adding">
										<xsl:if test="position() > 1">1</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="value">
										<xsl:value-of select="slim:subfield[@code='a']"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="slim:datafield[@tag='029'][@ind1='a'][@ind2='a']">
					<xsl:call-template name="key">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="name">issn_auth</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="array">
						<xsl:with-param name="value">
							<xsl:for-each select="slim:datafield[@tag='029'][@ind1='a'][@ind2='a']">
								<xsl:call-template name="value">
									<xsl:with-param name="adding">
										<xsl:if test="position() > 1">1</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="value">
										<xsl:call-template name="splitonequals">
											<xsl:with-param name="string">
												<xsl:value-of select="slim:subfield[@code='a']"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="slim:datafield[@tag='029'][@ind1='a'][@ind2='b']">
					<xsl:call-template name="key">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="name">issn_carrier</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="array">
						<xsl:with-param name="value">
							<xsl:for-each select="slim:datafield[@tag='029'][@ind1='a'][@ind2='b']">
								<xsl:call-template name="value">
									<xsl:with-param name="adding">
										<xsl:if test="position() > 1">1</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="value">
										<xsl:call-template name="splitonequals">
											<xsl:with-param name="string">
												<xsl:value-of select="slim:subfield[@code='a']"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="slim:datafield[@tag='029'][@ind1='a'][@ind2='c']">
					<xsl:call-template name="key">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="name">issn_online</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="array">
						<xsl:with-param name="value">
							<xsl:for-each select="slim:datafield[@tag='029'][@ind1='a'][@ind2='c']">
								<xsl:call-template name="value">
									<xsl:with-param name="adding">
										<xsl:if test="position() > 1">1</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="value">
										<xsl:call-template name="splitonequals">
											<xsl:with-param name="string">
												<xsl:value-of select="slim:subfield[@code='a']"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="slim:datafield[@tag='029'][@ind1='a'][@ind2='d']">
					<xsl:call-template name="key">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="name">issn_print</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="array">
						<xsl:with-param name="value">
							<xsl:for-each select="slim:datafield[@tag='029'][@ind1='a'][@ind2='d']">
								<xsl:call-template name="value">
									<xsl:with-param name="adding">
										<xsl:if test="position() > 1">1</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="value">
										<xsl:call-template name="splitonequals">
											<xsl:with-param name="string">
												<xsl:value-of select="slim:subfield[@code='a']"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="slim:datafield[@tag='029'][@ind1='b']">
					<xsl:call-template name="key">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="name">issn_wrong</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="array">
						<xsl:with-param name="value">
							<xsl:for-each select="slim:datafield[@tag='029'][@ind1='b']">
								<xsl:call-template name="value">
									<xsl:with-param name="adding">
										<xsl:if test="position() > 1">1</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="value">
										<xsl:call-template name="splitonequals">
											<xsl:with-param name="string">
												<xsl:value-of select="slim:subfield[@code='a']"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:apply-templates select="slim:datafield[@tag='035']"/>
				<xsl:if test="slim:datafield[@tag='770']">
					<xsl:call-template name="key">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="name">supplement</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="array">
						<xsl:with-param name="value">
							<xsl:apply-templates select="slim:datafield[@tag='770']" mode="relation"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="slim:datafield[@tag='772']">
					<xsl:call-template name="key">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="name">container</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="array">
						<xsl:with-param name="value">
							<xsl:apply-templates select="slim:datafield[@tag='772']" mode="relation"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="slim:datafield[@tag='775']">
					<xsl:call-template name="key">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="name">parallel</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="array">
						<xsl:with-param name="value">
							<xsl:apply-templates select="slim:datafield[@tag='775']" mode="relation"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="slim:datafield[@tag='780']">
					<xsl:call-template name="key">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="name">precessor</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="array">
						<xsl:with-param name="value">
							<xsl:apply-templates select="slim:datafield[@tag='780']" mode="relation"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="slim:datafield[@tag='785']">
					<xsl:call-template name="key">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="name">successor</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="array">
						<xsl:with-param name="value">
							<xsl:apply-templates select="slim:datafield[@tag='785']" mode="relation"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:with-param>		
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="slim:datafield[@tag='035']">
		<xsl:variable name="sfa">
			<xsl:value-of select="current()/slim:subfield[@code='a']"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="contains($sfa,'OCoLC')">
				<xsl:call-template name="keyvalue">
					<xsl:with-param name="adding">1</xsl:with-param>
					<xsl:with-param name="key">oclc</xsl:with-param>
					<xsl:with-param name="value">
						<xsl:value-of select="substring-after($sfa,')')"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="contains($sfa,'NL-LiSWE')">
				<xsl:call-template name="keyvalue">
					<xsl:with-param name="adding">1</xsl:with-param>
					<xsl:with-param name="key">loc</xsl:with-param>
					<xsl:with-param name="value">
						<xsl:value-of select="substring-after($sfa,')')"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="slim:datafield[@tag='770']" mode="relation">
		<xsl:if test="position() > 1"><xsl:text>,</xsl:text>
		</xsl:if>
		<xsl:call-template name="relation"/>
	</xsl:template>
	<xsl:template match="slim:datafield[@tag='772']" mode="relation">
		<xsl:if test="position() > 1"><xsl:text>,</xsl:text>
		</xsl:if>
		<xsl:call-template name="relation"/>
	</xsl:template>
	<xsl:template match="slim:datafield[@tag='775']" mode="relation">
		<xsl:if test="position() > 1"><xsl:text>,</xsl:text>
		</xsl:if>
		<xsl:call-template name="relation"/>
	</xsl:template>
	<xsl:template match="slim:datafield[@tag='780']" mode="relation">
		<xsl:if test="position() > 1"><xsl:text>,</xsl:text>
		</xsl:if>
		<xsl:call-template name="relation"/>
	</xsl:template>
	<xsl:template match="slim:datafield[@tag='785']" mode="relation">
		<xsl:if test="position() > 1"><xsl:text>,</xsl:text>
		</xsl:if>
		<xsl:call-template name="relation"/>
	</xsl:template>
	<xsl:template name="relation">
		<xsl:call-template name="object">
			<xsl:with-param name="properties">
				<xsl:if test="slim:subfield[@code='i']">
					<xsl:call-template name="keyvalue">
						<xsl:with-param name="adding">0</xsl:with-param>
						<xsl:with-param name="key">text</xsl:with-param>
						<xsl:with-param name="value">
							<xsl:value-of select="slim:subfield[@code='i']"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="slim:subfield[@code='t']">
					<xsl:call-template name="keyvalue">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="key">title</xsl:with-param>
						<xsl:with-param name="value">
							<xsl:value-of select="slim:subfield[@code='t']"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:for-each select="slim:subfield[@code='w']">
					<xsl:call-template name="list">
						<xsl:with-param name="adding">1</xsl:with-param>
						<xsl:with-param name="value">
							<xsl:if test="substring(.,2,6)='DE-101'">
								<xsl:call-template name="keyvalue">
									<xsl:with-param name="key">ppn</xsl:with-param>
									<xsl:with-param name="value">
										<xsl:value-of select="substring(.,9)"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="substring(.,2,6)='DE-600'">
								<xsl:call-template name="keyvalue">
									<xsl:with-param name="key">zdbid</xsl:with-param>
									<xsl:with-param name="value">
										<xsl:value-of select="substring(.,9)"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="array">
		<xsl:param name="value"/>
		<xsl:text>[</xsl:text>
		<xsl:value-of select="$value"/>
		<xsl:text>]</xsl:text>
	</xsl:template>
	<xsl:template name="object">
		<xsl:param name="properties"/>
		<xsl:text>{</xsl:text>
		<xsl:value-of select="$properties"/>
		<xsl:text>}</xsl:text>
	</xsl:template>
	<xsl:template name="keyvalue">
		<xsl:param name="key"/>
		<xsl:param name="value"/>
		<xsl:param name="adding"/>
		<xsl:if test="$adding > 0">,</xsl:if>
		<xsl:call-template name="key">
			<xsl:with-param name="name">
				<xsl:value-of select="$key"/>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="value">
			<xsl:with-param name="value">
				<xsl:value-of select="$value"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="key">
		<xsl:param name="name"/>
		<xsl:param name="adding"/>
		<xsl:if test="$adding > 0">,</xsl:if>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="$name"/>
		<xsl:text>":</xsl:text>
	</xsl:template>
	<xsl:template name="value">
		<xsl:param name="value"/>
		<xsl:param name="adding"/>
		<xsl:if test="$adding > 0">,</xsl:if>
		<xsl:text>"</xsl:text>
		<xsl:value-of select="$value"/>
		<xsl:text>"</xsl:text>
	</xsl:template>
	<xsl:template name="list">
		<xsl:param name="value"/>
		<xsl:param name="adding"/>
		<xsl:if test="$adding > 0">,</xsl:if>
		<xsl:value-of select="$value"/>
	</xsl:template>
	<xsl:template name="list_object">
		<xsl:param name="properties"/>
		<xsl:param name="adding"/>
		<xsl:if test="$adding > 0">,</xsl:if>
		<xsl:call-template name="object">
			<xsl:with-param name="properties">
				<xsl:value-of select="$properties"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="splitonequals">
		<xsl:param name="string"/>
		<xsl:choose>
			<xsl:when test="contains($string, ' = ')">
				<xsl:value-of select="substring-before($string,' = ')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$string"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
