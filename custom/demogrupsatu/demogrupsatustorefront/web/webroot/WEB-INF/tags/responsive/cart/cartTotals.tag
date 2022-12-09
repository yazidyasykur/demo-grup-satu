<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="cartData" required="true" type="de.hybris.platform.commercefacades.order.data.CartData" %>
<%@ attribute name="showTax" required="false" type="java.lang.Boolean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="quote" tagdir="/WEB-INF/tags/responsive/quote" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<div class="js-cart-totals row">
    <div class="col-xs-6 cart-totals-left grand-total"><spring:theme code="basket.page.totals.total"/></div>
    <div class="col-xs-6 cart-totals-right text-right grand-total">
        <ycommerce:testId code="cart_totalPrice_label">
            <c:choose>
                <c:when test="${showTax}">
                    <format:price priceData="${cartData.totalPriceWithTax}"/>
                </c:when>
                <c:otherwise>
                    <format:price priceData="${cartData.totalPrice}"/>
                </c:otherwise>
            </c:choose>
        </ycommerce:testId>
    </div>
</div>