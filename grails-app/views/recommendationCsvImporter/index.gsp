
<%@ page import="importer.RecommendationCsvImporter" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'recommendationCsvImporter.label', default: 'RecommendationCsvImporter')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-recommendationCsvImporter" class="first">
<g:form action="importFile" enctype="multipart/form-data" useToken="true">

<span class="button">                   
                    <input type="file" name="filecsv"/>
                    <input type="submit" class="upload" value="upload"/>

            </span>

</g:form>
</section>

</body>

</html>
