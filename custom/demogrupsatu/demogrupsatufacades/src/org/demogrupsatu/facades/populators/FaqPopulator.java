package org.demogrupsatu.facades.populators;

import de.hybris.platform.converters.Populator;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import org.demogrupsatu.core.model.FAQModel;
import org.demogrupsatu.facades.faq.FaqData;

public class FaqPopulator implements Populator<FAQModel, FaqData> {
    @Override
    public void populate(FAQModel source, FaqData target) throws ConversionException {
        target.setQuestion(source.getQuestion());
        target.setAnswer(source.getAnswer());
    }
}
