<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%> 
<%@ attribute name="actionNameKey" required="true" type="java.lang.String"%> 
<%@ attribute name="action" required="true" type="java.lang.String"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/responsive/formElement"%> 
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<spring:htmlEscape defaultHtmlEscape="true" />
<c:url value="/register" var="registerUrl" />
<c:url value="/" var="home" />

  <div class="background-login">
    <div class="login-wrapper">
      <div class="login-container">
        <div class="login-logo">
          <a href="${fn:escapeXml(home)}">
            <img
              src="https://inthebox.net/images/logo-inthebox-440x80.png"
              style="max-width: 300px"
            />
          </a>
        </div>
        <div class="login-signin">
          <div class="login-head">
            <h3 class="login-title">Masuk</h3>
          </div>
		    <form:form class="form" method="POST" action="${action}" modelAttribute="loginForm">
        <div class="form-group email">
			    <form:input class="form-control" required="true" placeholder="Alamat Email" path="j_username"/>
        </div>
            <div class="form-group password">
			          <form:input class="form-control" type="password" required="true" autocomplete="off" placeholder="Password" path="j_password"/>
            </div>
            <div class="row login-extra">
              <div class="col">
                <label class="checkbox">
                  <input
                    type="checkbox"
                    name="remember"
                    class="checkbox-icon"
                  />
                  Ingat Saya
                  <span></span>
                </label>
                <a
                  href="https://inthebox.net/id/password/reset"
                  class="login-link"
                >
                  Lupa Kata Sandi?
                </a>
              </div>
              <div class="col align-right"></div>
            </div>
            <div class="login-actions">
              <button class="login-btn-primary" type="submit">Masuk</button>
            </div>
		  </form:form>
          <div class="or-text">or</div>
          <a href="https://inthebox.net/auth/facebook">
            <button class="login-btn-facebook">Masuk dengan Facebook</button>
          </a>
        </div>
        <div class="login-account">
          <span class="login-account-msg"> Belum memiliki akun? </span>
          <ycommerce:testId code="header_Register_link">
            <a
              href="${fn:escapeXml(registerUrl)}"
              class="login-account-link evt-click-links-register"
            >
              Daftar Sekarang
            </a>
          </ycommerce:testId>
        </div>
      </div>
    </div>
  </div>

