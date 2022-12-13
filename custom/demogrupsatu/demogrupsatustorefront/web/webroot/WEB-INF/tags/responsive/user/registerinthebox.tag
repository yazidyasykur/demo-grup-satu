<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%> 
<%@ attribute name="actionNameKey" required="true" type="java.lang.String"%> 
<%@ attribute name="action" required="true" type="java.lang.String"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/responsive/formElement"%> 
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>

<spring:htmlEscape defaultHtmlEscape="true" />

<spring:url value="/login/register/termsandconditions" var="getTermsAndConditionsUrl"/>
<c:url value="/login" var="loginUrl" />
<c:url value="/register/newcustomer" var="submitAction" />
<section class="loginregister-page">
  <div class="background-login">
    <div class="login-wrapper">
      <div class="login-container">
        <div class="login-logo">
          <a href="https://inthebox.net">
            <img
              src="https://inthebox.net/images/logo-inthebox-440x80.png"
              style="max-width: 300px"
            />
          </a>
        </div>
        <div class="login-signin">
          <div class="login-head">
            <h3 class="login-title">Daftar Sekarang</h3>
            <h6 class="login-desc">
              Masukkan detail Anda untuk menciptakan akun:
            </h6>
          </div>
          <form:form
            class="form"
            method="post"
            action="${submitAction}"
            modelAttribute="intheboxRegisterForm"
          >
            <div class="form-group">
              <formElement:formInputLoginInthebox
                idKey="userId"
                labelKey="user Id"
                path="userId"
                inputCSS="form-control"
                placeholder="User Id"
                mandatory="true"
              />
            </div>
            <div class="form-group">
              <formElement:formInputLoginInthebox
                idKey="register.firstName"
                labelKey="register.firstName"
                path="firstName"
                inputCSS="form-control"
                placeholder="Nama"
                mandatory="true"
              />
            </div>
            <div class="form-group">
              <formElement:formInputLoginInthebox
                idKey="register.email"
                labelKey="register.email"
                path="email"
                inputCSS="form-control"
                placeholder="Alamat Email"
                mandatory="true"
              />
            </div>
            <div class="form-group">
              <formElement:formPasswordInthebox
                idKey="password"
                labelKey="register.pwd"
                path="pwd"
                placeholder="Password"
                inputCSS="form-control"
                mandatory="true"
              />
            </div>
            <div class="form-group">
              <formElement:formPasswordInthebox
                idKey="register.checkPwd"
                labelKey="register.checkPwd"
                path="checkPwd"
                placeholder="Konfirmasi Password"
                inputCSS="form-control"
                mandatory="true"
              />
            </div>
            <div class="row login-extra">
              <template:errorSpanField path="termsCheck">
                <div class="col">
                  <label class="checkbox">
                    <form:checkbox
                      id="chk-terms"
                      required="true"
                      name="accept-terms"
                      path="termsCheck"
                    />
                    Saya menyetujui Syarat & Ketentuan .
                    <span></span>
                  </label>
                </div>
              </template:errorSpanField>
            </div>
            <div class="login-actions">
              <button class="login-btn-primary">Daftar</button>
            </div>
          </form:form>
          <div class="or-text">or</div>
          <a href="https://inthebox.net/auth/facebook">
            <button class="login-btn-facebook">Masuk dengan Facebook</button>
          </a>
        </div>
        <div class="login-account">
          <span class="login-account-msg"> Sudah memiliki akun ? </span>
          &nbsp;&nbsp;
          <a
            href="${fn:escapeXml(loginUrl)}"
            class="login-account-link evt-click-links-register"
          >
            Masuk
          </a>
        </div>
      </div>
    </div>
  </div>
</section>
