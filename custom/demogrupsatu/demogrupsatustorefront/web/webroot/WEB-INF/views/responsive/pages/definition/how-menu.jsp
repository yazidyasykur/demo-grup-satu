<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="def-item-container">
    <div class="def-detail-container">
        <img src="${fn:escapeXml(commonResourcePath)}/images/about-what.png"/>
        <p class="def-ref-text">Apa itu kasur inthebox?</p>
        <a href="apa-itu-kasur-inthebox"><button class="more-btn">Selengkapnya</button></a>
    </div>

    <div class="def-detail-container">
        <img class="def-btn" src="${fn:escapeXml(commonResourcePath)}/images/about-why.png"/>
        <p class="def-ref-text">Kenapa harus pilih Inthebox?</p>
        <a href="alasan-pilih-kasur-inthebox"><button class="more-btn">Selengkapnya</button></a>
    </div>

    <div class="def-detail-container">
        <img src="${fn:escapeXml(commonResourcePath)}/images/about-about.png"/>
        <p class="def-ref-text">Tentang Inthebox</p>
        <a href="about"><button class="more-btn">Selengkapnya</button></a>
    </div>
</div>