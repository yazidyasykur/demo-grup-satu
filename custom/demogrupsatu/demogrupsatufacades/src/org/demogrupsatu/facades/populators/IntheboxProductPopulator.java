package org.demogrupsatu.facades.populators;

import de.hybris.platform.commercefacades.product.PriceDataFactory;
import de.hybris.platform.commercefacades.product.data.ImageData;
import de.hybris.platform.commercefacades.product.data.PriceData;
import de.hybris.platform.commercefacades.product.data.PriceDataType;
import de.hybris.platform.commerceservices.price.CommercePriceService;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.core.model.media.MediaModel;
import de.hybris.platform.jalo.order.price.PriceInformation;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.model.IntheboxProductModel;
import org.demogrupsatu.core.model.SizeModel;
import org.demogrupsatu.facades.intheboxproduct.IntheboxProductData;

import javax.annotation.Resource;
import java.math.BigDecimal;

public class IntheboxProductPopulator implements Populator<IntheboxProductModel, IntheboxProductData> {
    @Resource
    private CommercePriceService commercePriceService;

    @Resource
    private PriceDataFactory priceDataFactory;

    @Override
    public void populate(IntheboxProductModel source, IntheboxProductData target  ) throws ConversionException {
        target.setCode(source.getCode());
        target.setName(source.getName());
        target.setDescription(source.getDescription());

        MediaModel image = source.getPicture();
        if (image!=null){
            final ImageData img = new ImageData();
            img.setFormat(image.getMime());
            img.setUrl(image.getURL());
            target.setPicture(img.getUrl());
        }

        final PriceDataType priceDataType;
        final PriceInformation priceInformation;

        if (CollectionUtils.isEmpty(source.getVariants())){
            priceDataType = PriceDataType.BUY;
            priceInformation = commercePriceService.getWebPriceForProduct(source);
        } else {
            priceDataType = PriceDataType.FROM;
            priceInformation = commercePriceService.getFromPriceForProduct(source);
        }

        if (priceInformation !=null){
            final PriceData priceData = priceDataFactory.create(priceDataType, BigDecimal.valueOf(priceInformation.getPriceValue().getValue()),priceInformation.getPriceValue().getCurrencyIso());
            target.setHarga(priceData);
        }
    }
}
