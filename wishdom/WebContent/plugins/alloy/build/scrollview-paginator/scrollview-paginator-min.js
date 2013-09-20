YUI.add("scrollview-paginator",function(e,t){function g(){g.superclass.constructor.apply(this,arguments)}var n=e.ClassNameManager.getClassName,r="scrollview",i=n(r,"hidden"),s=n(r,"paged"),o=e.ScrollView?e.ScrollView.UI_SRC:"ui",u="index",a="scrollX",f="scrollY",l="total",c="disabled",h="host",p="selector",d="axis",v="x",m="y";e.extend(g,e.Plugin.Base,{initializer:function(e){var t=this,n=t.get(h);t._pageDims=[],t._pageBuffer=1,t._optimizeMemory=!1,t._host=n,t._bb=n._bb,t._cb=n._cb,t._cIndex=t.get(u),t._cAxis=t.get(d),e._optimizeMemory&&(t._optimizeMemory=e._optimizeMemory),e._pageBuffer&&(t._pageBuffer=e._pageBuffer),t._bindAttrs()},_bindAttrs:function(){var e=this;e.after({indexChange:e._afterIndexChange,axisChange:e._afterAxisChange}),e.beforeHostMethod("scrollTo",e._beforeHostScrollTo),e.beforeHostMethod("_mousewheel",e._beforeHostMousewheel),e.beforeHostMethod("_flick",e._beforeHostFlick),e.afterHostMethod("_onGestureMoveEnd",e._afterHostGestureMoveEnd),e.afterHostMethod("_uiDimensionsChange",e._afterHostUIDimensionsChange),e.afterHostMethod("syncUI",e._afterHostSyncUI),e.afterHostEvent("render",e._afterHostRender),e.afterHostEvent("scrollEnd",e._afterHostScrollEnded)},_afterHostRender:function(){var e=this,t=e._bb,n=e._host,r=e._cIndex,i=e._cAxis,o=e._getPageNodes(),u=o.size(),a=e._pageDims[r];i[m]?n._maxScrollX=a.maxScrollX:i[v]&&(n._maxScrollY=a.maxScrollY),e.set(l,u),r!==0&&e.scrollToIndex(r,0),t.addClass(s),e._optimize()},_afterHostSyncUI:function(){var e=this,t=e._host,n=e._getPageNodes(),r=n.size();e.set(l,r),e._cAxis===undefined&&e._set(d,t.get(d))},_afterHostUIDimensionsChange:function(){var e=this,t=e._host,n=t._getScrollDims(),r=n.offsetWidth,i=n.offsetHeight,s=e._getPageNodes();s.each(function(t,n){var s=t.get("scrollWidth"),o=t.get("scrollHeight"),u=Math.max(0,s-r),a=Math.max(0,o-i);e._pageDims[n]?(e._pageDims[n].maxScrollX=u,e._pageDims[n].maxScrollY=a):e._pageDims[n]={scrollX:0,scrollY:0,maxScrollX:u,maxScrollY:a,width:s,height:o}})},_beforeHostScrollTo:function(t,n,r,i,s){var o=this,u=o._host,a=u._gesture,f=o._cIndex,l=o._cAxis,c=o._getPageNodes(),h;return a&&(h=a.axis,h===m?t=null:n=null,l[h]===!1&&(s=c.item(f))),new e.Do.AlterArgs("new args",[t,n,r,i,s])},_afterHostGestureMoveEnd:function(){if(this._host._gesture.flick)return;var e=this,t=e._host,n=t._gesture,r=e._cIndex,i=e._cAxis,s=n.axis,o=s===v,a=n[o?"deltaX":"deltaY"],f=a>0,l=e._pageDims[r],c=l[o?"width":"height"]/2,h=Math.abs(a)>=c,p=i[s],d=t.rtl;p&&(h?e[d===f?"prev":"next"]():e.scrollToIndex(e.get(u)))},_beforeHostMousewheel:function(t){var n=this,r=n._host,i=r._bb,s=t.wheelDelta<0,o=n._cAxis;if(i.contains(t.target)&&o[m])return n[s?"next":"prev"](),t.preventDefault(),new e.Do.Prevent},_beforeHostFlick:function(t){if(this._host.get(c))return!1;if(this._host._isOutOfBounds())return new e.Do.Prevent;var n=this,r=n._host,i=r._gesture,s=n.get(d),o=t.flick,u=o.velocity,a=o.axis||!1,f=u<0,l=s[a],h=r.rtl;i&&(i.flick=o);if(l){n[h===f?"prev":"next"]();if(s[a])return new e.Do.Prevent}},_afterHostScrollEnded:function(){var e=this,t=e._host,n=e._cIndex,r=t.get(a),i=t.get(f),s=e._cAxis;s[m]?e._pageDims[n].scrollX=r:e._pageDims[n].scrollY=i,e._optimize()},_afterIndexChange:function(e){var t=this,n=t._host,r=e.newVal,i=t._pageDims[r],s=n._cAxis,u=t._cAxis;t._cIndex=r,s[v]&&s[m]&&(u[m]?(n._maxScrollX=i.maxScrollX,n.set(a,i.scrollX,{src:o})):u[v]&&(n._maxScrollY=i.maxScrollY,n.set(f,i.scrollY,{src:o}))),e.src!==o&&t.scrollToIndex(r)},_optimize:function(){if(!this._optimizeMemory)return!1;var e=this,t=e._cIndex,n=e._getStage(t);e._showNodes(n.visible),e._hideNodes(n.hidden)},_getStage:function(e){var t=this,n=t._pageBuffer,r=t.get(l),i=t._getPageNodes(),s=Math.max(0,e-n),o=Math.min(r,e+1+n);return{visible:i.splice(s,o-s),hidden:i}},_showNodes:function(e){e&&e.removeClass(i).setStyle("visibility","")},_hideNodes:function(e){e&&e.addClass(i).setStyle("visibility","hidden")},_getPageNodes:function(){var e=this,t=e._host,n=t._cb,r=e.get(p),i=r?n.all(r):n.get("children");return i},next:function(){var e=this,t=e._host,n=e._cIndex,r=n+1,i=e.get(l);if(t.get(c))return;if(r>=i)return;e.set(u,r)},prev:function(){var e=this,t=e._host,n=e._cIndex,r=n-1;if(t.get(c))return;if(r<0)return;e.set(u,r)},scrollTo:function(){return this.scrollToIndex.apply(this,arguments)},scrollToIndex:function(e,t,n){var r=this,i=r._host,s=r._getPageNodes().item(e),l=r._cAxis[v]?a:f,c=s.get(l===a?"offsetLeft":"offsetTop");t=t!==undefined?t:g.TRANSITION.duration,n=n!==undefined?n:g.TRANSITION.easing,r.set(u,e,{src:o}),r._showNodes(s),i.set(l,c,{duration:t,easing:n})},_axisSetter:function(t){if(e.Lang.isString(t))return{x:t.match(/x/i)?!0:!1,y:t.match(/y/i)?!0:!1}},_afterAxisChange:function(e){this._cAxis=e.newVal}},{NAME:"pluginScrollViewPaginator",NS:"pages",ATTRS:{axis:{setter:"_axisSetter",writeOnce:"initOnly"},selector:{value:null},index:{value:0},total:{value:0}},TRANSITION:{duration:300,easing:"ease-out"}}),e.namespace("Plugin").ScrollViewPaginator=g},"patched-dev-3.x",{requires:["plugin","classnamemanager"]});
