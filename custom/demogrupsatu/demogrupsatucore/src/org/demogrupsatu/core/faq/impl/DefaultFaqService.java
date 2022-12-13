package org.demogrupsatu.core.faq.impl;

import org.demogrupsatu.core.faq.FaqService;
import org.demogrupsatu.core.faq.dao.FaqDao;
import org.demogrupsatu.core.model.FAQModel;

import javax.annotation.Resource;
import java.util.List;

public class DefaultFaqService implements FaqService {

    @Resource(name="faqDao")
    private FaqDao faqDao;

    @Override
    public List<FAQModel> getAllFaq() {
        return faqDao.getAllFaq();
    }
}
