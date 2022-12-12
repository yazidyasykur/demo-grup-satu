package org.demogrupsatu.core.intheboxproduct.impl;

import org.demogrupsatu.core.model.IntheboxProductModel;
import org.demogrupsatu.core.intheboxproduct.IntheboxProductService;
import org.demogrupsatu.core.intheboxproduct.dao.IntheboxProductDao;

import javax.annotation.Resource;
import java.util.List;

public class DefaultIntheboxProductService implements IntheboxProductService {

    @Resource(name = "intheboxproductDao")
    private IntheboxProductDao intheboxproductDao;

    @Override
    public List<IntheboxProductModel> getAllIntheboxProduct() {
        return intheboxproductDao.getAllIntheboxProduct();
    }

    public List<IntheboxProductModel> getProductByVariant(String code) {return intheboxproductDao.getProductByVariant(code);}
}
