YUI.add("series-spline-stacked",function(e,t){e.StackedSplineSeries=e.Base.create("stackedSplineSeries",e.SplineSeries,[e.StackingUtil],{setAreaData:function(){e.StackedSplineSeries.superclass.setAreaData.apply(this),this._stackCoordinates.apply(this)}},{ATTRS:{type:{value:"stackedSpline"}}})},"patched-dev-3.x",{requires:["series-stacked","series-spline"]});