<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<template:page pageTitle="${pageTitle}">

<div class="price_engine_page">
   <div class="row step-section">
       <cms:pageSlot position="Section1-stepPriceEngine" var="feature">
           <cms:component component="${feature}" element="div" class="step-price-engine"/>
       </cms:pageSlot>
   </div>

   <div class="container">

       <div class="main-section col-lg-12">
            <div class="container-display">
                <div class="box-top-testimoni">
                    <p class="text-center text-weight-bold testimoni-title-responsive">TESTIMONI PEMBELI INTHEBOX</p>
                    <p class="text-center">Banyak pembeli yang merasa puas dengan kualitas kasur INTHEBOX</p>
                    <p class="text-justify">Kami menerima beragam komentar positif dari pembeli di seluruh Indonesia, bahkan dari kalangan artis. Bukan hanya pengalaman membeli kasur sping bed atau kasur busa, banyak juga yang merasa puas dengan produk INTHEBOX lainnya yang terdiri dari bantal, guling, dan sofa bed.</p>
                    <p class="text-justify">
                        Kami selalu berinovasi menghadirkan beragam jenis kasur dan produk penunjang istirahat lainnya. Kami paham bahwa istirahat yang cukup dan tidur berkualitas adalah hal yang penting. Oleh karena itu, kami selalu menggunakan material berkualitas premium, namun kamu bisa memilikinya dengan harga terjangkau.
                    </p>
                </div>
                <div class="box-container-display">
                <c:forEach items="${testimoniList}" var="testi">
                    <div class="box-display">
                        <div class="flex-display flex-row-display align-center">
                            <p class="name-color text-weight-bold text-responsive">${testi.name}</p>
                            <img src="${fn:escapeXml(commonResourcePath)}/images/orang.png" class="pic" />
                        </div>
                        <c:set value="0" var="halfStarPlace" />
                        <div class="text">
                            <c:forEach begin="1" end="${testi.rating}" var="i">
                                <img src="${fn:escapeXml(commonResourcePath)}/images/bintang-full.png" data-src="${fn:escapeXml(commonResourcePath)}/images/bintang-full.png" class="star" alt="Star" />
                            </c:forEach>
                            <c:if test="${testi.halfStar}">
                                <img src="${fn:escapeXml(commonResourcePath)}/images/bintang-setengah.png" data-src="${fn:escapeXml(commonResourcePath)}/images/bintang-setengah.png" class="star" alt="Star" />
                                <c:set value="1" var="halfStarPlace" />
                            </c:if>
                            <c:forEach begin="1" end="${5 - testi.rating - halfStarPlace}" var="i">
                                <img src="${fn:escapeXml(commonResourcePath)}/images/bintang-kosong.png" class="star" alt="Star" />
                            </c:forEach>
                            <p class="text-weight-bold title-testi text-responsive">${testi.title}</p>
                            <p class="description">${testi.description}</p>
                            <p class="date-color">${testi.date}</p>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>

            <div class="button-container flex-display flex-row-center-display">
                <c:if test="${number > 1}" >
                    <c:url value="/testimoni?page=${number-1}" var="previousPage"/>
                    <button onclick="location.href='${previousPage}'" class="button-next-previous">
                        < Halaman Sebelumnya
                    </button>
                </c:if>
                <c:if test="${number < max}" >
                    <c:url value="/testimoni?page=${number+1}" var="nextPage"/>
                    <button onclick="location.href='${nextPage}'" class="button-next-previous">
                        Halaman Selanjutnya >
                    </button>
                </c:if>
            </div>
       </div>
   </div>
</div>
</template:page>

