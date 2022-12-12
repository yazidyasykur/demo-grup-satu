<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="storepickup" tagdir="/WEB-INF/tags/responsive/storepickup" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<h1 class="tengah">PILIHAN PRODUCT INTHEBOX</h1>

<c:forEach items="${intheboxproductList}" var="intheboxproduct">
     <div class="mainflow">
      <div class="flowrow">
      
         <div class="flowrowblock">
            <h2>${intheboxproduct.name}
                </br>
                </br>
                <p class="kecil">${intheboxproduct.description}</p>
            </h2>
         </div>


        <c:forEach items="${searchPageData.results}" var="product" varStatus="status">
            <product:productListerItem product="${product}" inthebox="${intheboxproduct}"/>
        </c:forEach>
        </div>
    </div>
</c:forEach>



<storepickup:pickupStorePopup/>