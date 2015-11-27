<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib prefix="liferay-portlet" uri="http://liferay.com/tld/portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>
<%@ taglib uri="/WEB-INF/tld/math.tld" prefix="math"%>
<%@page import="com.liferay.portal.kernel.dao.search.SearchContainer"%>
<%@page import="com.liferay.portal.kernel.dao.search.DisplayTerms"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@page import="javax.portlet.PortletURL"%>
<%@page import="org.springframework.web.client.RestTemplate"%>
<%@page import="com.liferay.training.neo.model.NeoResponse"%>
<%@page import="com.liferay.training.neo.model.Neo"%>


<portlet:defineObjects />
<liferay-theme:defineObjects />
<%
	int neoId = ParamUtil.getInteger(request, "id", 0);
	NeoResponse result = new RestTemplate().getForObject(
		"https://api.nasa.gov/neo/rest/v1/feed?api_key=gmD3rNzZsgzmD2hIeTiMC9L1ctDc8dAbmZc11JAO",
		NeoResponse.class);
	for (Neo neo : result.getNearEarthObjects()) {
		if (neo.getId() == neoId) {
			request.setAttribute("neo", neo);
			break;
		}
	}
	

	
	request.setAttribute("listUrl", ParamUtil.getString(request, "listUrl"));
	
%>

<portlet:actionURL name="updateNeo" var="editNeoURL" windowState="normal" />

<liferay-ui:header backURL="${listUrl}" title="${neo.name}" />

<aui:form action="${editNeoURL}" method="POST" name="fm">
<aui:model-context bean="${neo}" model="<%= Neo.class %>" />
	<aui:fieldset>

		<aui:input type="hidden" name="id" />

		<aui:input type="text" name="name" disabled="true" />

		<aui:input type="textarea" name="description" />
	</aui:fieldset>

	<aui:button-row>
		<aui:button type="submit" />

		<aui:button type="cancel" onClick="${listUrl}" />
	</aui:button-row>
</aui:form>