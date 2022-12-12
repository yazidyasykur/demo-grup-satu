package org.demogrupsatu.facades.inthebox.impl;

import de.hybris.platform.servicelayer.dto.converter.Converter;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.inthebox.IntheboxService;
import org.demogrupsatu.core.model.IntheboxProductModel;
import org.demogrupsatu.facades.inthebox.IntheboxFacade;
import org.demogrupsatu.facades.inthebox.data.IntheboxData;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

public class DefaultIntheboxFacade implements IntheboxFacade {
    @Resource(name = "defaultIntheboxService")
    IntheboxService defaultIntheboxService;

    @Resource(name = "intheboxDataConverter")
    private Converter<IntheboxProductModel,IntheboxData> intheboxDataConverter;

    @Override
    public List<IntheboxData> getProductByVariant(String code) {
        List<IntheboxProductModel> intheboxProductModels = defaultIntheboxService.getProductByVariant(code);
        if (CollectionUtils.isNotEmpty(intheboxProductModels)){
            return intheboxDataConverter.convertAll(intheboxProductModels);
        }
        return Collections.emptyList();
    }
}
