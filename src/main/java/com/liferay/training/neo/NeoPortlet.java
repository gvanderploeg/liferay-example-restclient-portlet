package com.liferay.training.neo;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

public class NeoPortlet extends MVCPortlet {

	private final static Log LOG = LogFactoryUtil.getLog(NeoPortlet.class);

	public void updateNeo(ActionRequest actionRequest, ActionResponse actionResponse) {

		Integer neoId = ParamUtil.getInteger(actionRequest, "id");
		// new RestTemplate().getForObject(url, Neo.class, neoId);
		String description = ParamUtil.getString(actionRequest, "description");

		LOG.error("Here we could update the NEO to the REST service. New description for NEO with ID " + neoId + ": " + description);
		SessionMessages.add(actionRequest, "saved");
	}
}
