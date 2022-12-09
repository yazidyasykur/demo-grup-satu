<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- Verified that there's a pre-existing bug regarding the setting of showTax; created issue  --%>
<div class="row">
    <div class="col-xs-12 col-md-7 col-lg-6">
        <div class="cart-totals">
            <cart:cartTotals cartData="${cartData}" showTax="false"/>
            <cart:ajaxCartTotals/>
        </div>
    </div>



</div>

