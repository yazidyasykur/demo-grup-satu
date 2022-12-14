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
            <h3 class="login-title">
              <spring:theme code="login.title" />
            </h3>
          </div>
		    <form:form class="form" method="POST" action="${action}" modelAttribute="loginForm">
        <div class="form-group email">
			    <form:input class="form-control" required="true" placeholder="Email Address" path="j_username"/>
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
                  <spring:theme code="login.checkbox.rememberMe" />
                  <span></span>
                </label>
                <a
                  href="https://inthebox.net/id/password/reset"
                  class="login-link"
                >
                  <spring:theme code="login.link.forgottenPwd" />
                </a>
              </div>
              <div class="col align-right"></div>
            </div>
            <div class="login-actions">
              <button class="login-btn-primary" type="submit"><spring:theme code="login.button.login" /></button>
            </div>
		  </form:form>
          <div class="or-text"><spring:theme code="login.text.or" /></div>
          <a href="https://inthebox.net/auth/facebook">
            <button class="login-btn-facebook"><spring:theme code="login.button.fb" /></button>
          </a>
        </div>
        <div class="login-account">
          <span class="login-account-msg"><spring:theme code="login.text.donthaveaccount" /></span>
          <ycommerce:testId code="header_Register_link">
            <a
              href="${fn:escapeXml(registerUrl)}"
              class="login-account-link evt-click-links-register"
            >
            <spring:theme code="login.link.registerNow" />
            </a>
          </ycommerce:testId>
        </div>
      </div>
    </div>
  </div>

