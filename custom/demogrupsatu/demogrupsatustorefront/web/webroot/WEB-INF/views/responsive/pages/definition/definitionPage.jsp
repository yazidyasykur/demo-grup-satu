<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>

<template:page pageTitle="${pageTitle}">

    <div class="definition-container">
    <cms:pageSlot position="HeadTitle" var="feature">
            <cms:component component="${feature}"/>
        </cms:pageSlot>

    <cms:pageSlot position="Section1" var="feature">
        <cms:component component="${feature}"/>
    </cms:pageSlot>

    <cms:pageSlot position="Section2" var="feature">
            <cms:component component="${feature}" />
        </cms:pageSlot>

    <cms:pageSlot position="Section3" var="feature" element="div">
        <cms:component component="${feature}" />
    </cms:pageSlot>

    <cms:pageSlot position="Section4" var="feature" element="div" class="row no-margin">
        <cms:component component="${feature}" />
    </cms:pageSlot>

    <cms:pageSlot position="Section5" var="feature" element="div">
        <cms:component component="${feature}" />
    </cms:pageSlot>
    </div>
</template:page>