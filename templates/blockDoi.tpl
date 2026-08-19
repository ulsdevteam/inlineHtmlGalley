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
	<span class="title">{translate key="doi.readerDisplayName"}</span>
		{* DOI *}
		{assign var=doiObject value=$article->getCurrentPublication()->getData('doiObject')}
		{if $doiObject}
			{assign var="doi" value=$doiObject->getData('doi')}
			{assign var="doiUrl" value=$doiObject->getData('resolvingUrl')|escape}
			<div class="list-group-item doi">
				{capture assign=translatedDoi}{translate key="doi.readerDisplayName"}{/capture}
				<strong>{translate key="semicolon" label=$translatedDoi}</strong>
				<a href="{$doiUrl}">
					{$doi}
				</a>
			</div>
		{/if}	
</div>