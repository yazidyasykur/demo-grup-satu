<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url value="/INTHEBOX/c/INTHEBOX" var="product" />

 <div class="tengah">
        <h4>Belum ada barang dalam keranjang belanja Anda</h4>
        <p>Lihat <a href="${fn:escapeXml(product)}">Produk</a> untuk mulai berbelanja.</p>
</div>