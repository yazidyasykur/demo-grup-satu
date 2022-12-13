package org.demogrupsatu.facades.intheboxvariant.impl;

import de.hybris.platform.servicelayer.dto.converter.Converter;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.intheboxvariant.IntheboxVariantService;
import org.demogrupsatu.core.model.IntheboxSizeVariantProductModel;
import org.demogrupsatu.facades.intheboxvariant.IntheboxVariantFacade;
import org.demogrupsatu.facades.intheboxvariantproduct.IntheboxVariantPoductData;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

public class DefaultIntheboxVariantFacade implements IntheboxVariantFacade {

    @Resource(name = "defaultIntheboxVariantService")
    IntheboxVariantService defaultIntheboxVariantService;
    @Resource(name = "intheboxVariantDataConverter")
    private Converter<IntheboxSizeVariantProductModel, IntheboxVariantPoductData> intheboxVariantDataConverter;

    @Override
    public List<IntheboxVariantPoductData> getVariantByProductCode(String code) {
        List<IntheboxSizeVariantProductModel> intheboxSizeVariantProductModels = defaultIntheboxVariantService.getVariantByProductCode(code);
        if (CollectionUtils.isNotEmpty(intheboxSizeVariantProductModels)){
            return  intheboxVariantDataConverter.convertAll(intheboxSizeVariantProductModels);
        }
        return Collections.emptyList();
    }
}
