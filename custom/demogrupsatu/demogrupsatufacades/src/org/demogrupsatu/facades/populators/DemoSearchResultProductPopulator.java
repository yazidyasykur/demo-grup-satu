package org.demogrupsatu.facades.populators;

import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.commercefacades.search.converters.populator.SearchResultProductPopulator;
import de.hybris.platform.commerceservices.search.resultdata.SearchResultValueData;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;


public class DemoSearchResultProductPopulator extends SearchResultProductPopulator {
    @Override
    public void populate(final SearchResultValueData source, final ProductData target) throws ConversionException {
       target.setSize(this.<String>getValue(source,"size"));
       target.setDimension(this.<String>getValue(source,"dimension"));
       target.setHeight(this.<String>getValue(source,"height"));
    }
}
