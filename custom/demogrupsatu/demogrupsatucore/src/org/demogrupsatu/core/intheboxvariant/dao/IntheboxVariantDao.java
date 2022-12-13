package org.demogrupsatu.core.intheboxvariant.dao;

import org.demogrupsatu.core.model.IntheboxSizeVariantProductModel;

import java.util.List;

public interface IntheboxVariantDao {
    List<IntheboxSizeVariantProductModel> getVariantByProductCode(String code);
}
