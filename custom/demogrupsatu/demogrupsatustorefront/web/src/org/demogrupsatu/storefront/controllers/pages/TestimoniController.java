package org.demogrupsatu.storefront.controllers.pages;

import de.hybris.platform.acceleratorstorefrontcommons.controllers.pages.AbstractPageController;
import de.hybris.platform.cms2.exceptions.CMSItemNotFoundException;
import de.hybris.platform.cms2.model.pages.AbstractPageModel;
import de.hybris.platform.cms2.model.pages.ContentPageModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.demogrupsatu.facades.testimoni.TestimoniData;
import org.demogrupsatu.facades.testimoni.TestimoniFacade;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/testimoni")
public class TestimoniController extends AbstractPageController {

    private static final String TEMPLATE_PAGE = "testimoni";

    @Resource(name = "testimoniFacade")
    private TestimoniFacade testimoniFacade;

    @RequestMapping(method = RequestMethod.GET)
    public String getTrainingPage(@RequestParam(name = "page", defaultValue = "1") String number, final Model model) throws CMSItemNotFoundException {
        final ContentPageModel trainingData = getContentPageForLabelOrId(TEMPLATE_PAGE);
        storeCmsPageInModel(model, trainingData);
        setUpMetaDataForContentPage(model, trainingData);
        updatePageTitle(model, trainingData);

        List<TestimoniData> dataList = testimoniFacade.getAllTestimoni();
        List<TestimoniData> newList = new ArrayList<>();
        int currentPage = Integer.parseInt(number);
        int listSize = dataList.size();
        int j = 6 * currentPage;


        for(int i = 6 * (currentPage - 1); i < listSize; i++) {
            if(j==i) {
                break;
            }
            newList.add(dataList.get(i));
        }

        model.addAttribute("testimoniList", newList);
        model.addAttribute("max", (listSize/6 + 1));
        model.addAttribute("number", currentPage);


        return getViewForPage(model);
    }

    protected void updatePageTitle(final Model model, final AbstractPageModel cmsPage)
    {
        storeContentPageTitleInModel(model, getPageTitleResolver().resolveHomePageTitle(cmsPage.getTitle()));
    }

}
