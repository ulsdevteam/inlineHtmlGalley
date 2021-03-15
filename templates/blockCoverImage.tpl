{**
 * plugins/generic/inlineHtmlGalley/blockCoverImage.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley Cover Image block
 *
 *}
<div class="pkp_block block_inline_html_cover_image">
    {* Article/Issue cover image *}
    {if $article->getLocalizedCoverImage() || $issue->getLocalizedCoverImage()}
        <div class="article_cover_wrapper">
            {if $article->getLocalizedCoverImage()}
                <img class="img-fluid" src="{$article->getLocalizedCoverImageUrl()|escape}"{if $article->getLocalizedCoverImageAltText()} alt="{$article->getLocalizedCoverImageAltText()|escape}"{/if}>
            {else}
                <a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
                    <img class="img-fluid" src="{$issue->getLocalizedCoverImageUrl()|escape}"{if $issue->getLocalizedCoverImageAltText()} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
                </a>
            {/if}
        </div>
    {/if}
</div>