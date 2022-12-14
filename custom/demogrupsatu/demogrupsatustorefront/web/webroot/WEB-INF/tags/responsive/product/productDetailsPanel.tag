<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>


<div class="container">
    <div class="row centered container-pdp">
        <div class="col-lg-6 col-xl-7 image-pdp">
            <product:productImagePanel galleryImages="${galleryImages}" />
        </div>
        <div class="clearfix hidden-sm hidden-md hidden-lg"></div>

        <div class="col-lg-6 col-xl-5 image-pdp">
            <div class="product-details page-title">
                <ycommerce:testId code="productDetails_productNamePrice_label_${product.code}">
                    <div class="name"><span>${fn:escapeXml(product.baseProduct)}</span><span class="sku">ID</span>
                        <div class="code">${fn:escapeXml(product.name)}</div>
                    </div>
                </ycommerce:testId>
            </div>
            <div class="product-main-info">
                <div class=" palmer-font-pdp ">
                    <product:productPromotionSection product="${product}"/>
                    <ycommerce:testId code="productDetails_productNamePrice_label_${product.code}">
                            <product:productPricePanel product="${product}" />
                    </ycommerce:testId>
                </div>
                <div class="size-custom">
                    <div>
                        <p>Kasur <span>${fn:escapeXml(product.baseProduct)}</span> size <c:out value="${dimensi}"/> </p>
                    </div>
                    <div>${fn:escapeXml(product.description)}</div>
                </div>

                <cms:pageSlot position="AddToCart" var="component" element="div" class="page-details-variants-select">
                    <cms:component component="${component}" element="div" class="yComponentWrapper page-details-add-to-cart-component"/>
                </cms:pageSlot>
            </div>
        </div>
    </div>
    <div class="row container tengah ">
        <c:forEach items="${variant}" var="tipe">
            <div class="col-sm-4 text-left">
                <c:url value="/p/${tipe.code}" var="pdp"/>
                <a href="${pdp}">
                    <img src="${tipe.picture}">
                    <h4>${tipe.code}</h4>
                    <p>${tipe.dimension} x ${tipe.height}</p>
                    <p>${tipe.size}</p>
                    <div class="palmer-font-pdp-2">
                        <format:price priceData="${tipe.harga}" displayFreeForZero="true"/>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
    <div class"w-full mx-auto">
        <c:url value="/c/INTHEBOX" var="plp"/>
        <button class="button-2" onclick="location.href='${plp}'">Lihat Semua Produk</button>
    </div>
</div>
