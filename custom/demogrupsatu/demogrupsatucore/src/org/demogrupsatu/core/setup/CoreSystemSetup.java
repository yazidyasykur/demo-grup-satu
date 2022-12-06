/*
 * Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.
 */
package org.demogrupsatu.core.setup;

import de.hybris.platform.commerceservices.setup.AbstractSystemSetup;
import de.hybris.platform.core.Registry;
import de.hybris.platform.core.initialization.SystemSetup;
import de.hybris.platform.core.initialization.SystemSetup.Process;
import de.hybris.platform.core.initialization.SystemSetup.Type;
import de.hybris.platform.core.initialization.SystemSetupContext;
import de.hybris.platform.core.initialization.SystemSetupParameter;
import de.hybris.platform.core.initialization.SystemSetupParameterMethod;
import org.demogrupsatu.core.constants.DemogrupsatuCoreConstants;

import java.util.ArrayList;
import java.util.List;


/**
 * This class provides hooks into the system's initialization and update processes.
 */
@SystemSetup(extension = DemogrupsatuCoreConstants.EXTENSIONNAME)
public class CoreSystemSetup extends AbstractSystemSetup
{
	public static final String IMPORT_ACCESS_RIGHTS = "accessRights";

	/**
	 * This method will be called by system creator during initialization and system update. Be sure that this method can
	 * be called repeatedly.
	 *
	 * @param context
	 *           the context provides the selected parameters and values
	 */
	@SystemSetup(type = Type.ESSENTIAL, process = Process.ALL)
	public void createEssentialData(final SystemSetupContext context)
	{
		importImpexFile(context, "/demogrupsatucore/import/common/essential-data.impex");
		importImpexFile(context, "/demogrupsatucore/import/common/countries.impex");
		importImpexFile(context, "/demogrupsatucore/import/common/delivery-modes.impex");

		importImpexFile(context, "/demogrupsatucore/import/common/themes.impex");
		importImpexFile(context, "/demogrupsatucore/import/common/user-groups.impex");
		importImpexFile(context, "/demogrupsatucore/import/common/cronjobs.impex");
	}

	/**
	 * Generates the Dropdown and Multi-select boxes for the project data import
	 */
	@Override
	@SystemSetupParameterMethod
	public List<SystemSetupParameter> getInitializationOptions()
	{
		final List<SystemSetupParameter> params = new ArrayList<>();

		params.add(createBooleanSystemSetupParameter(IMPORT_ACCESS_RIGHTS, "Import Users & Groups", true));

		return params;
	}

	/**
	 * This method will be called during the system initialization.
	 *
	 * @param context
	 *           the context provides the selected parameters and values
	 */
	@SystemSetup(type = Type.PROJECT, process = Process.ALL)
	public void createProjectData(final SystemSetupContext context)
	{
		final boolean importAccessRights = getBooleanSystemSetupParameter(context, IMPORT_ACCESS_RIGHTS);

		final List<String> extensionNames = getExtensionNames();

		processCockpit(context, importAccessRights, extensionNames, "cmsbackoffice",
				"/demogrupsatucore/import/cockpits/cmscockpit/cmscockpit-users.impex",
				"/demogrupsatucore/import/cockpits/cmscockpit/cmscockpit-access-rights.impex");

		processCockpit(context, importAccessRights, extensionNames, "productcockpit",
				"/demogrupsatucore/import/cockpits/productcockpit/productcockpit-users.impex",
				"/demogrupsatucore/import/cockpits/productcockpit/productcockpit-access-rights.impex",
				"/demogrupsatucore/import/cockpits/productcockpit/productcockpit-constraints.impex");

		processCockpit(context, importAccessRights, extensionNames, "customersupportbackoffice",
				"/demogrupsatucore/import/cockpits/cscockpit/cscockpit-users.impex",
				"/demogrupsatucore/import/cockpits/cscockpit/cscockpit-access-rights.impex");
	}

	protected void processCockpit(final SystemSetupContext context, final boolean importAccessRights,
			final List<String> extensionNames, final String cockpit, final String... files)
	{
		if (importAccessRights && extensionNames.contains(cockpit))
		{
			for (final String file : files)
			{
				importImpexFile(context, file);
			}
		}
	}

	protected List<String> getExtensionNames()
	{
		return Registry.getCurrentTenant().getTenantSpecificExtensionNames();
	}
}
