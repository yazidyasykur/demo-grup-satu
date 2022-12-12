package org.demogrupsatu.facades.populators;

import de.hybris.platform.converters.Populator;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import org.demogrupsatu.core.model.IntheboxProductModel;
import org.demogrupsatu.core.model.SizeModel;
import org.demogrupsatu.facades.intheboxproduct.IntheboxProductData;

public class IntheboxProductPopulator implements Populator<IntheboxProductModel, IntheboxProductData> {
    @Override
    public void populate(IntheboxProductModel source, IntheboxProductData target  ) throws ConversionException {
        target.setCode(source.getCode());
        target.setName(source.getName());
        target.setDescription(source.getDescription());
    }
}
