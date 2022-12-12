package org.demogrupsatu.core.inthebox.dao.impl;

import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;
import de.hybris.platform.servicelayer.search.FlexibleSearchService;
import de.hybris.platform.servicelayer.search.SearchResult;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.inthebox.dao.IntheboxDao;
import org.demogrupsatu.core.model.IntheboxProductModel;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

public class DefaultIntheboxDao implements IntheboxDao {
    @Resource(name = "flexibleSearchService")
    private FlexibleSearchService flexibleSearchService;

    @Override
    public List<IntheboxProductModel> getProductByVariant(String code) {
        final String query = "select * from {IntheboxSizeVariantProduct"
                +" as v join IntheboxProduct as p on "
                +"{v.baseproduct}={p.pk}} "
                +"where {p.code} = '?code'";
        final FlexibleSearchQuery flexibleSearchQuery = new FlexibleSearchQuery(query);
        final SearchResult<IntheboxProductModel> searchResult = flexibleSearchService.search(flexibleSearchQuery);
        List<IntheboxProductModel> intheboxProductModels = searchResult.getResult();

        if (CollectionUtils.isNotEmpty(intheboxProductModels)){
            return intheboxProductModels;
        }
        return Collections.emptyList();
    }
}
