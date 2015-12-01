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
<portlet:defineObjects />
<liferay-theme:defineObjects />

<%
NeoResponse result = new RestTemplate().getForObject(
		"https://api.nasa.gov/neo/rest/v1/feed?api_key=gmD3rNzZsgzmD2hIeTiMC9L1ctDc8dAbmZc11JAO",
		NeoResponse.class);

renderRequest.setAttribute("neos", result.getNearEarthObjects());
%>
<portlet:actionURL name="searchAction" var="portletURL" />


<%
	// TODO 5: display a success message upon form submit,
	// triggered by the 'SessionMessages.add()' from the portlet class
	// Hint: <liferay-ui:success />
%>


<aui:form action="${portletURL}" method="post">
<liferay-ui:search-container delta="10" emptyResultsMessage="No NEOs found">
	<aui:nav-bar>

		<aui:nav-bar-search cssClass="pull-right">
			<div class="form-search">
				<liferay-ui:input-search autoFocus="true" name="keywords" placeholder="Keywords" />
			</div>
		</aui:nav-bar-search>

	</aui:nav-bar>

	<%
		// TODO 1.5: add a total= attribute to this search-container-results element, to let
		// the search container properly render the pagination
	%>
	<liferay-ui:search-container-results results="${neos.subList(searchContainer.start, math:min(searchContainer.end, neos.size()))}"
		 />

	<liferay-ui:search-container-row className="com.liferay.training.neo.model.Neo" keyProperty="id"
		modelVar="neo">

		<portlet:renderURL var="detailUrl">
			<portlet:param name="mvcPath" value="/html/detail.jsp" />
			<portlet:param name="listUrl" value="${searchContainer.iteratorURL}" />
			<portlet:param name="id" value="${neo.id}" />
		</portlet:renderURL>

		<%
			// TODO 1: render some properties of this NEO.
			// See getters of om.liferay.training.neo.model.Neo for inspiration.
			// Hint: <liferay-ui:search-container-column-text />
		
			// TODO 2: render a link to the detail page, using ${detailUrl} set above, also using <liferay-ui:search-container-column-text />
			// 
		 %>  

	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>

</aui:form>