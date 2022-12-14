<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="storepickup" tagdir="/WEB-INF/tags/responsive/storepickup" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<img style="width: 100%;" src="https://inthebox.net/images/layout-v2/catalog-header.png"/>


<spring:htmlEscape defaultHtmlEscape="true" />

<h1 class="tengah">PILIHAN PRODUK INTHEBOX</h1>

<div class="flowrow">
        <c:forEach items="${searchPageData.results}" var="product" varStatus="status">
            <product:productListerItem product="${product}" inthebox="${intheboxproduct}"/>
        </c:forEach>
</div>



<storepickup:pickupStorePopup/>