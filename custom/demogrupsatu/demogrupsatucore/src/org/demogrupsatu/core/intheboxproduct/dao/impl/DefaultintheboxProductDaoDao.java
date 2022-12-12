package org.demogrupsatu.core.intheboxproduct.dao.impl;

import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;

import de.hybris.platform.servicelayer.search.FlexibleSearchService;
import de.hybris.platform.servicelayer.search.SearchResult;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.model.IntheboxProductModel;
import org.demogrupsatu.core.intheboxproduct.dao.IntheboxProductDao;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

public class DefaultintheboxProductDaoDao implements IntheboxProductDao {
    @Resource(name = "flexibleSearchService")
    private FlexibleSearchService flexibleSearchService;


    @Override
    public List<IntheboxProductModel> getAllIntheboxProduct() {
        final String query = "SELECT {pk} FROM {IntheboxProduct}";
        final FlexibleSearchQuery flexibleSearchQuery = new FlexibleSearchQuery(query);
        final SearchResult<IntheboxProductModel> searchResult = flexibleSearchService.search(flexibleSearchQuery);
        List<IntheboxProductModel> intheboxProductModel = searchResult.getResult();
        if(CollectionUtils.isNotEmpty(intheboxProductModel)){
            return intheboxProductModel;
        }
        return Collections.emptyList();
    }
}
