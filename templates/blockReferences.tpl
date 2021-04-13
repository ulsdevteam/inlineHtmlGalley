{**
 * plugins/generic/inlineHtmlGalley/blockReferences.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley References block
 *
 *}
{* References *}
{if $parsedCitations->getCount() || $article->getCitations()}
    <div class="pkp_block block_inline_html_references">
        <span class="title"> {translate key="submission.citations"} </span>
        <div class="content">
        <div class="item references">
            {if $parsedCitations->getCount()}
                <ol class="references-list">
                    {iterate from=parsedCitations item=parsedCitation}
                        <li>{$parsedCitation->getCitationWithLinks()|strip_unsafe_html} {call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</li>
                    {/iterate}
                </ol>
            {elseif $article->getCitations()}
                <div class="value">
                    {$article->getCitations()|nl2br}
                </div>
            {/if}
        </div>
        </div>
    </div>
{/if}