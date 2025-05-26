{if $announcementsFbRecommend}
    <script>
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/{$LANG.locale}/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
{/if}
{foreach from=$announcements item=announcement}

    <div class="announcement-single">

        <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="title">
            {$announcement.title}
        </a>

        <div class="article-items">
            <p>
                <i class="fas fa-calendar-alt fa-fw"></i>
                {$carbon->createFromTimestamp($announcement.timestamp)->format('F j, Y')}
                {if $announcement.editLink}
                    <a href="{$announcement.editLink}" class="admin-inline-edit">
                        <i class="fas fa-pencil-alt fa-fw"></i>
                        {$LANG.edit}
                    </a>
                {/if}
            </p>
        </div>

        {if $announcement.text|strip_tags|strlen < 350}
            <p>{$announcement.text}</p>
        {else}
            <p>{$announcement.summary}</p>
            <p><a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">{$LANG.readmore}<i class="fa fa-angle-right icon-right"></i></a></p>
        {/if}

        {if $announcementsFbRecommend}
            <div class="fb-like hidden-sm hidden-xs" data-layout="standard" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
            <div class="fb-like hidden-lg hidden-md" data-layout="button_count" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
        {/if}

    </div>

{foreachelse}

    {include file="$template/includes/alert.tpl" type="info" msg="{$LANG.noannouncements}" textcenter=true}

{/foreach}

{if $prevpage || $nextpage}

    <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3">
        <form class="form-inline" role="form">
            <div class="form-group">
                <div class="input-group">
                    {if $prevpage}
                        <span class="input-group-btn">
                            <a href="{routePath('announcement-index-paged', $prevpage, $view)}" class="btn btn-default">&laquo; {$LANG.previouspage}</a>
                        </span>
                    {/if}
                    <input class="form-control" style="text-align: center;" value="{$LANG.page} {$pagenumber}" disabled="disabled">
                    {if $nextpage}
                        <span class="input-group-btn">
                            <a href="{routePath('announcement-index-paged', $nextpage, $view)}" class="btn btn-default">{$LANG.nextpage} &raquo;</a>
                        </span>
                    {/if}
                </div>
            </div>
        </form>
    </div>
{/if}
