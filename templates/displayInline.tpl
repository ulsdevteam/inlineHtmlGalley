{**
 * templates/frontend/pages/article.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view an article with all of it's details.
 *
 * @uses $article Article This article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $journal Journal The journal currently being viewed.
 * @uses $primaryGalleys array List of article galleys that are not supplementary or dependent
 * @uses $supplementaryGalleys array List of article galleys that are supplementary
 * @uses $inlineHtmlGalley string The HTML content of the Article Galley
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$article->getLocalizedTitle()|escape}

<div class="page page_article">
	{if $section}
		{include file="frontend/components/breadcrumbs_article.tpl" currentTitle=$section->getLocalizedTitle()}
	{else}
		{include file="frontend/components/breadcrumbs_article.tpl" currentTitleKey="article.article"}
	{/if}

	{* Anchor for "Back to Top" button *}
	<a name="top"></a>

	<header>
		<h1 class="page-header">
			{$article->getLocalizedTitle()|escape}
			{if $article->getLocalizedSubtitle()}
				<small>
					{$article->getLocalizedSubtitle()|escape}
				</small>
			{/if}
		</h1>
	</header>

	<div class="article-main">
		{if $article->getAuthors()}
			<div class="authors">
				{foreach from=$article->getAuthors() item=author}
					<div class="author">
						<strong>{$author->getFullName()|escape}</strong>
						{if $author->getLocalizedAffiliation()}
							<div class="article-author-affilitation">
								{$author->getLocalizedAffiliation()|escape}
							</div>
						{/if}
						{if $author->getOrcid()}
							<div class="orcid">
								<a href="{$author->getOrcid()|escape}" target="_blank">
									{$orcidIcon}
									{$author->getOrcid()|escape}
								</a>
							</div>
						{/if}
					</div>
				{/foreach}
			</div>
		{/if}

		{* Article abstract *}
		{if $article->getLocalizedAbstract()}
			<div class="article-summary" id="summary">
				<div class="article-abstract">
					{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}
				</div>
			</div>
			{call_hook name="Templates::Article::Main"}
		{/if}
	</div>

	{* Provide download link *}
	<div class="inline_html_galley_download">
		<a class="obj_galley_link file" href="{url page="article" op="download" path=$article->getBestArticleId()|to_array:$galley->getBestGalleyId()}">
			{translate key="common.download"}
		</a>
	</div>

	{* Show article inline *}
	<div class="inline_html_galley">
	{$inlineHtmlGalley}
	</div>

	<div class="reader-options">
		<a class="back-to-top" href="#top">
			<span class="arrow-gylph">↑</span>
			{translate key="plugins.generic.inlineHtmlGalley.backToTop"}
		</a>
	</div>

	{call_hook name="Templates::Article::Footer::PageFooter"}

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
