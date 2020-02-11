package com.liferay.learn.r1s1.impl;


import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import com.liferay.asset.kernel.model.AssetEntry;
import com.liferay.asset.kernel.model.AssetRenderer;
import com.liferay.asset.kernel.service.AssetEntryLocalService;
import com.liferay.knowledge.base.model.KBArticle;
import com.liferay.knowledge.base.service.KBArticleLocalService;
import com.liferay.petra.string.CharPool;
import com.liferay.portal.kernel.search.Field;
import com.liferay.portal.kernel.util.HttpUtil;
import com.liferay.portal.kernel.util.Portal;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.search.similar.results.web.spi.contributor.SimilarResultsContributor;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.CriteriaBuilder;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.CriteriaHelper;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.DestinationBuilder;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.DestinationHelper;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.RouteBuilder;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.RouteHelper;

@Component(service = SimilarResultsContributor.class)
public class KBSimilarResultsContributor implements SimilarResultsContributor {

	@Override
	public void detectRoute(RouteBuilder routeBuilder, RouteHelper routeHelper) {

		// logic stolen wholesale from HttpHelper, cuz it's internal and I needs it
		// get the friendly url parameter that matches the urlString

		//uses the friendly url separator constant, which is /-/, to extract the last 1/2 of the URL:
		//   "/-/knowledge_base/test-kb-article-two"
		String[] subpath = StringUtil.split(HttpUtil.getPath(routeHelper.getURLString()),
				Portal.FRIENDLY_URL_SEPARATOR);

		String[] parameters = StringUtil.split(subpath[subpath.length - 1], CharPool.FORWARD_SLASH);

		// i don't know if this check of the array value is appropriate
		// if the first fruendlyUrl parameter is for the knowledge base, add the second param 
		// as the attribute that similar results will use to grab our contributor
		if (parameters[0].matches("knowledge_base")) {

			routeBuilder.addAttribute("urlTitle", parameters[1]);
		}
	}

	@Override
	public void resolveCriteria(CriteriaBuilder criteriaBuilder, CriteriaHelper criteriaHelper) {

		long groupId = criteriaHelper.getGroupId();

		String urlTitle = (String) criteriaHelper.getRouteParameter("urlTitle");

		/*
		 * need help here. how would i retrieve the folder? is there a service
		 * call to fetch it using the url title of the article maybe?
		 */ long kbFolderId = 0;
		KBArticle kbArticle = _kbArticleLocalService.fetchKBArticleByUrlTitle(groupId, kbFolderId, urlTitle);

		if (kbArticle == null) {
			return;
		}

		AssetEntry assetEntry = _assetEntryLocalService.fetchEntry(groupId, kbArticle.getUuid());

		if (assetEntry == null) {
			return;
		}

		/*
		 * for blogs this sets something like this as the uid:
		 * com.liferay.blogs.model.BlogsEntry_PORTLET_38805 might need to doc this uid
		 * thing a bit. it wasn't clear which field from the model entity was going to
		 * be used to match the uid. i tried getPrimaryKey(), getKBArticleId(), and
		 * finally found that getEntryClassPK was the golden ticket.
		 */
		criteriaBuilder.uid(Field.getUID(assetEntry.getClassName(), String.valueOf(kbArticle.getClassPK())));
	}

	@Override
	public void writeDestination(DestinationBuilder destinationBuilder, DestinationHelper destinationHelper) {

		String urlTitle = (String)destinationHelper.getRouteParameter(
			"urlTitle");

		AssetRenderer<?> assetRenderer = destinationHelper.getAssetRenderer();

		destinationBuilder.replace(urlTitle, assetRenderer.getUrlTitle());
	}

	@Reference
	private KBArticleLocalService _kbArticleLocalService;

	@Reference
	private AssetEntryLocalService _assetEntryLocalService;
}