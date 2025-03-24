{**
 * plugins/generic/inlineHtmlGalley/blockPublishedDate.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley Published Date block
 *
 * @uses $pubIdPlugins Array of pubId plugins which this article may be assigned
 *
 *}

{if $publication->getData('datePublished')}
	<div class="pkp_block block_inline_html_published_date">
		<span class="title published_date_label">
			{translate key="submissions.published"}
		</span>
		<div class="list-group-item date-published">
			{capture assign=translatedDatePublished}{translate key="submissions.published"}{/capture}
			<strong>{translate key="semicolon" label=$translatedDatePublished}</strong>
			{$publication->getData('datePublished')|date_format:$dateFormatShort}
		</div>
		{* If this is an updated version *}
		{if $firstPublication->getID() !== $publication->getId()}
			<div class="list-group-item date-updated">
				{capture assign=translatedUpdated}{translate key="common.updated"}{/capture}
				<strong>{translate key="semicolon" label=$translatedUpdated}</strong>
				{$publication->getData('datePublished')|date_format:$dateFormatShort}
			</div>
		{/if}
		{* Versions *}
		{if count($article->getPublishedPublications()) > 1}
			<div class="list-group-item versions">
				<strong>{capture assign=translatedVersions}{translate key="submission.versions"}{/capture}
				{translate key="semicolon" label=$translatedVersions}</strong>
				{foreach from=array_reverse($article->getPublishedPublications()) item=iPublication}
					{capture assign="name"}{translate key="submission.versionIdentity" datePublished=$iPublication->getData('datePublished')|date_format:$dateFormatShort version=$iPublication->getData('version')}{/capture}
					<div>
						{if $iPublication->getId() === $publication->getId()}
							{$name}
						{elseif $iPublication->getId() === $currentPublication->getId()}
							<a href="{url page="article" op="view" path=$article->getBestId()}">{$name}</a>
						{else}
							<a href="{url page="article" op="view" path=$article->getBestId()|to_array:"version":$iPublication->getId()}">{$name}</a>
						{/if}
					</div>
				{/foreach}
			</div>
		{/if}
	</div>
{/if}