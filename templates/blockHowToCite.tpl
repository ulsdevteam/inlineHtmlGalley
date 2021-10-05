{**
 * plugins/generic/inlineHtmlGalley/blockHowToCite.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley How To Cite block
 *
 *}
{* How to cite *}
{if $citation}
    <div class="pkp_block block_inline_html_how_to_cite how-to-cite">
        <div class="title">
            {translate key="submission.howToCite"}
        </div>
        <div class="content">
            <div id="citationOutput" role="region" aria-live="polite">
                {$citation}
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-controls="cslCitationFormats">
                {translate key="submission.howToCite.citationFormats"}
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    {foreach from=$citationStyles item="citationStyle"}
                        <li>
                            <a
                                aria-controls="citationOutput"
                                href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}"
                                data-load-citation
                                data-json-href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgsJson}"
                            >
                                {$citationStyle.title|escape}
                            </a>
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>
{/if}