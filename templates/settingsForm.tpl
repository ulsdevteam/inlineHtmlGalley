{**
 * plugins/generic/inlineHtmlGalley/settingsForm.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 * 
 * InlineHtmlGalley plugin settings
 *}
<script>
    $(function() {ldelim}
        // Attach the form handler
        $('#inlineHtmlGalleySettingsForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
    {rdelim});
</script>

<form class="pkp_form" id="inlineHtmlGalleySettingsForm" method="post" action="{url router=$smarty.const.ROUTE_COMPONENT op="manage" category="generic" plugin=$pluginName verb="settings" save=true}">
    {csrf}

    {fbvFormArea id="inlineHtmlGalleySettingsFormArea"}
        {fbvFormSection title="plugins.generic.inlineHtmlGalley.settings.xpath" description="plugins.generic.inlineHtmlGalley.settings.xpath.description"}
            {fbvElement type="text" id="xpath" value=$xpath size=$fbvStyles.size.MEDIUM}
        {/fbvFormSection}
    {/fbvFormArea}
	{fbvFormButtons id="inlineHtmlGalleySettingsFormSubmit" submitText="common.save"}
</form>
