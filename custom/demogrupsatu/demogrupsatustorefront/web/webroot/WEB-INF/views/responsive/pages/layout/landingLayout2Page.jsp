<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<template:page pageTitle="${pageTitle}">

    <div class="homepage-card-product">
        <cms:pageSlot position="Section1" var="feature">
            <cms:component component="${feature}" element="div" class="banner-homepage"/>
        </cms:pageSlot>
    </div>
    <!--
    <div class="row no-margin">
        <div class="col-xs-12 col-md-6 no-space">
            <cms:pageSlot position="Section2A" var="feature" element="div" class="row no-margin">
                <cms:component component="${feature}" element="div" class="col-xs-12 col-sm-6 no-space yComponentWrapper"/>
            </cms:pageSlot>
        </div>
        <div class="col-xs-12 col-md-6 no-space">
            <cms:pageSlot position="Section2B" var="feature" element="div" class="row no-margin">
                <cms:component component="${feature}" element="div" class="col-xs-12 col-sm-6 no-space yComponentWrapper"/>
            </cms:pageSlot>
        </div>
        <div class="col-xs-12">
            <cms:pageSlot position="Section2C" var="feature" element="div" class="landingLayout2PageSection2C">
                <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
            </cms:pageSlot>
        </div>
    </div>
     -->

     <!-- carousel kartu produk -->
    <section class="layout-2-home">
        <div class="container tengah">
            <div class="section-header1">
                <h1>BELI <em>KASUR</em> INTHEBOX</h1>
            </div>
            <div class="subtitle text-center">
                Tersedia beragam jenis kasur INTHEBOX dengan kualitas premium.
                <br>
                Pilih spring bed berkualitas dengan ukuran kasur sesuai kebutuhan.
            </div>
        </div>
        <div class="container tengah">
            <cms:pageSlot position="Section3" var="feature" element="div" class="row no-margin" >
                <cms:component component="${feature}" element="div" class="no-space yComponentWrapper"/>
            </cms:pageSlot>
        </div>
    </section>

    <!-- carousel unboxing -->
    <section class="unbox">
        <div class="container tengah">
            <div class="section-header">
                <h1>UNBOXING INTHEBOX</h1>
            </div>
        </div>
        <div class="container tengah">
            <cms:pageSlot position="Section4" var="feature" element="div" class="row no-margin">
                <cms:component component="${feature}" element="div" class="col-xs-6 col-md-3 no-space yComponentWrapper"/>
            </cms:pageSlot>
        </div>
    </section>

    <!-- carousel testimoni -->
    <section class="testimoni">
        <div class="container tengah">
            <h2 class="section-header">TESTIMONI</h2>
            <div class="subtitle text-center">
                <div class="mb-2">
                    Banyak pembeli yang merasa puas dengan kualitas kasur INTHEBOX
                    Kami menerima beragam komentar positif dari pembeli di seluruh Indonesia,
                    bahkan dari kalangan artis. Bukan hanya pengalaman membeli kasur sping bed
                    atau kasur busa, banyak juga yang merasa puas dengan produk INTHEBOX lainnya
                    yang terdiri dari bantal, guling, dan sofa bed.
                </div>
            </div>
            <div class="flex-display flex-end-display">

                    <c:forEach begin="1" end="${starCount}" var="i">
                        <div class="star">
                            <img src="https://inthebox.net/images/star-full.webp" alt="star">
                        </div>
                    </c:forEach>
                    <c:if test="${isMoreThanHalf}">
                        <div class="star">
                            <img src="https://inthebox.net/images/star-half.webp" alt="star">
                        </div>
                    </c:if>
                    <span class="desc">${average}/5 (${totalReview} Reviews)</span>

            </div>
        </div>
        <div class="container tengah">
            <cms:pageSlot position="Section5" var="feature" element="div">
                <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
            </cms:pageSlot>
        </div>
        <div class="box-container-display">
        <c:forEach items="${showSomeTestimoni}" var="testi">
            <div class="box-display">
                <img src="${fn:escapeXml(commonResourcePath)}/images/orang.png" class="pic" />
                <div class="text">
                    <h4 class="name-color text-weight-bold">${testi.name}</h4>
                    <c:forEach begin="1" end="${testi.rating}" var="i">
                        <img src="https://inthebox.net/images/star-full.png" data-src="https://inthebox.net/images/star-full.png" class="star" alt="Star" />
                    </c:forEach>
                    <c:if test="${testi.halfStar}">
                        <img src="https://inthebox.net/images/star-half.png" data-src="https://inthebox.net/images/star-half.png" class="star" alt="Star" />
                    </c:if>
                    <h4 class="text-weight-bold">${testi.title}</h4>
                    <p>${testi.description}</p>
                    <p class="date-color">${testi.date}</p>
                </div>
            </div>
        </c:forEach>
        </div>
        <div class="link text-center">
            <c:url value="/testimoni" var="testimony" />
            <a class="btn btn-brand" href="${fn:escapeXml(testimony)}">Lihat Semua Testimoni</a>
        </div>
    </section>

</template:page>
