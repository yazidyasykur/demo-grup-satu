<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<c:url value="/cart/checkout" var="checkoutUrl" scope="session"/>


<div class="cart__actions">
    <div class="row">
        <div class="col-sm-4 col-md-3 pull-right">
            <ycommerce:testId code="checkoutButton">
                <button class="btn btn-primary btn-block btn--continue-checkout js-continue-checkout-button" data-checkout-url="${fn:escapeXml(checkoutUrl)}">
                    <spring:theme code="checkout.checkout"/>
                </button>
            </ycommerce:testId>
        </div>

        <sec:authorize access="!hasAnyRole('ROLE_ANONYMOUS')">
            <c:if test="${not empty siteQuoteEnabled and siteQuoteEnabled eq 'true'}">
                <div class="col-sm-4 col-md-3 col-md-offset-3 pull-right">
                    <button class="btn btn-default btn-block btn--continue-shopping js-continue-shopping-button"    data-continue-shopping-url="${fn:escapeXml(createQuoteUrl)}">
                        <spring:theme code="quote.create"/>
                    </button>
                </div>
            </c:if>
        </sec:authorize>

        <div class="col-sm-4 col-md-3 pull-right">
            <button class="btn btn-default btn-block btn--continue-shopping js-continue-shopping-button" data-continue-shopping-url="${fn:escapeXml(continueShoppingUrl)}">
                <spring:theme code="cart.page.continue"/>
            </button>
        </div>
    </div>
</div>

