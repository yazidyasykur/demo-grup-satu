<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="multi-checkout" tagdir="/WEB-INF/tags/responsive/checkout/multi"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<template:page pageTitle="${pageTitle}" hideHeaderLinks="true">

<div class="centered container-custom">
    <div class="multistep-container">
		<multi-checkout:checkoutSteps checkoutSteps="${checkoutSteps}" progressBarId="${progressBarId}">
			<jsp:body>
				<ycommerce:testId code="checkoutStepTwo">
					<div class="checkout-shipping">
						<div class="checkout-indent-custom">
							<div class="headline"><spring:theme code="checkout.summary.deliveryMode.selectDeliveryMethodForOrder" /></div>
							<spring:url var="selectDeliveryMethodUrl" value="{contextPath}/checkout/multi/delivery-method/select" htmlEscape="false" >
								<spring:param name="contextPath" value="${request.contextPath}" />
							</spring:url>
							<form id="selectDeliveryMethodForm" action="${fn:escapeXml(selectDeliveryMethodUrl)}" method="get">
								<div class="form-group">
									<multi-checkout:deliveryMethodSelector deliveryMethods="${deliveryMethods}" selectedDeliveryMethodId="${cartData.deliveryMode.code}"/>
								</div>
							</form>
							<spring:theme var="deliveryMethodMessageHtml" code="checkout.multi.deliveryMethod.message" htmlEscape="false"/>
							<p>${ycommerce:sanitizeHTML(deliveryMethodMessageHtml)}</p>
						</div>
					</div>
					<button id="deliveryMethodSubmit" type="button" class="next-btn checkout-next"><spring:theme code="checkout.multi.deliveryMethod.continue"/></button>
				</ycommerce:testId>
			</jsp:body>
		</multi-checkout:checkoutSteps>
    </div>

    <div class="">
		<multi-checkout:checkoutOrderDetails cartData="${cartData}" showDeliveryAddress="true" showPaymentInfo="false" showTaxEstimate="false" showTax="true" />
    </div>
</div>

</template:page>
