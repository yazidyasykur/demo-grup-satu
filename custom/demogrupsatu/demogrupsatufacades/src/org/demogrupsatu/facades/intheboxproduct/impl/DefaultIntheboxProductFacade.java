package org.demogrupsatu.facades.intheboxproduct.impl;


import de.hybris.platform.servicelayer.dto.converter.Converter;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.model.IntheboxProductModel;
import org.demogrupsatu.core.intheboxproduct.IntheboxProductService;
import org.demogrupsatu.facades.intheboxproduct.IntheboxProductData;
import org.demogrupsatu.facades.intheboxproduct.IntheboxProductFacade;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

public class DefaultIntheboxProductFacade implements IntheboxProductFacade {

    @Resource(name="defaultIntheboxProductService")
    IntheboxProductService defaultIntheboxProductService;

    @Resource(name = "intheboxproductDataConverter")
    private Converter<IntheboxProductModel, IntheboxProductData> intheboxproductDataConverter;

    @Override
    public List<IntheboxProductData> getAllIntheboxProduct() {
        List<IntheboxProductModel> intheboxProductModels = defaultIntheboxProductService.getAllIntheboxProduct();
        if (CollectionUtils.isNotEmpty(intheboxProductModels)){
            return intheboxproductDataConverter.convertAll(intheboxProductModels);
        }
        return Collections.emptyList();
    }

    @Override
    public List<IntheboxProductData> getProductByVariant(String code) {
        List<IntheboxProductModel> intheboxProductModels = defaultIntheboxProductService.getProductByVariant(code);
        if (CollectionUtils.isNotEmpty(intheboxProductModels)){
            return intheboxproductDataConverter.convertAll(intheboxProductModels);
        }
        return Collections.emptyList();
    }
}
