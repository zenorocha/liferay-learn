/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */

package com.liferay.learn.r1s1.impl;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import com.liferay.asset.kernel.model.AssetEntry;
import com.liferay.asset.kernel.model.AssetRenderer;
import com.liferay.asset.kernel.service.AssetEntryLocalService;
import com.liferay.knowledge.base.constants.KBFolderConstants;
import com.liferay.knowledge.base.model.KBArticle;
import com.liferay.knowledge.base.service.KBArticleLocalService;
import com.liferay.petra.string.CharPool;
import com.liferay.portal.kernel.search.Field;
import com.liferay.portal.kernel.util.Http;
import com.liferay.portal.kernel.util.Portal;
import com.liferay.portal.kernel.util.ReleaseInfo;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.search.similar.results.web.spi.contributor.SimilarResultsContributor;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.CriteriaBuilder;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.CriteriaHelper;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.DestinationBuilder;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.DestinationHelper;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.RouteBuilder;
import com.liferay.portal.search.similar.results.web.spi.contributor.helper.RouteHelper;

/**
 * @author Russell Bohl
 * @author Tibor Lipusz
 */
@Component(service = SimilarResultsContributor.class)
public class KBArticleSimilarResultsContributor implements SimilarResultsContributor {

	@Override
	public void detectRoute(RouteBuilder routeBuilder, RouteHelper routeHelper) {

		String[] subpath = StringUtil.split(_http.getPath(routeHelper.getURLString()), Portal.FRIENDLY_URL_SEPARATOR);
		
		String[] parameters = StringUtil.split(subpath[subpath.length - 1], CharPool.FORWARD_SLASH);

		if (!parameters[0].matches("knowledge_base")) {
			throw new RuntimeException("KBArticle was not detected");
		}

		routeBuilder.addAttribute("urlTitle", parameters[1]);
	}

	@Override
	public void resolveCriteria(CriteriaBuilder criteriaBuilder, CriteriaHelper criteriaHelper) {

		long groupId = criteriaHelper.getGroupId();

		String urlTitle = (String) criteriaHelper.getRouteParameter("urlTitle");

		KBArticle kbArticle = _kbArticleLocalService.fetchKBArticleByUrlTitle(groupId,
				KBFolderConstants.DEFAULT_PARENT_FOLDER_ID, urlTitle);

		if (kbArticle == null) {
			return;
		}

		AssetEntry assetEntry = _assetEntryLocalService.fetchEntry(groupId, kbArticle.getUuid());

		if (assetEntry == null) {
			return;
		}

		String uidField = String.valueOf(kbArticle.getPrimaryKeyObj());

		int buildNumber = ReleaseInfo.getBuildNumber();

		if (ReleaseInfo.getBuildNumber() == ReleaseInfo.RELEASE_7_2_10_BUILD_NUMBER) {

			uidField = String.valueOf(kbArticle.getResourcePrimKey());
		}

		criteriaBuilder.uid(Field.getUID(assetEntry.getClassName(), uidField));
	}

	@Override
	public void writeDestination(DestinationBuilder destinationBuilder, DestinationHelper destinationHelper) {

		String urlTitle = (String) destinationHelper.getRouteParameter("urlTitle");

		AssetRenderer<?> assetRenderer = destinationHelper.getAssetRenderer();

		KBArticle kbArticle = (KBArticle) assetRenderer.getAssetObject();
		destinationBuilder.replace(urlTitle, kbArticle.getUrlTitle());

	}

	@Reference
	private AssetEntryLocalService _assetEntryLocalService;

	@Reference
	private Http _http;

	@Reference
	private KBArticleLocalService _kbArticleLocalService;

}
