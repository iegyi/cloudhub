<!-- Icons -->
<link rel="apple-touch-icon-precomposed" href="{$WEB_ROOT}/templates/{$template}/template/img/icons/apple-touch-icon.png">
<link rel="icon" href="{$WEB_ROOT}/templates/{$template}/template/img/icons/favicon.ico">

<!-- WHMCS -->
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/css/whmcs.min.css?v={$versionHash}">

<!-- Template -->
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/template/css/main.min.css">

<!-- Custom -->
{include file="$template/template/includes/custom.tpl"}

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
    var csrfToken = '{$token}',
        markdownGuide = '{lang key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang key="markdown.saved"}',
        saving = '{lang key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}",
        requiredText = '{lang key="orderForm.required"}',
        recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
</script>
<script src="{$WEB_ROOT}/templates/{$template}/js/scripts.min.js?v={$versionHash}"></script>

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
