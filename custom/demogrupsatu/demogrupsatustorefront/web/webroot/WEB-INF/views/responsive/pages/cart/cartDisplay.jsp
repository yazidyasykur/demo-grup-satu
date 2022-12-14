<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<spring:htmlEscape defaultHtmlEscape="true" />


<c:if test="${not empty cartData.rootGroups}">
    <c:url value="/cart/checkout" var="checkoutUrl" scope="session"/>
    <c:url value="/quote/create" var="createQuoteUrl" scope="session"/>
    <c:url value="${continueUrl}" var="continueShoppingUrl" scope="session"/>
    <c:set var="showTax" value="false"/>

    <cart:cartItems cartData="${cartData}"/>

    <div class="cartNote row">
        <p>Catatan Pembelian :</p>
        <div>
            <textarea rows="5" id="catatan" name="catatan" placeholder="" class="form-control-custom"></textarea>
        </div>
    </div>

</c:if>
<cart:ajaxCartTopTotalSection/>
