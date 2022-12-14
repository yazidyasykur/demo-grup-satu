package org.demogrupsatu.facades.faq.impl;

import de.hybris.platform.servicelayer.dto.converter.Converter;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.faq.FaqService;
import org.demogrupsatu.core.model.FAQModel;
import org.demogrupsatu.facades.faq.FaqData;
import org.demogrupsatu.facades.faq.FaqFacade;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

public class DefaultFaqFacade implements FaqFacade {

    @Resource(name="faqService")
    private FaqService faqService;

    @Resource(name="faqConverter")
    private Converter<FAQModel,FaqData> faqConverter;

    @Override
    public List<FaqData> getAllFaq() {
        List<FAQModel> faqModels = faqService.getAllFaq();
        if(CollectionUtils.isNotEmpty(faqModels)){
            return faqConverter.convertAll(faqModels);
        }
        return Collections.emptyList();
    }
}
