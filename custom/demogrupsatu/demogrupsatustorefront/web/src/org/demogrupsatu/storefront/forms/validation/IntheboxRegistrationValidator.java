package org.demogrupsatu.storefront.forms.validation;

import de.hybris.platform.acceleratorstorefrontcommons.constants.WebConstants;
import de.hybris.platform.acceleratorstorefrontcommons.forms.RegisterForm;
import de.hybris.platform.acceleratorstorefrontcommons.forms.validation.RegistrationValidator;
import de.hybris.platform.servicelayer.config.ConfigurationService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import javax.annotation.Resource;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component("intheboxRegistrationValidator")
public class IntheboxRegistrationValidator extends RegistrationValidator implements Validator
{
    @Resource(name = "configurationService")
    private ConfigurationService configurationService;

    @Override
    public boolean supports(final Class<?> aClass)
    {
        return RegisterForm.class.equals(aClass);
    }

    @Override
    public void validate(final Object object, final Errors errors)
    {
        final IntheboxRegisterForm registerForm = (IntheboxRegisterForm) object;
        final String userId = registerForm.getUserId();
        final String titleCode = registerForm.getTitleCode();
        final String firstName = registerForm.getFirstName();
        final String email = registerForm.getEmail();
        final String pwd = registerForm.getPwd();
        final String checkPwd = registerForm.getCheckPwd();
        final boolean termsCheck = registerForm.isTermsCheck();

        validateTitleCode(errors, titleCode);
        validateName(errors, firstName, "firstName", "register.firstName.invalid");
        validateUserId(errors, userId, "userId", "register.userId.invalid");

        if (StringUtils.length(firstName) > 255)
        {
            errors.rejectValue("firstName", "register.name.invalid");
        }

        validateEmail(errors, email);
        validatePassword(errors, pwd);
        comparePasswords(errors, pwd, checkPwd);
        validateTermsAndConditions(errors, termsCheck);
    }

    protected void comparePasswords(final Errors errors, final String pwd, final String checkPwd)
    {
        if (StringUtils.isNotEmpty(pwd) && StringUtils.isNotEmpty(checkPwd) && !StringUtils.equals(pwd, checkPwd))
        {
            errors.rejectValue("checkPwd", "validation.checkPwd.equals");
        }
        else
        {
            if (StringUtils.isEmpty(checkPwd))
            {
                errors.rejectValue("checkPwd", "register.checkPwd.invalid");
            }
        }
    }

    protected void validatePassword(final Errors errors, final String pwd)
    {
        if (StringUtils.isEmpty(pwd))
        {
            errors.rejectValue("pwd", "register.pwd.invalid");
        }
        else if (StringUtils.length(pwd) < 6 || StringUtils.length(pwd) > 255)
        {
            errors.rejectValue("pwd", "register.pwd.invalid");
        }
    }

    protected void validateEmail(final Errors errors, final String email)
    {
        if (StringUtils.isEmpty(email))
        {
            errors.rejectValue("email", "register.email.invalid");
        }
        else if (StringUtils.length(email) > 255 || !validateEmailAddress(email))
        {
            errors.rejectValue("email", "register.email.invalid");
        }
    }

    protected void validateName(final Errors errors, final String name, final String propertyName, final String property)
    {
        if (StringUtils.isBlank(name))
        {
            errors.rejectValue(propertyName, property);
        }
        else if (StringUtils.length(name) > 255)
        {
            errors.rejectValue(propertyName, property);
        }
    }

    protected void validateUserId(final Errors errors, final String userId, final String propertyUserId, final String property)
    {
        if (StringUtils.isBlank(userId))
        {
            errors.rejectValue(propertyUserId, property);
        }
        else if (StringUtils.length(userId) > 255)
        {
            errors.rejectValue(propertyUserId, property);
        }
    }

    protected void validateTitleCode(final Errors errors, final String titleCode)
    {
        if (StringUtils.isNotEmpty(titleCode) && StringUtils.length(titleCode) > 255)
        {
            errors.rejectValue("titleCode", "register.title.invalid");
        }
    }

    protected boolean validateEmailAddress(final String email)
    {
        final Matcher matcher = Pattern.compile(configurationService.getConfiguration().getString(WebConstants.EMAIL_REGEX))
                .matcher(email);
        return matcher.matches();
    }

    protected void validateTermsAndConditions(final Errors errors, final boolean termsCheck)
    {
        if (!termsCheck)
        {
            errors.rejectValue("termsCheck", "register.terms.not.accepted");
        }
    }
}
