{**
 * plugins/generic/inlineHtmlGalley/blockAuthors.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley Authors sidebar block
 *
 * @uses $boolAuthorInfo bool to check whether at least one author has additional info
 *}

 {if count($publication->getData('authors'))}
	<div class="pkp_block block_inline_html_authors">
		<span class="title">
		{translate key="submission.authors"}
		</span>
		<div class="authors">
			{foreach from=$publication->getData('authors') item=author}
				<div class="author">
					<strong>{$author->getFullName()|escape}</strong>
					{if $author->getLocalizedAffiliation()}
						<div class="article-author-affilitation">
							{$author->getLocalizedAffiliation()|escape}
						</div>
					{/if}
					{if $author->getOrcid()}
						<div class="orcid">
							{$orcidIcon}
							<a href="{$author->getOrcid()|escape}" target="_blank">
								{$author->getOrcid()|escape}
							</a>
						</div>
					{/if}
				</div>
			{/foreach}
		</div>
	</div>
{/if}