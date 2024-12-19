{**
 * plugins/generic/inlineHtmlGalley/blockDoi.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley DOI block
 *
 * @uses $pubIdPlugins Array of pubId plugins which this article may be assigned
 *
 *}
<div class="pkp_block block_inline_html_doi">
	<span class="title">{translate key="plugins.pubIds.doi.readerDisplayName"}</span>
	{* DOI (requires plugin) *}
	{foreach from=$pubIdPlugins item=pubIdPlugin}
		{if $pubIdPlugin->getPubIdType() != 'doi'}
			{continue}
		{/if}
		{if $issue->getPublished()}
			{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
		{else}
			{assign var=pubId value=$pubIdPlugin->getPubId($article)}{* Preview pubId *}
		{/if}
		{if $pubId}
			{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
			<div class="list-group-item doi">
				{capture assign=translatedDoi}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}
				<strong>{translate key="semicolon" label=$translatedDoi}</strong>
				<a href="{$doiUrl}">
					{$doiUrl}
				</a>
			</div>
		{/if}
	{/foreach}
</div>