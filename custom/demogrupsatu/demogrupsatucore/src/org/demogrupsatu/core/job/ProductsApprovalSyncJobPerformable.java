package org.demogrupsatu.core.job;

import de.hybris.platform.acceleratorservices.dataexport.googlelocal.model.Product;
import de.hybris.platform.catalog.enums.ArticleApprovalStatus;
import de.hybris.platform.commerceservices.setup.SetupSolrIndexerService;
import de.hybris.platform.commerceservices.setup.SetupSyncJobService;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.cronjob.enums.CronJobResult;
import de.hybris.platform.cronjob.enums.CronJobStatus;
import de.hybris.platform.cronjob.model.CronJobModel;
import de.hybris.platform.servicelayer.cronjob.AbstractJobPerformable;
import de.hybris.platform.servicelayer.cronjob.PerformResult;
import de.hybris.platform.servicelayer.model.ModelService;
import de.hybris.platform.util.Config;
import org.apache.log4j.Logger;
import org.demogrupsatu.core.intheboxproduct.IntheboxProductService;
import org.demogrupsatu.core.intheboxproduct.impl.DefaultIntheboxProductService;
import org.demogrupsatu.core.intheboxvariant.impl.DefaultIntheboxVariantService;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.List;

public class ProductsApprovalSyncJobPerformable extends AbstractJobPerformable<CronJobModel> {
    private static final String PRODUCT_CATALOGS = Config.getString("Demo Product Catalog" , "demoProductCatalog");
    private static final String SOLR = "demoIndex";
    private static final Logger LOG = Logger.getLogger(ProductsApprovalSyncJobPerformable.class);
    @Resource
    private SetupSyncJobService setupSyncJobService;

    @Resource
    private SetupSolrIndexerService setupSolrIndexerService;

    @Resource
    private ModelService modelService;

    @Resource
    private DefaultIntheboxVariantService defaultIntheboxVariantService;

    @Override
    public PerformResult perform(CronJobModel cronJobModel) {
        final ProductModel product = new ProductModel();
        List<ProductModel> productModelList = defaultIntheboxVariantService.getAllProduct();

        if(!CollectionUtils.isEmpty(productModelList)) {
            try {
                for (ProductModel productModel : productModelList) {
                    productModel.setApprovalStatus(ArticleApprovalStatus.APPROVED);
                    modelService.save(productModel);
                }
                setupSyncJobService.createProductCatalogSyncJob(PRODUCT_CATALOGS);
                setupSyncJobService.executeCatalogSyncJob(PRODUCT_CATALOGS);

                setupSolrIndexerService.createSolrIndexerCronJobs(SOLR);
                setupSolrIndexerService.executeSolrIndexerCronJob(SOLR, true);

            } catch (Exception err) {
                LOG.error("Error Executing Cron Job" , err);
                return new PerformResult(CronJobResult.ERROR, CronJobStatus.FINISHED);
            }
        }
        return new PerformResult(CronJobResult.SUCCESS, CronJobStatus.FINISHED);
    }
}
