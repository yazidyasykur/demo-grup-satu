package org.demogrupsatu.core.intheboxvariant.dao.impl;

import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;
import de.hybris.platform.servicelayer.search.FlexibleSearchService;
import de.hybris.platform.servicelayer.search.SearchResult;
import org.apache.commons.collections.CollectionUtils;
import org.demogrupsatu.core.intheboxvariant.dao.IntheboxVariantDao;
import org.demogrupsatu.core.model.IntheboxProductModel;
import org.demogrupsatu.core.model.IntheboxSizeVariantProductModel;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

public class DefaultIntheboxVariantDao implements IntheboxVariantDao {
    @Resource(name = "flexibleSearchService")
    private FlexibleSearchService flexibleSearchService;

    @Override
    public List<IntheboxSizeVariantProductModel> getVariantByProductCode(String code) {
        final String query = "select {pk} from {IntheboxSizeVariantProduct} where {code} like concat(substring(?code,1,11),'%')";
        final FlexibleSearchQuery flexibleSearchQuery = new FlexibleSearchQuery(query);
        flexibleSearchQuery.addQueryParameter("code",code);
        final SearchResult<IntheboxSizeVariantProductModel> searchResult = flexibleSearchService.search(flexibleSearchQuery);
        List<IntheboxSizeVariantProductModel> intheboxSizeVariantProductModels = searchResult.getResult();

        if (CollectionUtils.isNotEmpty(intheboxSizeVariantProductModels)){
            return intheboxSizeVariantProductModels;
        }
        return Collections.emptyList();
    }
}
