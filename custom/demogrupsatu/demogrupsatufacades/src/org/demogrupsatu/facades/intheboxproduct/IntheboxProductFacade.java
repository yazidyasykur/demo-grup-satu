package org.demogrupsatu.facades.intheboxproduct;


import org.demogrupsatu.core.model.IntheboxProductModel;

import java.util.List;

public interface IntheboxProductFacade {
    List<IntheboxProductData> getAllIntheboxProduct();
    List<IntheboxProductData> getProductByVariant(String code);
}
