package org.demogrupsatu.core.faq.dao.impl;

import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;
import de.hybris.platform.servicelayer.search.FlexibleSearchService;
import de.hybris.platform.servicelayer.search.SearchResult;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.faq.dao.FaqDao;
import org.demogrupsatu.core.model.FAQModel;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

public class DefaultFaqDao implements FaqDao {

    private static final String ALL_FAQ = "SELECT {PK} FROM {FAQ}";

    @Resource(name = "flexibleSearchService")
    private FlexibleSearchService flexibleSearchService;

    @Override
    public List<FAQModel> getAllFaq() {
        final String query = ALL_FAQ;
        final FlexibleSearchQuery searchQuery = new FlexibleSearchQuery(query);
        final SearchResult<FAQModel> searchResult = flexibleSearchService.search(searchQuery);
        final List<FAQModel> result = searchResult.getResult();
        if(CollectionUtils.isNotEmpty(result)) {
            return result;
        }
        return Collections.emptyList();
    }
}
