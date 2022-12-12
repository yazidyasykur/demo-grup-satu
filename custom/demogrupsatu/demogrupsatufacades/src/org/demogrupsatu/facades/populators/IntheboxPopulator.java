package org.demogrupsatu.facades.populators;

import de.hybris.platform.converters.Populator;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import de.hybris.platform.servicelayer.dto.converter.Converter;
import de.hybris.platform.variants.model.VariantProductModel;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.model.IntheboxProductModel;
import org.demogrupsatu.facades.inthebox.data.IntheboxData;
import org.demogrupsatu.facades.intheboxVariant.data.IntheboxVariantData;

import javax.annotation.Resource;

public class IntheboxPopulator implements Populator<IntheboxProductModel, IntheboxData> {
    @Resource(name = "intheboxVariantDataConverter")
    private Converter<VariantProductModel, IntheboxVariantData> intheboxVariantDataConverter;

    @Override
    public void populate(IntheboxProductModel source, IntheboxData target) throws ConversionException {
        target.setCode(source.getCode());
        if (CollectionUtils.isNotEmpty(source.getVariants())){
            target.setVariant(intheboxVariantDataConverter.convertAll(source.getVariants()));
        }
    }
}
