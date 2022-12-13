<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>


<div class="container">
    <div class="row">
        <div class="col-lg-6 col-xl-7">
            <product:productImagePanel galleryImages="${galleryImages}" />
        </div>
        <div class="clearfix hidden-sm hidden-md hidden-lg"></div>

        <div class="col-lg-6 col-xl-5">
            <div class="product-details page-title">
                <ycommerce:testId code="productDetails_productNamePrice_label_${product.code}">
                    <div class="name"><span>${fn:escapeXml(product.baseProduct)}</span><span class="sku">ID</span>
                        <div class="code">${fn:escapeXml(product.name)}</div>
                    </div>
                </ycommerce:testId>
            </div>
            <div class="product-main-info">
                <div class="product-details">
                    <product:productPromotionSection product="${product}"/>
                    <ycommerce:testId code="productDetails_productNamePrice_label_${product.code}">
                        <product:productPricePanel product="${product}" />
                    </ycommerce:testId>
                </div>
                <div>
                    <c:out value="${size}"/>
                </div>
                <div>
                    <c:out value="${dimensi} x "/>
                    <c:out value="${tinggi}"/>
                </div>

                <cms:pageSlot position="VariantSelector" var="component" element="div" class="page-details-variants-select">
                    <cms:component component="${component}" element="div" class="yComponentWrapper page-details-variants-select-component"/>
                </cms:pageSlot>
                <cms:pageSlot position="AddToCart" var="component" element="div" class="page-details-variants-select">
                    <cms:component component="${component}" element="div" class="yComponentWrapper page-details-add-to-cart-component"/>
                </cms:pageSlot>
            </div>
        </div>
    </div>
    <div class="row container tengah">
        <c:forEach items="${variant}" var="tipe">
            <div class="col-sm-4">
                <img src="${tipe.picture}">
                <h1>${tipe.code}</h1>
                <p>${tipe.size}</p>
                <p>${tipe.dimension} x ${tipe.height}</p>
                <format:price priceData="${tipe.harga}" displayFreeForZero="true"/>
            </div>
        </c:forEach>
    </div>
</div>
