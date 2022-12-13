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
                <p>BELI <span class="palmer-font">KASUR</span> INTHEBOX</p>
            </div>
            <div class="subtitle subtitle-white text-center">
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
                <p>UNBOXING INTHEBOX</p>
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
            <p class="section-header">TESTIMONI</p>
            <div class="subtitle subtitle-black text-justify">
                <div class="testimoni-home-box-responsive">
                Banyak pembeli yang merasa puas dengan kualitas kasur INTHEBOX
                Kami menerima beragam komentar positif dari pembeli di seluruh Indonesia,
                bahkan dari kalangan artis. Bukan hanya pengalaman membeli kasur sping bed
                atau kasur busa, banyak juga yang merasa puas dengan produk INTHEBOX lainnya
                yang terdiri dari bantal, guling, dan sofa bed.
                </div>
            </div>
            <div class="total-review-responsive align-center">
                <c:forEach begin="1" end="${starCount}" var="i">
                    <div class="star">
                        <img src="${fn:escapeXml(commonResourcePath)}/images/bintang-full.png" alt="star">
                    </div>
                </c:forEach>
                <c:if test="${isMoreThanHalf}">
                    <div class="star">
                        <img src="${fn:escapeXml(commonResourcePath)}/images/bintang-setengah.png" alt="star">
                    </div>
                </c:if>
                <span class="review-text">${average}/5 (${totalReview} Reviews)</span>
            </div>
        </div>

        <div class="box-on-homepage">
            <div class="box-container-display">
            <c:forEach items="${showSomeTestimoni}" var="testi">
                <div class="box-display">
                    <div class="flex-display flex-row-display align-center">
                        <p class="name-color text-weight-bold text-responsive">${testi.name}</p>
                        <img src="${fn:escapeXml(commonResourcePath)}/images/orang.png" class="pic" />
                    </div>
                    <div class="text">
                        <c:forEach begin="1" end="${testi.rating}" var="i">
                            <img src="${fn:escapeXml(commonResourcePath)}/images/bintang-full.png" data-src="${fn:escapeXml(commonResourcePath)}/images/bintang-full.png" class="star" alt="Star" />
                        </c:forEach>
                        <c:if test="${testi.halfStar}">
                            <img src="${fn:escapeXml(commonResourcePath)}/images/bintang-setengah.png" data-src="${fn:escapeXml(commonResourcePath)}/images/bintang-setengah.png" class="star" alt="Star" />
                        </c:if>
                        <p class="text-weight-bold title-testi text-responsive">${testi.title}</p>
                        <p class="description">${testi.description}</p>
                        <p class="date-color">${testi.date}</p>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
        <div class="link text-center small-margin-top">
            <c:url value="/testimoni" var="testimony" />
            <a class="button-3 text-weight-bold" href="${testimony}">Lihat Semua Testimoni</a>
        </div>
    </section>

</template:page>
