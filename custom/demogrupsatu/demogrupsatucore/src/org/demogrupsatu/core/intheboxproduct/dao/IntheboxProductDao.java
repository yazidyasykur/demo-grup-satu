package org.demogrupsatu.core.intheboxproduct.dao;

import org.demogrupsatu.core.model.IntheboxProductModel;

import java.util.List;

public interface IntheboxProductDao {

    List<IntheboxProductModel> getAllIntheboxProduct();
    List<IntheboxProductModel> getProductByVariant(String code);
}
