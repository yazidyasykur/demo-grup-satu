package org.demogrupsatu.core.intheboxvariant.impl;

import de.hybris.platform.core.model.product.ProductModel;
import org.demogrupsatu.core.intheboxvariant.IntheboxVariantService;
import org.demogrupsatu.core.intheboxvariant.dao.IntheboxVariantDao;
import org.demogrupsatu.core.model.IntheboxProductModel;
import org.demogrupsatu.core.model.IntheboxSizeVariantProductModel;

import javax.annotation.Resource;
import java.util.List;

public class DefaultIntheboxVariantService implements IntheboxVariantService {
    @Resource(name = "intheboxVariantDao")
    private IntheboxVariantDao intheboxVariantDao;

    @Override
    public List<IntheboxSizeVariantProductModel> getVariantByProductCode(String code) {
        return intheboxVariantDao.getVariantByProductCode(code);
    }

    @Override
    public List<ProductModel> getAllProduct() {
        return intheboxVariantDao.getAllProduct();
    }
}
