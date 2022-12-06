/*
 * Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.
 */
package org.demogrupsatu.storefront.controllers.pages;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.pages.AbstractPageController;
import de.hybris.platform.cms2.exceptions.CMSItemNotFoundException;
import de.hybris.platform.cms2.model.pages.ContentPageModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/about")
public class AboutPageController extends AbstractPageController {
    private static final String TEMPLATE_PAGE = "about";
    @RequestMapping(value=TEMPLATE_PAGE, method = RequestMethod.GET)
    public String getAbout(final Model model) throws CMSItemNotFoundException{
        System.out.println("Hello");
        final ContentPageModel demoData = getContentPageForLabelOrId(TEMPLATE_PAGE);
        storeCmsPageInModel(model, demoData);
        setUpMetaDataForContentPage(model, demoData);
        return getViewForPage(model);
    }
}