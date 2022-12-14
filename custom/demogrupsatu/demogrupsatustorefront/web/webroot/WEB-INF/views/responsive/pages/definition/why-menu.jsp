<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="def-item-container">
    <div class="def-detail-container">
            <img src="${fn:escapeXml(commonResourcePath)}/images/about-what.png"/>
            <p class="def-ref-text">Apa itu kasur INTHEBOX?</p>
            <a href="apa-itu-kasur-inthebox"><button class="more-btn">Selengkapnya</button></a>
        </div>

        <div class="def-detail-container">
                    <img src="${fn:escapeXml(commonResourcePath)}/images/about-how.png"/>
                    <p class="def-ref-text">Cara beli kasur INTHEBOX</p>
                    <a href="cara-beli-inthebox"><button class="more-btn">Selengkapnya</button></a>
                </div>

        <div class="def-detail-container">
            <img src="${fn:escapeXml(commonResourcePath)}/images/about-about.png"/>
            <p class="def-ref-text">Tentang INTHEBOX</p>
            <a href="about"><button class="more-btn">Selengkapnya</button></a>
        </div>
</div>