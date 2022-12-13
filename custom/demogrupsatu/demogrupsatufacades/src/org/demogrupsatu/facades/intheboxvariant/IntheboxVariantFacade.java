package org.demogrupsatu.facades.intheboxvariant;

import org.demogrupsatu.facades.intheboxvariantproduct.IntheboxVariantPoductData;

import java.util.List;

public interface IntheboxVariantFacade {
    List<IntheboxVariantPoductData> getVariantByProductCode(String code);
}
