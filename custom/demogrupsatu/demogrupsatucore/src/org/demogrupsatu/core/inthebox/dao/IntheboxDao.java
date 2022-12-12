package org.demogrupsatu.core.inthebox.dao;

import org.demogrupsatu.core.model.IntheboxProductModel;

import java.util.List;

public interface IntheboxDao {
    List<IntheboxProductModel> getProductByVariant(String code);
}
