<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<cms:pageSlot position="Section1" var="feature" class="termsAndConditions-section" element="div">
	<cms:component component="${feature}" element="div" class="clearfix"/>
</cms:pageSlot>
