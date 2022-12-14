<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<section class="section4">

      <div class="faq-container">
      <h2 class="faq-head">Pertanyaan yang Sering Ditanyakan</h2>
        <c:forEach items="${faqs}" var="faq">
            <div class="faq-question">
                <span>+</span> ${faq.question}
                <p class="faq-answer">${faq.answer}</p>
            </div>
        </c:forEach>
      </div>

    </section>