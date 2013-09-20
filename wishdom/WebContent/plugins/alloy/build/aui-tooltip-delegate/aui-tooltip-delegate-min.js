YUI.add("aui-tooltip-delegate",function(e,t){var n=e.Lang,r=e.config.doc,i="tooltip-delegate",s="align",o="container",u="duration",a="formatter",f="mouseenter",l="mouseleave",c="opacity",h="position",p="trigger",d="triggerHideEvent",v="triggerShowEvent",m="zIndex";e.TooltipDelegate=e.Base.create(i,e.Base,[],{items:null,tooltip:null,initializer:function(){var e=this;e._eventHandles=[],e.bindUI()},destructor:function(){var t=this;(new e.EventHandle(t._eventHandles)).detach()},bindUI:function(){var t=this,n,r;n=t.get(o),r=t.get(p),t._eventHandles.push(n.delegate(t.get(v),e.bind(t._onUserShowInteraction,t),r),n.delegate(t.get(d),e.bind(t._onUserHideInteraction,t),r))},getTooltip:function(){var t=this,n=t.tooltip;return n||(n=t.tooltip=new e.Tooltip({align:t.get(s),bindDOMEvents:!1,duration:t.get(u),formatter:t.get(a),opacity:t.get(c),position:t.get(h),visible:!1,zIndex:t.get(m)})),n},_onUserHideInteraction:function(){var e=this;e.getTooltip().hide()},_onUserShowInteraction:function(e){var t=this,n;n=e.currentTarget,t.getTooltip().render().set(p,n).show()}},{ATTRS:{align:{value:null},container:{setter:e.one,value:r,writeOnce:!0},duration:{value:.15,writeOnce:!0},formatter:e.Tooltip.ATTRS.formatter,opacity:{value:.8,writeOnce:!0},position:e.WidgetPositionAlignSuggestion.ATTRS.position,trigger:e.WidgetPositionAlignSuggestion.ATTRS.trigger,triggerHideEvent:{validator:n.isString,value:l,writeOnce:!0},triggerShowEvent:{validator:n.isString,value:f,writeOnce:!0},zIndex:{}}})},"2.0.0pr7",{requires:["node-event-delegate","aui-tooltip-base"]});
