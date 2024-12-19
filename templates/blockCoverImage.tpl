{**
 * plugins/generic/inlineHtmlGalley/blockCoverImage.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley Cover Image block
 *
 *}

{if $publication->getLocalizedData('coverImage') || ($issue && $issue->getLocalizedCoverImage())}
	<div class="pkp_block block_inline_html_cover_image">
		<div class="cover-image">
			{if $publication->getLocalizedData('coverImage')}
				{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
				<img
					class="img-responsive"
					src="{$publication->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
					alt="{$coverImage.altText|escape|default:''}"
				>
			{else}
				<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
					<img
						class="img-responsive"
						src="{$issue->getLocalizedCoverImageUrl()|escape}"
						alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}"
					>
				</a>
			{/if}
		</div>
	</div>
{/if}