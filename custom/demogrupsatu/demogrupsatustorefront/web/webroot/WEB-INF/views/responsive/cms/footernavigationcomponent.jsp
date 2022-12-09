<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${component.visible}">
	<div class="container-fluid footer">
	    <div class="footer__top container-part-footer">
	        <div class="row">
	            <div class="col-xs-12 col-sm-12">
	                <div class="flex-display flex-row-display">
	                    <div class="left-most-part">
                            <cms:pageSlot position="SiteLogo" var="logo" limit="1">
                                <cms:component component="${logo}" element="div" class="image-resize"/>
                            </cms:pageSlot>
                            <div>
                                <input type="text" name="email" placeholder="Masukkan Alamat Email" class="input-email" />
                                <button class="button">Submit</button>
                            </div>
                            <div class="icon-box">
                                <a href="https://www.facebook.com"><i class="fa-brands fa-facebook large-icon"></i></a>
                                <a href="https://www.instagram.com"><i class="fa-brands fa-instagram large-icon"></i></a>
                                <a href="https://www.gmail.com"><i class="fa-regular fa-envelope large-icon"></i></a>
                            </div>
                        </div>
	                	<c:forEach items="${component.navigationNode.children}" var="childLevel1">
		                	<c:forEach items="${childLevel1.children}" step="${component.wrapAfter}" varStatus="i">
							   <div class="footer__nav--container">
		                	       <c:if test="${component.wrapAfter > i.index}">
	                                   <div class="title text-weight-bold title-color">${fn:escapeXml(childLevel1.title)}</div>
	                               </c:if>
	                               <ul class="footer__nav--links link-hover">
	                                   <c:forEach items="${childLevel1.children}" var="childLevel2" begin="${i.index}" end="${i.index + component.wrapAfter - 1}">
	                                        <c:forEach items="${childLevel2.entries}" var="childlink" >
		                                        <cms:component component="${childlink.item}" evaluateRestriction="true" element="li" class="footer__link "/>
	                                        </c:forEach>
	                                   </c:forEach>
	                               </ul>
	                		   </div>
						    </c:forEach>
	                	</c:forEach>
	               </div>
	           </div>
	        </div>
	    </div>
	</div>

	<div class="footer__bottom copyright-part">
	    <div class="footer__copyright copyright-part flex-display flex-row-display container-part-footer text-weight-bold">
	        <div class="flex-display align-center">
                <div class="small-part-right-margin">
                    <img src="https://inthebox.net/images/layout-v2/footer-icon-call.png" class="mr-2" />
                    (021) 30306286
                </div>
                <div>
                    <img src="https://inthebox.net/images/layout-v2/footer-icon-message.png" class="mr-2" />
                    +62 819 234 659
                </div>
            </div>
	        <p>${fn:escapeXml(notice)}</p>
	    </div>
	</div>
</c:if>