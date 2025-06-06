{if $twitterusername}

    <h2>{$LANG.twitterlatesttweets}</h2>

    <div id="twitterFeedOutput">
        <p class="text-center"><img src="{$BASE_PATH_IMG}/loading.gif" /></p>
    </div>

    <script type="text/javascript" src="templates/{$template}/js/twitter.js"></script>

{elseif $announcements}

    <h2>{$LANG.news}</h2>

    {foreach $announcements as $announcement}
        {if $announcement@index < 2}
            <div class="announcement-single home-news-single">

                <blockquote>
                    <h3>
                        <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">{$announcement.title}</a>
                        <span>
                            {$carbon->translatePassedToFormat($announcement.rawDate, 'F j, Y')}
                        </span>
                    </h3>
                    {if $announcement.text|strip_tags|strlen < 350}
                        <p>{$announcement.text}</p>
                    {else}
                        <p>{$announcement.summary}</p>
                        <p class="more"><a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">{$LANG.readmore}<i class="fas fa-angle-right icon-right"></i></a></p>
                    {/if}
                </blockquote>

                {if $announcementsFbRecommend}
                    <script>
                        (function(d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) {
                                return;
                            }
                            js = d.createElement(s); js.id = id;
                            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));
                    </script>
                    <div class="fb-like hidden-sm hidden-xs" data-layout="standard" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                    <div class="fb-like hidden-lg hidden-md" data-layout="button_count" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                {/if}
            </div>
        {/if}
    {/foreach}
{/if}
