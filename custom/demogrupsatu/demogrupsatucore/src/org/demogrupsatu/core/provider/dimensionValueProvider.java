package org.demogrupsatu.core.provider;

import de.hybris.platform.solrfacetsearch.config.IndexConfig;
import de.hybris.platform.solrfacetsearch.config.IndexedProperty;
import de.hybris.platform.solrfacetsearch.config.exceptions.FieldValueProviderException;
import de.hybris.platform.solrfacetsearch.provider.FieldNameProvider;
import de.hybris.platform.solrfacetsearch.provider.FieldValue;
import de.hybris.platform.solrfacetsearch.provider.FieldValueProvider;
import de.hybris.platform.solrfacetsearch.provider.impl.AbstractPropertyFieldValueProvider;
import org.demogrupsatu.core.model.IntheboxSizeVariantProductModel;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


public class dimensionValueProvider extends AbstractPropertyFieldValueProvider implements FieldValueProvider {

    private FieldNameProvider fieldNameProvider;

    @Override
    public Collection<FieldValue> getFieldValues(IndexConfig indexConfig, IndexedProperty indexedProperty, Object model) throws FieldValueProviderException {
        if (model instanceof IntheboxSizeVariantProductModel)
        {
            final IntheboxSizeVariantProductModel product = (IntheboxSizeVariantProductModel) model;
            final Collection<FieldValue> fieldValues = new ArrayList<>();
            fieldValues.addAll(createFieldValue(product, indexedProperty));
            return fieldValues;
        }
        else
        {
            throw new FieldValueProviderException("Solr DimensionValueProvider Eror");
        }
    }

    protected List<FieldValue> createFieldValue(final IntheboxSizeVariantProductModel product, final IndexedProperty indexedProperty)
    {
        final List<FieldValue> fieldValues = new ArrayList<FieldValue>();
        final Collection<String> fieldNames = getFieldNameProvider().getFieldNames(indexedProperty, null);
        String indexName="";
        if (null != product.getSize())
        {
            for (final String fieldName : fieldNames)
            {
                if(fieldName.contains("dimension")){
                    indexName=product.getSize().getDimension() + " x " + product.getHeight() + " cm";
                } else if (fieldName.contains("size")) {
                    indexName=product.getSize().getSizeName();
                } else if (fieldName.contains("height")) {
                    indexName=product.getHeight();
                } else if (fieldName.contains("baseProduct")) {
                    indexName= product.getBaseProduct().getCode();
                } else{
                    indexName=product.getBaseProduct().getCode();
                }
                fieldValues.add(new FieldValue(fieldName,indexName ));
            }
        }
        return fieldValues;
    }

    /**
     * @return the fieldNameProvider
     */
    public FieldNameProvider getFieldNameProvider()
    {
        return fieldNameProvider;
    }

    /**
     * @param fieldNameProvider
     *           the fieldNameProvider to set
     */
    public void setFieldNameProvider(final FieldNameProvider fieldNameProvider)
    {
        this.fieldNameProvider = fieldNameProvider;
    }
}
