<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template-for-logreg"%>
<%@ taglib prefix="user" tagdir="/WEB-INF/tags/responsive/user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<template:page pageTitle="${pageTitle}">
	<c:url value="/register/newcustomer" var="submitAction" />
			<user:registerinthebox actionNameKey="register.submit"
				action="${submitAction}" />
</template:page>