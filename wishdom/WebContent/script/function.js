window.onload=function(){
	$('#about').onmouseover=function(){
		$('#div-a-about').style.display='block';
	};
	$('#about').onmouseout=function(){
		$('#div-a-about').style.display='none';
	};
	$('#art').onmouseover=function(){
		$('#div-a-art').style.display='block';
	};
	$('#art').onmouseout=function(){
		$('#div-a-art').style.display='none';
	};	
	var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
	var veiwHeight = document.documentElement.clientHeight;
	
	// 800 1550 2200 2800
};

	
var timer = null;
function startMoveScroll(iTarget){
		clearInterval(timer);
		timer = setInterval(function(){
			var bBtn = true;
			var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
			var iSpeed = (iTarget - scrollY)/6;
			iSpeed = Math.floor(iSpeed);
			if(scrollY != iTarget){
				bBtn = false;
			}
			document.documentElement.scrollTop = document.body.scrollTop = scrollY + iSpeed;
			window.onscroll = function(){
				if(bBtn){
					clearInterval(timer);
				}
				else{
					bBtn = true;
				}
			}
		},30);
}
	
	




function startMove(obj,json,fn){
		clearInterval(obj.timer);
		obj.timer = setInterval(function(){
		
			var bBtn = true;
		
			for(var attr in json){
			
				var iCur = 0;
				if(attr == 'opacity'){
					iCur = Math.round(parseFloat(getStyle(obj,attr))*100);
				}
				else{
					iCur = parseInt(getStyle(obj,attr));
				}
				
				var iSpeed = (json[attr] - iCur)/8;
				iSpeed = iSpeed>0 ? Math.ceil(iSpeed) : Math.floor(iSpeed);
				
				if(iCur != json[attr]){
					bBtn = false;
				}
				
				if(attr == 'opacity'){
					obj.style.filter = 'alpha(opacity='+(iCur+iSpeed)+')';
					obj.style.opacity = (iCur+iSpeed)/100;
				}
				else{
					obj.style[attr] = (iCur+iSpeed) + 'px';
				}
				
			
			}
			
			if(bBtn){
				clearInterval(obj.timer);
				
				if(fn){
					fn.call(obj);
				}
				
			}
			
			
		
		},30);
	}	
function getStyle(obj,attr){
		if(obj.currentStyle){
			return obj.currentStyle[attr];
		}
		else{
			return getComputedStyle(obj,false)[attr];
		}
	}
	
function stopMove(obj){
		clearInterval(obj.timer);
	}






















