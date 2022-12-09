package org.demogrupsatu.core.testimoni.impl;

import org.demogrupsatu.core.model.TestimoniModel;
import org.demogrupsatu.core.testimoni.TestimoniService;
import org.demogrupsatu.core.testimoni.dao.TestimoniDao;

import javax.annotation.Resource;
import java.util.List;

public class DefaultTestimoniService implements TestimoniService {

    @Resource(name = "testimoniDao")
    private TestimoniDao testimoniDao;

    @Override
    public List<TestimoniModel> getAllTestimoni() {
        return testimoniDao.getAllTestimoni();
    }
}
