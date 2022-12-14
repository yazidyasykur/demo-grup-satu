package org.demogrupsatu.facades.product;

import de.hybris.platform.acceleratorfacades.productcarousel.impl.DefaultProductCarouselFacade;
import de.hybris.platform.commercefacades.product.ProductOption;

import java.util.Arrays;
import java.util.List;

public class DefaultProductFacade extends DefaultProductCarouselFacade {
    protected static final List<ProductOption> PRODUCT_OPTIONS = Arrays.asList(ProductOption.BASIC, ProductOption.PRICE, ProductOption.DESCRIPTION);
}
