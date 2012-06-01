https://github.com/FortAwesome/Font-Awesome/issues/38

IE 7 support for icons in bootstrap
No milestone
No one is assigned
While @font-face is technically supported in older versions of IE, the use of the :before selector is not supported and so setting icons in buttons for bootstrap using the default technique (relying on :before and content) does not work. After considerable research, the simplest solution we found was to create an ie7 specific css file using an expression. We did not test in versions prior to IE 7 but theoretically it should work for at least some of them. I used a regex in my text editor to modify the icon list and then added a couple of required css classes to fix things up.

Here is how it works:

<!--[if IE 7]><link rel="stylesheet" href="/stylesheets/font-awesome-ie7.css"><![endif]-->
font-awesome-ie7.css contents:

[class^="icon-"],
[class*=" icon-"] {
    font-family: FontAwesome;
    font-style: normal;
    font-weight: normal;
}

.icon-large {
    font-size: 1.3333em;
}


.icon-glass { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf000;&nbsp;'); }
.icon-music { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf001;&nbsp;'); }
.icon-search { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf002;&nbsp;'); }
.icon-envelope { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf003;&nbsp;'); }
.icon-heart { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf004;&nbsp;'); }
.icon-star { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf005;&nbsp;'); }
.icon-star-empty { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf006;&nbsp;'); }
.icon-user { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf007;&nbsp;'); }
.icon-film { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf008;&nbsp;'); }
.icon-th-large { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf009;&nbsp;'); }
.icon-th { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf00a;&nbsp;'); }
.icon-th-list { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf00b;&nbsp;'); }
.icon-ok { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf00c;&nbsp;'); }
.icon-remove { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf00d;&nbsp;'); }
.icon-zoom-in { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf00e;&nbsp;'); }

.icon-zoom-out { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf010;&nbsp;'); }
.icon-off { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf011;&nbsp;'); }
.icon-signal { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf012;&nbsp;'); }
.icon-cog { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf013;&nbsp;'); }
.icon-trash { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf014;&nbsp;'); }
.icon-home { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf015;&nbsp;'); }
.icon-file { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf016;&nbsp;'); }
.icon-time { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf017;&nbsp;'); }
.icon-road { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf018;&nbsp;'); }
.icon-download-alt { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf019;&nbsp;'); }
.icon-download { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf01a;&nbsp;'); }
.icon-upload { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf01b;&nbsp;'); }
.icon-inbox { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf01c;&nbsp;'); }
.icon-play-circle { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf01d;&nbsp;'); }
.icon-repeat { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf01e;&nbsp;'); }

.icon-refresh { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf021;&nbsp;'); }
.icon-list-alt { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf022;&nbsp;'); }
.icon-lock { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf023;&nbsp;'); }
.icon-flag { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf024;&nbsp;'); }
.icon-headphones { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf025;&nbsp;'); }
.icon-volume-off { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf026;&nbsp;'); }
.icon-volume-down { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf027;&nbsp;'); }
.icon-volume-up { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf028;&nbsp;'); }
.icon-qrcode { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf029;&nbsp;'); }
.icon-barcode { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf02a;&nbsp;'); }
.icon-tag { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf02b;&nbsp;'); }
.icon-tags { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf02c;&nbsp;'); }
.icon-book { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf02d;&nbsp;'); }
.icon-bookmark { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf02e;&nbsp;'); }
.icon-print { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf02f;&nbsp;'); }

.icon-camera { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf030;&nbsp;'); }
.icon-font { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf031;&nbsp;'); }
.icon-bold { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf032;&nbsp;'); }
.icon-italic { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf033;&nbsp;'); }
.icon-text-height { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf034;&nbsp;'); }
.icon-text-width { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf035;&nbsp;'); }
.icon-align-left { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf036;&nbsp;'); }
.icon-align-center { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf037;&nbsp;'); }
.icon-align-right { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf038;&nbsp;'); }
.icon-align-justify { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf039;&nbsp;'); }
.icon-list { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf03a;&nbsp;'); }
.icon-indent-left { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf03b;&nbsp;'); }
.icon-indent-right { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf03c;&nbsp;'); }
.icon-facetime-video { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf03d;&nbsp;'); }
.icon-picture { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf03e;&nbsp;'); }

.icon-pencil { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf040;&nbsp;'); }
.icon-map-marker { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf041;&nbsp;'); }
.icon-adjust { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf042;&nbsp;'); }
.icon-tint { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf043;&nbsp;'); }
.icon-edit { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf044;&nbsp;'); }
.icon-share { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf045;&nbsp;'); }
.icon-check { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf046;&nbsp;'); }
.icon-move { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf047;&nbsp;'); }
.icon-step-backward { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf048;&nbsp;'); }
.icon-fast-backward { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf049;&nbsp;'); }
.icon-backward { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf04a;&nbsp;'); }
.icon-play { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf04b;&nbsp;'); }
.icon-pause { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf04c;&nbsp;'); }
.icon-stop { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf04d;&nbsp;'); }
.icon-forward { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf04e;&nbsp;'); }

.icon-fast-forward { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf050;&nbsp;'); }
.icon-step-forward { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf051;&nbsp;'); }
.icon-eject { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf052;&nbsp;'); }
.icon-chevron-left { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf053;&nbsp;'); }
.icon-chevron-right { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf054;&nbsp;'); }
.icon-plus-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf055;&nbsp;'); }
.icon-minus-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf056;&nbsp;'); }
.icon-remove-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf057;&nbsp;'); }
.icon-ok-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf058;&nbsp;'); }
.icon-question-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf059;&nbsp;'); }
.icon-info-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf05a;&nbsp;'); }
.icon-screenshot { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf05b;&nbsp;'); }
.icon-remove-circle { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf05c;&nbsp;'); }
.icon-ok-circle { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf05d;&nbsp;'); }
.icon-ban-circle { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf05e;&nbsp;'); }

.icon-arrow-left { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf060;&nbsp;'); }
.icon-arrow-right { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf061;&nbsp;'); }
.icon-arrow-up { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf062;&nbsp;'); }
.icon-arrow-down { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf063;&nbsp;'); }
.icon-share-alt { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf064;&nbsp;'); }
.icon-resize-full { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf065;&nbsp;'); }
.icon-resize-small { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf066;&nbsp;'); }
.icon-plus { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf067;&nbsp;'); }
.icon-minus { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf068;&nbsp;'); }
.icon-asterisk { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf069;&nbsp;'); }
.icon-exclamation-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf06a;&nbsp;'); }
.icon-gift { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf06b;&nbsp;'); }
.icon-leaf { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf06c;&nbsp;'); }
.icon-fire { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf06d;&nbsp;'); }
.icon-eye-open { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf06e;&nbsp;'); }

.icon-eye-close { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf070;&nbsp;'); }
.icon-warning-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf071;&nbsp;'); }
.icon-plane { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf072;&nbsp;'); }
.icon-calendar { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf073;&nbsp;'); }
.icon-random { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf074;&nbsp;'); }
.icon-comment { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf075;&nbsp;'); }
.icon-magnet { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf076;&nbsp;'); }
.icon-chevron-up { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf077;&nbsp;'); }
.icon-chevron-down { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf078;&nbsp;'); }
.icon-retweet { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf079;&nbsp;'); }
.icon-shopping-cart { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf07a;&nbsp;'); }
.icon-folder-close { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf07b;&nbsp;'); }
.icon-folder-open { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf07c;&nbsp;'); }
.icon-resize-vertical { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf07d;&nbsp;'); }
.icon-resize-horizontal { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf07e;&nbsp;'); }

.icon-bar-chart { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf080;&nbsp;'); }
.icon-twitter-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf081;&nbsp;'); }
.icon-facebook-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf082;&nbsp;'); }
.icon-camera-retro { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf083;&nbsp;'); }
.icon-key { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf084;&nbsp;'); }
.icon-cogs { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf085;&nbsp;'); }
.icon-comments { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf086;&nbsp;'); }
.icon-thumbs-up { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf087;&nbsp;'); }
.icon-thumbs-down { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf088;&nbsp;'); }
.icon-star-half { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf089;&nbsp;'); }
.icon-heart-empty { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf08a;&nbsp;'); }
.icon-signout { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf08b;&nbsp;'); }
.icon-linkedin-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf08c;&nbsp;'); }
.icon-pushpin { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf08d;&nbsp;'); }
.icon-external-link { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf08e;&nbsp;'); }

.icon-signin { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf090;&nbsp;'); }
.icon-trophy { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf091;&nbsp;'); }
.icon-github-sign { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf092;&nbsp;'); }
.icon-upload-alt { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf093;&nbsp;'); }
.icon-lemon { *zoom: expression( this.runtimeStyle['zoom'] = "1", this.innerHTML = '&#xf094;&nbsp;'); }
9 participants                  

 davegandy commented 2 months ago
Interesting. I'll check this out as soon as I get a chance. Thanks a ton for the work!

 mohsen1 commented 2 months ago
Wow! This is really interesting. I can't find docs for zoom: expression(). Can you provide a link?

 pagameba commented 2 months ago
I think the main docs are http://msdn.microsoft.com/en-us/library/ms537634.aspx. Expressions can be used anywhere in CSS, its not just 'zoom', using zoom or *zoom is really a hack to avoid other browsers from trying to interpret the expression.  There are numerous examples of using expression to solve various problems.  I used it to support PNG24s in IE 6,

/* css */
.png24{filter:expression(applyPNGFilter(this))}

/* javascript */
applyPNGFilter = function(o) {
    var t = 'a_pixel.png',
        s;
    if (o.src != t) {
        s = o.src;
        o.src = t;
        o.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + s + "',sizingMethod='scale')";
    }
}

Applying a class of 'png24' to any image would, in IE 6 (because I used an if IE conditional to define the style) cause a PNG 24 image to load correctly.  I can't recall the inspiration for this hack but it was wonderful at the time :)

Hope this helps

Paul
Show quoted text

 onlinedev commented a month ago
Great work by Paul. I also observed issues with rendering of font awesome icons with buttons. However, I saw the issue both in the IE7 and IE8. What was your experience with IE8. Will the solution you described above work with IE8 as well?

Is the above fix likely to be included in the future release of font awesome?

 fredrock commented a month ago
IE 8 supports :before and :after, so you don't need to use the expressions with it.

 onlinedev commented a month ago
Thanks Fred for your response

 arnars commented 24 days ago
How would you actually reference the different icons? In the above example it is only squares. I am able to get content into the i-tag by using the above code, but when I try to put in content as from the font awesome reference i am only able to output squares or 'real' letters.

 pagameba commented 24 days ago
ah I see - the part where it has the little square above is supposed to be a hex code as per the original fontawesome styles, I'm updated the original with correct markdown (I hope).

 arnars commented 24 days ago
Yes. Thank you so much. It is not working for me yet, as I am having troubles getting IE7 to load the damn font face. However now I am able to rule out the fact that my innerHTML content was wrong.

 parkerault commented 13 days ago
If I remember correctly IE recalculates CSS expression properties on scroll, resize, and redraw events, which can have a significant impact on performance depending on the complexity of the expression. I believe a JS polyfill would be a better solution in this case.

 pagameba commented 12 days ago
It probably would, but is it worth the effort? I have not yet seen or been able to find a polyfill that provides IE < 8 CSS pseudo element support for :before and :after. The expression in this case is pretty minimal and if the use of icons is not extensive then the performance impact is probably minimal. I really think this is the expedient solution that can easily be automated as part of the build and in this case is completely sufficient, but if someone can craft or find an appropriate polyfill then by all means it should be used.

 schourode commented 11 days ago
Dean Ewdards' "IE7.js" project adds support for :before and :after to IE6 and IE7. Unfortunately, the library doesn't seem built in a way that allows one to get just this polyfill, without doing some serious hacking.

 pagameba commented 11 days ago
It looks like you would need at least IE8.js to get the right stuff. I had a cursory pass through the code, the comments certainly indicate that it adds support for :before and :after. I didn't test to see if this performs the task correctly for FontAwesome, nor if it would be better (performance) than the expression hack proposed in this issue. One advantage obviously is that the IE8.js solution requires no changes to FontAwesome. It may also bring along some other desirable polyfills. The disadvantage is that it is 37k compressed (not gzipped though) compared to a (potentially) very much smaller file with the expression hack approach.

 schourode commented 11 days ago
I agree that bundling IE8.js with Font-Awesome just to polyfill :before and :after is overkill. When I mentioned the library, it was mainly to inform that such polyfix exists.

In most of the projects I work on, IE8.js or IE9.js is already included, and thus Font Awesome should work out of the box. So I thought. Today I tried it out, and it turns out that the polyfix has an issue with escaped unicode literals, used extensively in Font-Awesome. I have figured out a workaround for this issue (documented in the bug report), which may be useful for others playing with Font-Awesome and IE8.js together.

IMHO, the expression hack seems to be a better way to provide "official" IE7 support for Font-Awesome.

 Synchro commented 3 days ago
Any particular reason for the &nbsp;s? The stock fontawesome doesn't add a space, and though it's often needed, it's not always, for example if the icons are used by themselves on toolbar buttons. Removing them seems to work ok.

 pagameba commented 3 days ago
I can't recall why we decided the   was needed but I seem to recall that it was at least for how we were using it - I suspect we used labels with them, that might cause the need? I also vaguely recall a change in bootstrap regarding whitespace also - perhaps that was related, I'm pretty sure at one time a bunch of specific whitespace was needed for some elements and they fixed that.