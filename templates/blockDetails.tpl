{**
 * plugins/generic/inlineHtmlGalley/blockDetails.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley download block
 *
 *}
{capture name='detailsBlockContent'}{call_hook name="Templates::Article::Details"}{/capture}
{if $smarty.capture.detailsBlockContent ne ""}
<div class="pkp_block block_inline_html_details">
	<h2 class="title">{translate key="article.details"}</h2>
	<div class="content">
		{$smarty.capture.detailsBlockContent}
	</div>
</div>
{/if}

