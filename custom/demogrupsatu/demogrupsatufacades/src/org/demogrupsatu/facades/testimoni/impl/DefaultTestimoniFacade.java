package org.demogrupsatu.facades.testimoni.impl;

import de.hybris.platform.servicelayer.dto.converter.Converter;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.model.TestimoniModel;
import org.demogrupsatu.core.testimoni.TestimoniService;
import org.demogrupsatu.facades.testimoni.TestimoniData;
import org.demogrupsatu.facades.testimoni.TestimoniFacade;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

public class DefaultTestimoniFacade implements TestimoniFacade {

    @Resource(name = "testimoniConverter")
    private Converter<TestimoniModel, TestimoniData> testimoniConverter;

    @Resource(name = "testimoniService")
    private TestimoniService testimoniService;

    @Override
    public List<TestimoniData> getAllTestimoni() {
        List<TestimoniModel> testimoniModels = testimoniService.getAllTestimoni();
        if(CollectionUtils.isNotEmpty(testimoniModels)) {
            return testimoniConverter.convertAll(testimoniModels);
        }
        return Collections.emptyList();
    }
}
