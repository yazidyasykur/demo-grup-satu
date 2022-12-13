<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>

<template:page pageTitle="${pageTitle}">
	<div class="checkout-login">
		<div class="row">
			<div class="col-md-12">
				<cms:pageSlot position="LeftContentSlot" var="feature" element="div" class="checkout-login-left-content-slot">
					<cms:component component="${feature}" element="div"  class="checkout-login-left-content-component"/>
				</cms:pageSlot>
			</div>
		</div>
	</div>
</template:page>
