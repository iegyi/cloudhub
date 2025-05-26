<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>

    {include file="$template/includes/head.tpl"}

    {$headoutput}

</head>
<!-- Body -->
{include file="$template/template/includes/body.tpl"}

<!-- Header -->
{include file="$template/template/includes/header.tpl"}
<!-- WHMCS Content -->

{$headeroutput}

<section id="main-menu">

    <nav id="nav" class="navbar navbar-default navbar-main" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-toggle" data-toggle="collapse" data-target="#primary-nav" href="#">
                    <i class="fas fa-chevron-down"></i>
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="primary-nav">

                <ul class="nav navbar-nav">

                    {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}

                </ul>

                <ul class="nav navbar-nav navbar-right">

                    <li>
                        <a href="{$WEB_ROOT}/cart.php?a=view">
                            <span class="visible-lg visible-md">
                                <i class="fas fa-shopping-cart"></i>
                            </span>
                            <span class="visible-sm visible-xs">
                                {$LANG.viewcart}
                            </span>
                        </a>
                    </li>

                    {if $languagechangeenabled && count($locales) > 1}
                    <li>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <span class="visible-lg visible-md">
                                <i class="fas fa-globe"></i>
                            </span>
                            <span class="visible-sm visible-xs">
                                {$activeLocale.localisedName}
                                <b class="caret"></b>
                            </span>
                        </a>
                        <ul class="dropdown-menu{if count($locales) > 8} dropdown-menu-languages{/if}">
                            {foreach $locales as $locale}
                                <li>
                                    <a href="{$currentpagelinkback}language={$locale.language}">{$locale.localisedName}</a>
                                </li>
                            {/foreach}
                        </ul>
                    </li>
                    {/if}

                    {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar}

                </ul>

            </div><!-- /.navbar-collapse -->
        </div>
    </nav>

</section>

{if $adminMasqueradingAsClient || $adminLoggedIn}
    <section class="admin-banner">
        <p>
            <a href="{$WEB_ROOT}/logout.php?returntoadmin=1">
                {if $adminMasqueradingAsClient}{$LANG.adminmasqueradingasclient} {$LANG.logoutandreturntoadminarea}{else}{$LANG.adminloggedin} {$LANG.returntoadminarea}{/if}<i class="fas fa-sign-out icon-right"></i>
            </a>
        </p>
    </section>
{/if}

{if $templatefile == 'homepage'}
    <section id="home-banner">
        <div class="container text-center">
            {if $registerdomainenabled || $transferdomainenabled}
                <h2>{$LANG.homebegin}</h2>
                <form method="post" action="domainchecker.php" id="frmDomainHomepage">
                    <input type="hidden" name="transfer" />
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                            <div class="input-group input-group-lg">
                                <input type="text" class="form-control" name="domain" placeholder="{$LANG.exampledomain}" autocapitalize="none" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                <span class="input-group-btn">
                                    {if $registerdomainenabled}
                                        <input type="submit" class="btn search{$captcha->getButtonClass($captchaForm)}" value="{$LANG.search}" />
                                    {/if}
                                    {if $transferdomainenabled}
                                        <input type="submit" id="btnTransfer" class="btn transfer{$captcha->getButtonClass($captchaForm)}" value="{$LANG.domainstransfer}" />
                                    {/if}
                                </span>
                            </div>
                        </div>
                    </div>

                    {include file="$template/includes/captcha.tpl"}
                </form>
            {else}
                <h2>{$LANG.doToday}</h2>
            {/if}
        </div>
    </section>
    <div class="home-shortcuts">
        <div class="container">
            <ul>
                {if $registerdomainenabled || $transferdomainenabled}
                    <li>
                        <a id="btnBuyADomain" href="domainchecker.php">
                            <i class="fas fa-globe"></i>
                            <p>
                                {$LANG.buyadomain}
                            </p>
                        </a>
                    </li>
                {/if}
                <li>
                    <a id="btnOrderHosting" href="cart.php">
                        <i class="fas fa-hdd"></i>
                        <p>
                            {$LANG.orderhosting}
                        </p>
                    </a>
                </li>
                <li>
                    <a id="btnMakePayment" href="clientarea.php">
                        <i class="fas fa-credit-card"></i>
                        <p>
                            {$LANG.makepayment}
                        </p>
                    </a>
                </li>
                <li>
                    <a id="btnGetSupport" href="submitticket.php">
                        <i class="fas fa-envelope"></i>
                        <p>
                            {$LANG.getsupport}
                        </p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
{/if}

{include file="$template/includes/verifyemail.tpl"}

<section id="main-body">
    <div class="container{if $skipMainBodyContainer}-fluid without-padding{/if}">
        <div class="row">

        {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
            {if $primarySidebar->hasChildren() && !$skipMainBodyContainer}
                <div class="col-md-9 pull-md-right">
                    {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
                </div>
            {/if}
            <div class="col-md-3 pull-md-left sidebar">
                {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
            </div>
        {/if}
        <!-- Container for main page display content -->
        <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-md-9 pull-md-right{else}col-xs-12{/if} main-content">
            {if !$primarySidebar->hasChildren() && !$showingLoginPage && !$inShoppingCart && $templatefile != 'homepage' && !$skipMainBodyContainer}
                {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
            {/if}
