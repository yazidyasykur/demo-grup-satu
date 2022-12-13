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

    @Override
    public List<IntheboxProductModel> getProductByVariant(String code) {
        final String query = "select distinct {p.pk} from {IntheboxSizeVariantProduct as v join IntheboxProduct as p on {v.baseproduct}={p.pk}} " +
                "where {p.code} like concat(substring(?code,1,11),'%')";
        final FlexibleSearchQuery flexibleSearchQuery = new FlexibleSearchQuery(query);
        flexibleSearchQuery.addQueryParameter("code",code);
        final SearchResult<IntheboxProductModel> searchResult = flexibleSearchService.search(flexibleSearchQuery);
        List<IntheboxProductModel> intheboxProductModels = searchResult.getResult();
        if (CollectionUtils.isNotEmpty(intheboxProductModels)){
            return intheboxProductModels;
        }
        return Collections.emptyList();
    }
}
