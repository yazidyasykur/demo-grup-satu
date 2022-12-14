<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ attribute name="hideHeaderLinks" required="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav"%>

<spring:htmlEscape defaultHtmlEscape="true" />

<cms:pageSlot position="TopHeaderSlot" var="component" element="div" >
	<cms:component component="${component}" />
</cms:pageSlot>

<header class="js-mainHeader">
	<div class="header">
	    <c:url value="/INTHEBOX/c/INTHEBOX" var="product" />
        <c:url value="/about" var="about_us" />
        <c:url value="/blog" var="blog" />
        <c:url value="/testimoni" var="testimony" />
        <c:url value="/warranty-registration" var="warranty" />
        <c:url value="/payment-confirmation" var="payment" />
        <c:url value="/waybill-status" var="waybill" />
        <div class="top-part-header">
            <div class="container-part-header flex-display flex-row-display align-center">
                <div class="small-part-header align-center">
                    <div class="small-part-margin title-color">
                        <img src="https://inthebox.net/images/layout-v2/header-icon-10y-warranty.png" class="warranty-pic" />
                        <span>Garansi 10 Tahun</span>
                    </div>
                    <div class="small-part-margin title-color">
                        <img src="https://inthebox.net/images/layout-v2/header-icon-free-shipping.png" class="shipping-pic" />
                        <span>Free Shipping pulau Jawa & Sumatera</span>
                    </div>
                </div>
                <div class="small-part-header link-header">
                    <a href="${fn:escapeXml(warranty)}" class="small-part-margin link-hover-white-area">
                        Garansi
                    </a>
                    <a href="${fn:escapeXml(payment)}" class="small-part-margin link-hover-white-area">
                        Konfirmasi
                    </a>
                    <a href="${fn:escapeXml(waybill)}" class="small-part-margin link-hover-white-area">
                        Cek Resi
                    </a>
                </div>
            </div>
        </div>
        <div class="bottom-part-header">
            <div class="container-part-header flex-display flex-row-display align-center">
                <div class="flex-display flex-row-display">
                    <div class="link-header">
                        <cms:pageSlot position="SiteLogo" var="logo" limit="1">
                            <cms:component component="${logo}" element="div" class="image-resize-header small-part-margin"/>
                        </cms:pageSlot>
                    </div>
                    <div class="link-header-small-web nav-container">
                        <img src="${fn:escapeXml(commonResourcePath)}/images/navbar.png" class="navbar-pic" />
                    </div>
                </div>
                <div class="flex-display flex-row-display text-weight-bold nav-link-header">
                    <div class="link-header">
                        <a href="${fn:escapeXml(product)}" class="small-part-margin-for-link link-hover">
                            Produk
                        </a>
                        <a href="${fn:escapeXml(about_us)}" class="small-part-margin-for-link link-hover">
                            Tentang Kami
                        </a>
                        <a href="${fn:escapeXml(blog)}" class="small-part-margin-for-link link-hover">
                            Blog
                        </a>
                        <a href="${fn:escapeXml(testimony)}" class="small-part-margin-for-link link-hover">
                            Testimoni
                        </a>
                    </div>
                    <div class="link-header-small-web">
                        <cms:pageSlot position="SiteLogo" var="logo" limit="1">
                            <cms:component component="${logo}" element="div" class="image-resize-header small-part-margin"/>
                        </cms:pageSlot>
                    </div>
                </div>
                <div class="flex-display flex-row-display align-center">
                    <div class="link-header">
                        <sec:authorize access="hasAnyRole('ROLE_ANONYMOUS')" >
                            <span class="small-part-margin">
                                <ycommerce:testId code="header_Login_link">
                                    <c:url value="/login" var="loginUrl" />
                                    <a href="${fn:escapeXml(loginUrl)}" class="link-hover">
                                        <spring:theme code="header.link.login"/>
                                    </a>
                                </ycommerce:testId>
                            </span>
                        </sec:authorize>

                        <sec:authorize access="!hasAnyRole('ROLE_ANONYMOUS')" >
                            <span class="small-part-margin">
                                <ycommerce:testId code="header_signOut">
                                    <c:url value="/logout" var="logoutUrl"/>
                                    <a href="${fn:escapeXml(logoutUrl)}" class="link-hover">
                                        <spring:theme code="header.link.logout"/>
                                    </a>
                                </ycommerce:testId>
                            </span>
                        </sec:authorize>
                    </div>

                    <c:url value="/cart" var="cart" />
                    <a href="${fn:escapeXml(cart)}">
                        <img src="https://inthebox.net/images/layout-v2/cart-icon.png" style="max-height: 35px" class="d-none d-md-block small-part-margin" />
                    </a>
                </div>
            </div>
            <div class="link-header-small-web">
                <div class="on-nav-link">
                    <div class="flex-display flex-to-column">
                        <a href="${fn:escapeXml(product)}" class="link-hover text-on-nav-link text-weight-bold">
                            Produk
                        </a>
                        <a href="${fn:escapeXml(about_us)}" class="link-hover text-on-nav-link text-weight-bold">
                            Tentang Kami
                        </a>
                        <a href="${fn:escapeXml(blog)}" class="link-hover text-on-nav-link text-weight-bold">
                            Blog
                        </a>
                        <a href="${fn:escapeXml(testimony)}" class="link-hover text-on-nav-link text-weight-bold">
                            Testimoni
                        </a>
                        <a href="${fn:escapeXml(warranty)}" class="link-hover text-on-nav-link text-weight-bold">
                            Garansi
                        </a>
                        <a href="${fn:escapeXml(payment)}" class="link-hover text-on-nav-link text-weight-bold">
                            Konfirmasi
                        </a>
                        <a href="${fn:escapeXml(waybill)}" class="link-hover text-on-nav-link text-weight-bold">
                            Cek Resi
                        </a>
                        <sec:authorize access="hasAnyRole('ROLE_ANONYMOUS')" >
                            <ycommerce:testId code="header_Login_link">
                                <c:url value="/login" var="loginUrl" />
                                <a href="${fn:escapeXml(loginUrl)}" class="link-hover text-on-nav-link text-weight-bold">
                                    <spring:theme code="header.link.login"/>
                                </a>
                            </ycommerce:testId>
                        </sec:authorize>

                        <sec:authorize access="!hasAnyRole('ROLE_ANONYMOUS')" >
                            <ycommerce:testId code="header_signOut">
                                <c:url value="/logout" var="logoutUrl"/>
                                <a href="${fn:escapeXml(logoutUrl)}" class="link-hover text-on-nav-link text-weight-bold">
                                    <spring:theme code="header.link.logout"/>
                                </a>
                            </ycommerce:testId>
                        </sec:authorize>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>

<cms:pageSlot position="BottomHeaderSlot" var="component" element="div"	class="container-fluid">
	<cms:component component="${component}" />
</cms:pageSlot>
