{**
 * plugins/generic/inlineHtmlGalley/blockReferences.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley References block
 *
 *}

{if $parsedCitations || $publication->getData('citationsRaw')}
	<div class="pkp_block block_inline_html_references">
		<span class="title"> {translate key="submission.citations"} </span>
		<div class="article-references">
			<h2>{translate key="submission.citations"}</h2>
			<div class="article-references-content">
				{if $parsedCitations}
					{foreach from=$parsedCitations item="parsedCitation"}
						<p>{$parsedCitation->getCitationWithLinks()|strip_unsafe_html} {call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</p>
					{/foreach}
				{else}
					{$publication->getData('citationsRaw')|nl2br}
				{/if}
			</div>
		</div>
	</div>
{/if}