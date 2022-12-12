package org.demogrupsatu.storefront.forms.validation;

import de.hybris.platform.acceleratorstorefrontcommons.forms.RegisterForm;

public class IntheboxRegisterForm extends RegisterForm {
    private String userId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
