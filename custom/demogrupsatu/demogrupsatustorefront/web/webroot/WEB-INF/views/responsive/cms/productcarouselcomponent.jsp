<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="component" tagdir="/WEB-INF/tags/shared/component" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<c:choose>
	<c:when test="${not empty productData}">
		<div class="carousel__component">
			<div class="carousel__component--headline">${fn:escapeXml(title)}</div>

			<c:choose>
				<c:when test="${component.popup}">
					<div class="carousel__component--carousel card-product">
						<div id="quickViewTitle" class="quickView-header display-none">
							<div class="headline">
								<span class="headline-text"><spring:theme code="popup.quick.view.select"/></span>
							</div>
						</div>
						<c:forEach items="${productData}" var="product">

							<c:url value="${product.url}/quickView" var="productQuickViewUrl"/>
							<div class="carousel__item layout-card-carousel">
								<!-- <a href="${productQuickViewUrl}" class="js-reference-item"> -->
									<div class="carousel__item--thumb">
										<product:productPrimaryReferenceImage product="${product}" format="product"/>
									</div>
									<div class="carousel__item--name">${fn:escapeXml(product.name)}</div>
									<div class="carousel__item--name">${fn:escapeXml(product.description)}</div>
									<div class="carousel__item--price"><format:fromPrice priceData="${product.price}"/></div>
									<div class="text-center">
                                        <button class="button-2" onclick="location.href='${productQuickViewUrl}'">Beli Sekarang</button>
                                    </div>
								<!-- </a> -->
							</div>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<div class="carousel__component--carousel card-product">
						<c:forEach items="${productData}" var="product">

							<c:url value="${product.url}" var="productUrl"/>

							<div class="carousel__item layout-card-carousel">
								<!-- <a href="${productUrl}"> -->
									<div class="carousel__item--thumb small-margin-top">
										<product:productPrimaryImage product="${product}" format="product"/>
									</div>
									<div class="carousel__item--name">${fn:escapeXml(product.name)}</div>
									<div class="carousel__item--name">${fn:escapeXml(product.description)}</div>
									<div class="carousel__item--price"><format:fromPrice priceData="${product.price}"/></div>
									<div class="text-center small-margin-bottom">
                                        <a class="button-2" href="${productUrl}">Beli Sekarang</a>
                                    </div>
								<!-- </a> -->
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</c:when>

	<c:otherwise>
		<component:emptyComponent/>
	</c:otherwise>
</c:choose>

