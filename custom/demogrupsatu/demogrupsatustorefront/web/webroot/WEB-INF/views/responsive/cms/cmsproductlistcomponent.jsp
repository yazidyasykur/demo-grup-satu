<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="storepickup" tagdir="/WEB-INF/tags/responsive/storepickup" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>

<cms:pageSlot position="Banner" var="feature">
    <cms:component component="${feature}" element="div" class="yComponentWrapper content__empty"/>
</cms:pageSlot>

<spring:htmlEscape defaultHtmlEscape="true" />

<h1 class="tengah">
    <spring:theme code="product.list.page.header"/>
</h1>

<div class="flowrow">
        <c:forEach items="${searchPageData.results}" var="product" varStatus="status">
            <product:productListerItem product="${product}" inthebox="${intheboxproduct}"/>
        </c:forEach>
</div>



<storepickup:pickupStorePopup/>