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

import java.util.Locale;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import com.liferay.asset.kernel.model.AssetEntry;
import com.liferay.asset.kernel.model.AssetRenderer;
import com.liferay.asset.kernel.service.AssetEntryLocalService;
import com.liferay.knowledge.base.constants.KBFolderConstants;
import com.liferay.knowledge.base.model.KBArticle;
import com.liferay.knowledge.base.service.KBArticleLocalService;
import com.liferay.petra.string.CharPool;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.search.Field;
import com.liferay.portal.kernel.util.Http;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.portal.kernel.util.Portal;
import com.liferay.portal.kernel.util.ReleaseInfo;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.kernel.util.Validator;
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
public class KBArticleSimilarResultsContributor
	implements SimilarResultsContributor {

	@Override
	public void detectRoute(
		RouteBuilder routeBuilder, RouteHelper routeHelper) {

		// logic stolen wholesale from HttpHelper, cuz it's internal and I
		// needs it get the friendly url parameter that matches the urlString

		// uses the friendly url separator constant,
		// which is /-/, to extract the last 1/2 of the URL:

		// "/-/knowledge_base/kb-article-title"

		String[] subpath = StringUtil.split(
			_http.getPath(routeHelper.getURLString()),
			Portal.FRIENDLY_URL_SEPARATOR);

		String[] parameters = StringUtil.split(
			subpath[subpath.length - 1], CharPool.FORWARD_SLASH);

		if (!parameters[0].matches("knowledge_base")) {
			throw new RuntimeException("KBArticle was not detected");
		}

		// URL when KBArticle is in the root folder:
		// /-/knowledge_base/kb-article-title

		// URL when KBArticle is in a folder:
		// /-/knowledge_base/kb-folder-title/kb-article-title

		// We don't handle when the article is in a sub-folder.

		if (parameters.length == 2) {
			routeBuilder.addAttribute("urlTitle", parameters[1]);
		}
		else if (parameters.length == 3) {
			routeBuilder.addAttribute("urlFolderTitle", parameters[1]);
			routeBuilder.addAttribute("urlTitle", parameters[2]);
		}
	}

	@Override
	public void resolveCriteria(
		CriteriaBuilder criteriaBuilder, CriteriaHelper criteriaHelper) {

		long groupId = criteriaHelper.getGroupId();

		String urlFolderTitle = (String)criteriaHelper.getRouteParameter(
			"urlFolderTitle");
		String urlTitle = (String)criteriaHelper.getRouteParameter("urlTitle");

		KBArticle kbArticle;

		if (Validator.isNull(urlFolderTitle)) {
			kbArticle = _kbArticleLocalService.fetchKBArticleByUrlTitle(
				groupId, KBFolderConstants.DEFAULT_PARENT_FOLDER_ID, urlTitle);
		}
		else {
			kbArticle = _kbArticleLocalService.fetchKBArticleByUrlTitle(
				groupId, urlFolderTitle, urlTitle);
		}

		if (kbArticle == null) {
			return;
		}

		AssetEntry assetEntry = _assetEntryLocalService.fetchEntry(
			groupId, kbArticle.getUuid());

		if (assetEntry == null) {
			return;
		}

		// In DXP 7.3, it is "getPrimaryKeyObj"
		// In DXP 7.2, it is "getResourcePrimKey" if the entity is instance of
		// ResourcedModel, otherwise it is "getPrimaryKeyObj".
		// KBArticle is instance of ResourcedModel.

		String uidField = String.valueOf(kbArticle.getPrimaryKeyObj());
		
		int buildNumber = ReleaseInfo.getBuildNumber();
		
		if (ReleaseInfo.getBuildNumber() ==
				ReleaseInfo.RELEASE_7_2_10_BUILD_NUMBER) {

			uidField = String.valueOf(kbArticle.getResourcePrimKey());
		}

		criteriaBuilder.uid(Field.getUID(assetEntry.getClassName(), uidField));
	}

	@Override
	public void writeDestination(
		DestinationBuilder destinationBuilder,
		DestinationHelper destinationHelper) {

		//here, the destination helper is getting the route for the currently selected main asset
		String urlTitle = (String)destinationHelper.getRouteParameter(
			"urlTitle");

//		String urlFolderTitle = (String)destinationHelper.getRouteParameter(
//			"urlFolderTitle");
//
//		AssetRenderer<?> assetRenderer = destinationHelper.getAssetRenderer();

		// here, destination helper gets us the matched asset entries (the similar results)
		// we must then make sure to provide the proper url replacement mechanism
		AssetEntry assetEntry = destinationHelper.getAssetEntry();
		
		System.out.println("From the DestiontioHelper: " + "\n UrlTitle: " + urlTitle + "\n urlFolderTitle" + urlFolderTitle + "assetEntry.getURL" + assetEntry.getUrl());
		
		// We could get the backing KBArticle and then get the replacementUrlTitle from it
		// replace the urlTitle with the new replamentUrlTitle
		// does not handle folders, but this is an implementation detail that will 
		// obfuscate what we're trying to demonstrate. our logic will not be reusable in most cases
		// or, is it a more realistic use case that we shouldn't ignore?
		KBArticle kbArticle;
		String title="liferay";
		try {
			kbArticle = _kbArticleLocalService.getKBArticle(assetEntry.getClassPK(), 1);
			title = kbArticle.getUrlTitle();
			folder = kbArticle.getKbFolderId();
			System.out.println("From the KBArticle: urlTitle= " + title);
		} catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        Locale defaultLocale = LocaleUtil.getSiteDefault();

		destinationBuilder.replace(urlTitle, title);
	}

	@Reference
	private AssetEntryLocalService _assetEntryLocalService;

	@Reference
	private Http _http;

	@Reference
	private KBArticleLocalService _kbArticleLocalService;

}
