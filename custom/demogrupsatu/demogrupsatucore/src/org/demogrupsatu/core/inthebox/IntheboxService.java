package org.demogrupsatu.core.inthebox;

import org.demogrupsatu.core.model.IntheboxProductModel;

import java.util.List;

public interface IntheboxService {
    List<IntheboxProductModel> getProductByVariant(String code);
}
