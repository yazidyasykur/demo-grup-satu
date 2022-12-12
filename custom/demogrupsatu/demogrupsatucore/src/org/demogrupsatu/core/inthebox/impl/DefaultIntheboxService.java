package org.demogrupsatu.core.inthebox.impl;

import org.demogrupsatu.core.inthebox.IntheboxService;
import org.demogrupsatu.core.inthebox.dao.IntheboxDao;
import org.demogrupsatu.core.model.IntheboxProductModel;

import javax.annotation.Resource;
import java.util.List;

public class DefaultIntheboxService implements IntheboxService {
    @Resource(name = "intheboxDao")
    private IntheboxDao intheboxDao;

    @Override
    public List<IntheboxProductModel> getProductByVariant(String code) {
        return intheboxDao.getProductByVariant(code);
    }
}
