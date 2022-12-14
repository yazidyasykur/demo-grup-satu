/*
 * Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.
 */
package org.demogrupsatu.storefront.controllers.pages;

import de.hybris.platform.acceleratorstorefrontcommons.constants.WebConstants;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.pages.AbstractPageController;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.util.GlobalMessages;
import de.hybris.platform.cms2.exceptions.CMSItemNotFoundException;
import de.hybris.platform.cms2.model.pages.AbstractPageModel;
import de.hybris.platform.cms2.model.pages.ContentPageModel;

import org.demogrupsatu.facades.faq.FaqFacade;
import org.demogrupsatu.facades.testimoni.TestimoniData;
import org.demogrupsatu.facades.testimoni.TestimoniFacade;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


/**
 * Controller for home page
 */
@Controller
@RequestMapping("/")
public class HomePageController extends AbstractPageController
{

	@Resource(name = "testimoniFacade")
	private TestimoniFacade testimoniFacade;

	private static final String LOGOUT = "logout";
	private static final String ACCOUNT_CONFIRMATION_SIGNOUT_TITLE = "account.confirmation.signout.title";
	private static final String ACCOUNT_CONFIRMATION_CLOSE_TITLE = "account.confirmation.close.title";

	@RequestMapping(method = RequestMethod.GET)
	public String home(@RequestParam(value = WebConstants.CLOSE_ACCOUNT, defaultValue = "false") final boolean closeAcc,
			@RequestParam(value = LOGOUT, defaultValue = "false") final boolean logout, final Model model,
			final RedirectAttributes redirectModel) throws CMSItemNotFoundException
	{
		if (logout)
		{
			String message = ACCOUNT_CONFIRMATION_SIGNOUT_TITLE;
			if (closeAcc)
			{
				message = ACCOUNT_CONFIRMATION_CLOSE_TITLE;
			}
			GlobalMessages.addFlashMessage(redirectModel, GlobalMessages.INFO_MESSAGES_HOLDER, message);
			return REDIRECT_PREFIX + ROOT;
		}
		final ContentPageModel contentPage = getContentPageForLabelOrId(null);
		storeCmsPageInModel(model, contentPage);
		setUpMetaDataForContentPage(model, contentPage);
		updatePageTitle(model, contentPage);

		List<TestimoniData> dataList = testimoniFacade.getAllTestimoni();
		List<TestimoniData> newList = new ArrayList<>();

		double averageRate = 0;
		int listSize = dataList.size();
		boolean halfStar = false;
		int emptyStar = 0;

		for(int i = 0; i < 3; i++) {
			newList.add(dataList.get(i));
		}

		for(TestimoniData data : dataList) {
			averageRate += data.getRating();
			if(data.getHalfStar()) {
				averageRate += 0.5;
			}
		}

		averageRate = Math.round((averageRate / listSize) * 10.0 ) / 10.0;

		if(averageRate % 1 >= 0.5) {
			halfStar = true;
			emptyStar = 5 - (int) Math.floor(averageRate) - 1;
		}
		else {
			emptyStar = 5 - (int) Math.floor(averageRate);
		}

		model.addAttribute("totalReview", listSize);
		model.addAttribute("average", averageRate);
		model.addAttribute("showSomeTestimoni", newList);
		model.addAttribute("starCount", (int) Math.floor(averageRate));
		model.addAttribute("isMoreThanHalf", halfStar);
		model.addAttribute("emptyStar", emptyStar);

		return getViewForPage(model);
	}

	protected void updatePageTitle(final Model model, final AbstractPageModel cmsPage)
	{
		storeContentPageTitleInModel(model, getPageTitleResolver().resolveHomePageTitle(cmsPage.getTitle()));
	}
}
