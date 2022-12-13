package org.demogrupsatu.core.intheboxproduct;

import org.demogrupsatu.core.model.IntheboxProductModel;

import java.util.List;

public interface IntheboxProductService {
    List<IntheboxProductModel> getAllIntheboxProduct();
    List<IntheboxProductModel> getProductByVariant(String code);
}
