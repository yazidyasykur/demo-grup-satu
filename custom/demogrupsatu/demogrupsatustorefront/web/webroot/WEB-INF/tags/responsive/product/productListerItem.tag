<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>
<%@ attribute name="inthebox" required="true" type="org.demogrupsatu.facades.intheboxproduct.IntheboxProductData" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<spring:theme code="text.addToCart" var="addToCartText"/>
<c:url value="${product.url}" var="productUrl"/>

<c:set value="${not empty product.potentialPromotions}" var="hasPromotion"/>

<c:set value="product__list--item" var="productTagClasses"/>
<c:forEach var="tag" items="${product.tags}">
	<c:set value="${productTagClasses} tag-${tag}" var="productTagClasses"/>
</c:forEach>

            <div class="flowrowblock">
                <a  href="${fn:escapeXml(productUrl)}" title="${fn:escapeXml(product.name)}" >
                    <product:productPrimaryImage product="${product}" format="thumbnail"/>
                </a>
                <br>
                <a class="tebal nama" href="${fn:escapeXml(productUrl)}">${ycommerce:sanitizeHTML(product.name)}</a>
                <br>
                <c:if test="${product.height!=null}">
                    <a class="kecil" href="${fn:escapeXml(productUrl)}">${ycommerce:sanitizeHTML(product.dimension)}</a>
                </c:if>
                <br>
                <a class="kecil" href="${fn:escapeXml(productUrl)}">${ycommerce:sanitizeHTML(product.size)}</a>
                <br>
                <a class="untukhargalist"   href="${fn:escapeXml(productUrl)}"><product:productListerItemPrice product="${product}"/></a>
          </div>









