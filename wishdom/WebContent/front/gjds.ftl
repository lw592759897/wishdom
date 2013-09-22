<#include "/include/head.ftl">
<title>智慧金-国匠大师</title>
<!-- index-top over -->
		<#if master?exists>
			${master.CONTENT!}
		</#if>
		<script src="${contextPath!}/script/min-master.js"></script>
		<script src="${contextPath!}/script/jquery.easing.1.3.js"></script>
       <script type="text/javascript">
			$(function() {
					var $menu	= $('#ei_menu > ul'),
					$menuItems	= $menu.children('li'),
					$menuItemsImgWrapper= $menuItems.children('a'),
					$menuItemsPreview	= $menuItemsImgWrapper.children('.ei_preview'),
					totalMenuItems	= $menuItems.length,
					ExpandingMenu = (function(){
						var current = 0,
						anim	= true,
						validCurrent = function() {
							return (current >= 0 && current < totalMenuItems);
						},
						init				= function() {
							if(validCurrent())
								configureMenu();

							initEventsHandler();
						},
						configureMenu		= function() {
							var $item	= $menuItems.eq(current);
							if(anim)
								slideOutItem($item, true, 900, 'easeInQuint');
							else{
								$item.css({width : '800px'})
								.find('.ei_image')
								.css({left:'0px', opacity:1});
									$menuItems.not($item)
											  .children('.ei_preview')
											  .css({opacity:0.2});
							}
						},
						initEventsHandler	= function() {
								
							$menuItemsImgWrapper.bind('click.ExpandingMenu', function(e) {
								var $this 	= $(this).parent(),
								idx		= $this.index();

								if(current === idx) {
									slideOutItem($menuItems.eq(current), false, 1500, 'easeOutQuint', true);
									current = -1;
								}
								else{
									if(validCurrent() && current !== idx)
											slideOutItem($menuItems.eq(current), false, 250, 'jswing');

									current	= idx;
										slideOutItem($this, true, 250, 'jswing');
								}
								return false;
							});
						},
							openItem			= function(idx) {
								$menuItemsImgWrapper.eq(idx).click();
							},
							slideOutItem		= function($item, dir, speed, easing, mLeave) {
							var $ei_image	= $item.find('.ei_image'),
							itemParam	= (dir) ? {width : '800px'} : {width : '51px'},
							imageParam	= (dir) ? {left : '0px'} : {left : '51px'};
							if(dir)
							$menuItemsPreview.stop()
							.animate({opacity:1}, 1000);
							else if(mLeave)
								$menuItemsPreview.stop()
							.animate({opacity:1}, 1500);
							$item.stop().animate(itemParam, speed, easing);
							$ei_image.stop().animate(imageParam, speed, easing, function() {
									
								if(dir)
									$ei_image.animate({opacity:1}, 2000);
								else
									$ei_image.css('opacity', 0.2);
							});
						};
						return {
							init 		: init,
							openItem	: openItem
						};
					})(); 
				ExpandingMenu.init(); 
			});
        </script>
<#include "/include/foot.ftl">