package org.demogrupsatu.core.intheboxvariant.dao;

import de.hybris.platform.core.model.product.ProductModel;
import org.demogrupsatu.core.model.IntheboxSizeVariantProductModel;

import java.util.List;

public interface IntheboxVariantDao {
    List<IntheboxSizeVariantProductModel> getVariantByProductCode(String code);
    List<ProductModel> getAllProduct();
}
