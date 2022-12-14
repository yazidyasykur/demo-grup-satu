package org.demogrupsatu.core.intheboxvariant;

import de.hybris.platform.core.model.product.ProductModel;
import org.demogrupsatu.core.model.IntheboxProductModel;
import org.demogrupsatu.core.model.IntheboxSizeVariantProductModel;

import java.util.List;

public interface IntheboxVariantService {
    List<IntheboxSizeVariantProductModel> getVariantByProductCode(String code);
    List<ProductModel> getAllProduct();
}
