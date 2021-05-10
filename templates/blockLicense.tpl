{**
 * plugins/generic/inlineHtmlGalley/blockLicense.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley License block
 *
 *}
{* Licensing info *}
{if $copyright || $licenseUrl}
    <div class="pkp_block block_inline_html_license">
        <span class="title">
            {translate key="submission.license"}
        </span>
        <div class="content">
            <div class="item copyright">
                {if $licenseUrl}
                    {if $ccLicenseBadge}
                        {$ccLicenseBadge}
                        {if $copyrightHolder}
                            <p>{translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder|escape copyrightYear=$copyrightYear|escape}</p>
                        {/if}
                    {else}
                        <a href="{$licenseUrl|escape}" class="copyright">
                            {if $copyrightHolder}
                                {translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder|escape copyrightYear=$copyrightYear|escape}
                            {else}
                                {translate key="submission.license"}
                            {/if}
                        </a>
                    {/if}
                {/if}
                {* Copyright modal. Show only if license is absent *}
                {if $copyright && !$licenseUrl}
                    <a class="more_button" data-toggle="modal" data-target="#copyrightModal">
                        {translate key="about.copyrightNotice"}
                    </a>
                    <div class="modal fade" id="copyrightModal" tabindex="-1" role="dialog" aria-labelledby="copyrightModalTitle" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="copyrightModalTitle">{translate key="about.copyrightNotice"}</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    {$copyright|strip_unsafe_html}
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">{translate key="plugins.themes.classic.close"}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
{/if}
