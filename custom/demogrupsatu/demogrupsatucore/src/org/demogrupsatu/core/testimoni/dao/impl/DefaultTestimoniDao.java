package org.demogrupsatu.core.testimoni.dao.impl;

import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;
import de.hybris.platform.servicelayer.search.FlexibleSearchService;
import de.hybris.platform.servicelayer.search.SearchResult;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.model.TestimoniModel;
import org.demogrupsatu.core.testimoni.dao.TestimoniDao;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

public class DefaultTestimoniDao implements TestimoniDao {

    private static final String ALL_TESTIMONI = "SELECT {PK} FROM {Testimoni}";

    @Resource(name = "flexibleSearchService")
    private FlexibleSearchService flexibleSearchService;

    @Override
    public List<TestimoniModel> getAllTestimoni() {
        final String query = ALL_TESTIMONI;
        final FlexibleSearchQuery searchQuery = new FlexibleSearchQuery(query);
        final SearchResult<TestimoniModel> searchResult = flexibleSearchService.search(searchQuery);
        final List<TestimoniModel> result = searchResult.getResult();
        if(CollectionUtils.isNotEmpty(result)) {
            return result;
        }
        return Collections.emptyList();
    }
}
