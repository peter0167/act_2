<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Movie Database</title>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <h2>Movie List</h2>
                <table>
                    <tr>
                        <th>Title</th>
                        <th>Director</th>
                        <th>Actors</th>
                        <th>Year</th>
                    </tr>
                    <xsl:for-each select="movies/movie">
                        <tr>
                            <td><xsl:value-of select="movieTitle"/></td>
                            <td><xsl:value-of select="director"/></td>
                            <td>
                                <xsl:for-each select="actors/actor">
                                    <xsl:value-of select="."/><br/>
                                </xsl:for-each>
                            </td>
                            <td><xsl:value-of select="year"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>   
        </html>
    </xsl:template>
</xsl:stylesheet>