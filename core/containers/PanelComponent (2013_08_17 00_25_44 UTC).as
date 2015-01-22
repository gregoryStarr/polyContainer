//
import flash.geom.ColorTransform;
import com.abazaba.core.view.shape.MCRect;
import com.abazaba.core.view.utilities.*;
import com.abazaba.core.vo.style.Theme
import mx.utils.Delegate;
import mx.events.EventDispatcher;



class com.abazaba.core.view.containers.PanelComponent extends MovieClip{
	private var mc:MovieClip,innerMC:MovieClip,boundingBox:MovieClip;
	
	private var rect:MCRect,innerRect:MCRect;
	private var colorObj,strokeObj,glowObj,innerGlowObj,blurObj,innerBlurObj,filterObj;
	private var __STYLECOLLECTION:Array;
	public var theme:Theme;
	public var _margins,_padding,_border,_corners,_stroke;
	public var headerLabel:Object,_headerButton;
	public var panelTitle:TextField;
	public var __width, __height
	public var origin;
	
	
	// Remove later:
	
	
	// ................................................................
	// @ 
	public function PanelComponent(){
		init();
		cacheAsBitmap=true;
	}

	// ................................................................
	// @ 
	public function init(){
		__width=boundingBox._width;
		__height=boundingBox._height
		_padding={}
		createChildren();
		setSize(__width,__height);
		
	}

	// ................................................................
	// @
	public function createChildren(){
		
		rect=drawPaneShape("rect");
		innerRect=drawPaneShape("innerRect");
		
		boundingBox._visible=false;
		applyTheme(getTheme())
	}
	
	// ................................................................
	// @
	public function drawPaneShape(name){
		return  this.attachMovie("com.abazaba.core.view.shape.MCRect",name+"MC",this.getNextHighestDepth());
	}
	

	// ................................................................
	// @ 
	public function render(){
		rect.redraw();
		innerRect.redraw();


		rect.applyFilter("glow",glowObj)
		innerRect.applyFilter("glow",innerGlowObj)
	}
	
	
	// ................................................................
	// @ 
	public function setSize(w,h){
		width=w;
		height=h;
		render();
	}
	
	// ................................................................
	// @ 
	public function refresh(){
		setSize(__width,__height);
		render();
		
	}
	
	/* ############################################################### */
	/*							Publlic Operator Methods						   	   */
	/* ############################################################### */		
	
	// ................................................................
	// @ 
	public function getTheme(themeProvider){
		
		var theme:Theme=(themeProvider!=undefined)?themeProvider:new Theme();
		
		return theme;
	}
	
	
	
	
	public function applyPaneStyle(themeObj){applyTheme(themeObj)}
	// ................................................................
	// @ 
	public function applyTheme(theme)
	{
		for(var i in theme){
			if(theme[i]==undefined){i++}
			this[i]=theme[i];
			//__STYLECOLLECTION.push(theme[i])
		}
		
		this.refresh ();
	}

	// ................................................................
	// @ 
	public function dumpThemeSettings(){
		var styleTmp={}
		//trace("Dumping Theme Settings!!!")
		//trace("------------------------------------------")
		for(var i in this){
			//trace("		"+(this._name+ i) + '=' + this[i])
		}
		//trace("------------------------------------------")
		
		return this;
	}
	


	public function mkPaddingObject(){
		paddingLeft=4;
		paddingRight=4;
		paddingTop=4;
		paddingBtm=4;
		padding.margins=_margins=4;

		return _padding;
	}
	
	
	// BEGIN INITAL STYLING SETTING METHODS
	public function mkStrokeObject(){
		strokeObj={}
		_border=.5;
		_corners=4;
		
		strokeObj={}
		strokeObj.corners=corners;
		strokeObj._border=_border;
		strokeObj.strokeThickness=strokeThickness=1;
		strokeObj.strokeColor=strokeColor=0xffffff;
		strokeObj.strokeAlpha=strokeAlpha=100;
		strokeObj.cornerRadius=cornerRadius=6;
	}
	
	public function mkColorObject(){
		colorObj.color=color=[0xcccccc,0x666666];
		colorObj.innerColor=innerColor=[0xcccccc,0x666666];
		
		colorObj.alpha=alpha=[100,100]
		colorObj.innerAlpha=innerAlpha=[0,0];
		
		colorObj.gradRatios=gradRatios[0,50];
		colorObj.innerGradRatios=innerGradRatios=[0,50];
		colorObj.ratios=[gradRatios,innerGradRatios];
		
		colorObj.blend=blend="normal";
		colorObj.innerBlend=innerBlend="normal";
		return colorObj;
	}
	
	
	
	public function convertValue(value){
		if(typeof(value)=="string"){
			var strResult=value.split("|");
			if(strResult.length<=0){
				return value;
			}
			
			
			
			//trace("Converted Values for "+this+" \n--------------------------------\n	"+strResult[0]+" &  "+strResult[1]+"\n-------------------------------\n")
			return [strResult[0],strResult[1]];
		}
		
		
		if(typeof(value)=="array"){return value}
	}
	
	public function arrayToString(value){return value.join("|")}
	
	
	
	public function mkFilterObject(){
		// ------------------------
		glowObj={}
			glowObj.color=0xffffff;
			glowObj.alpha=100;
			glowObj.blurX=glowObj.blurY=0
			glowObj.strength=10;
			glowObj.quality=5;
			glowObj.inner=false;
			glowObj.knockout=false;
			
		innerGlowObj={}
			innerGlowObj.color=0x000000;
			innerGlowObj.alpha=100;
			innerGlowObj.blurX=innerGlowObj.blurY=2;
			innerGlowObj.strength=5;
			innerGlowObj.quality=5;
			innerGlowObj.inner=false;
			innerGlowObj.knockout=false;
			
			
		innerBlurObj={}
			innerBlurObj.color=0x000000;
			innerBlurObj.alpha=100;
			innerBlurObj.blurX=innerBlurObj.blurY=10;
			innerBlurObj.strength=5;
			innerBlurObj.quality=5;
			innerBlurObj.inner=false;
			innerBlurObj.knockout=false;
		blurObj={}
			blurObj.color=0x000000;
			blurObj.alpha=100;
			blurObj.blurX=innerBlurObj.blurY=10;
			blurObj.strength=5;
			blurObj.quality=5;
			blurObj.inner=false;
			blurObj.knockout=false;
		
		// Populate filterObject
		filterObj={}
		filterObj.glowObj=glowObj;
		filterObj.innerGlowObj=innerGlowObj;
		filterObj.innerBlurObj=innerBlurObj;
		filterObj.blurObj=blurObj;
		return filterObj;
	}
	// END INITIAL STYLE SETTING METHODS
	
	// ................................................................
	// @ 
	private function hasPanelProps(target){
		if(target.width && target.height){
			return true;
		}
	}
	
	// ................................................................
	// @
	public function setStyle(style,value){
		if(style && value ){this[style]=value}else{return false}
	}

	// ................................................................
	// @
	public function get blend(){return rect.blendMode}
	public function set blend(value){rect.blendMode=value}
	
	// ................................................................
	// @	
	public function get innerBlend(){return innerRect.blendMode}
	public function set innerBlend(value){innerRect.blendMode=value}
	
	// ................................................................
	// @ 
	public function get width(){return __width}
	public function set width(value){
		
		__width=value;
		rect.setSize(value,__height);
		
		innerRect.width=__width-paddingLeft-paddingRight;
		innerRect._x=paddingLeft;
		//trace("Setting Width From Panel: "+(innerRect.width));
		//refresh(); <-- Causes 256 execution error
		render()
	}

	// ................................................................
	// @ 
	public function get height(){return __height}
	public function set height(value){
		
		__height=value;
		rect.setSize(__width,value);
			
		innerRect.height=__height-paddingTop-paddingBtm;
		innerRect._y=paddingTop;
		//trace("Setting Height  From Panel"+(innerRect.height));
		//refresh(); <-- Causes 256 execution error
		render();
	}
	
	// ................................................................
	// @ 
	public function center(target){
		//trace("centering");
		var targetWidth=(target.width!=undefined)?target.width:target._width
		var targetHeight=(target.height!=undefined)?target.height:target._height
		
		this._x=(targetWidth-this.width)/2;
		this._y=(targetHeight-this.height)/2;
		//refresh();

	};	
	
	
	// ................................................................
	// :
	public function get innerHeight(){return innerRect.height}
	
	// ................................................................
	// :
	public function get innerWidth(){return  innerRect.width}
	
	
	// ................................................................
	// @ 
	public function set color(value){
		//trace("Changing Color: "+value);
		//if(value==undefined){value=[0x222222,0xcccccc]}
		if( value!=undefined ) { 
			value=convertValue(value);
			rect.color=value;
			//refresh();
		}
		 
		return;
	}

	// ................................................................
	// @ 
	public function set innerColor(value){
		//trace("Changing innerColor: "+colorObj);
		if( value!=undefined ) {
			value=convertValue(value);
			innerRect.color=value;
			//refresh();
		}
		 
		return;
	}
	
	
	public function set ratios(value){
		//value=convertValue(value)
		//if(value==undefined){value=[0,255]}
		if( value!=undefined ) {
			gradRatios=value[0];
			innerGradRatios=value[1];
			//refresh();
		}
		 
		return;
	}
	
	
	// ................................................................
	// @ 
	public function set gradRatios(value){
		//trace("Changing gradRatios: "+value)
		//if(value==undefined){value=[0,255]}
		if( value!=undefined ) {
			value=convertValue(value)
			rect.ratios=value;
			//refresh();
		}
		 
		return;
	}

	// ................................................................
	// @ 
	public function set innerGradRatios(value){
		//trace("Changing innerGradRatios: "+value)
		//if(value==undefined){value=[0,255]}
		if( value!=undefined ) {
		
			value=convertValue(value);
			innerRect.ratios=value;
			//refresh();
		}
		 
		return;
	
	}
	
	// ................................................................
	// @ 
	public function set alpha(value){
		//trace("Changing backgroundAlpha: "+value)
		//if(value==undefined){value=[100,100]}
		if( value!=undefined ) {
			value=convertValue(value);
			rect.alpha=value;
			
			//refresh();
		}
		 
		return;
	}

	
	// ................................................................
	// @ 
	public function set innerAlpha(value){
		//trace("Changing innerAlpha"+colorObj)
		//if(value==undefined){value=[100,100]}
		if( value!=undefined ) {
			value=convertValue(value)
			
			innerRect.alpha=value
			//refresh();
		}
		 
		return;
	}
	
	
	// ................................................................
	// @ 
	public function set strokeThickness(value){
		rect.strokeThickness=value;
		//refresh();
	}
	
	// ................................................................
	// @ 
	public function set strokeColor(value){
		rect.strokeColor=value;
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function set strokeAlpha(value){
		rect.strokeAlpha=value;
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function set innerStrokeThickness(value){
		innerRect.strokeThickness=value;
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function set innerStrokeColor(value){
		innerRect.strokeColor=value;
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function set innerStrokeAlpha(value){
		innerRect.strokeAlpha=value;
		//refresh();
	}
	


	// ................................................................
	// @ 
	public function get padding(){return _padding}
	public function set padding(value){
		_padding.left=value;
		_padding.right=value;
		_padding.top=value;
		_padding.btm=value;
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function get paddingBtm(){return _padding.btm}
	public function set paddingBtm(value){
		_padding.btm=value;
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function get paddingLeft(){return _padding.left}
	public function set paddingLeft(value){
		_padding.left=value;
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function get paddingRight(){return _padding.right}
	public function set paddingRight(value){
		_padding.right=value;
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function get paddingTop(){return _padding.top}
	public function set paddingTop(value){
		_padding.top=value;
		//refresh();
	}
	
	
	
	// ................................................................
	// @ 
	public function get margins(){return _margins}
	public function set margins(value){
		_margins=value;
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function get corners(){return _corners}
	public function set corners(value){
		_corners=value;
		rect.cornerRadius=value;
		innerRect.cornerRadius=value;
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function get cornerRadius(){return rect.cornerRadius}
	public function set cornerRadius(value){
		rect.cornerRadius=value;
		//refresh();
	}
	
	
	
	// ................................................................
	// @ 
	public function get innerCornerRadius(){return innerRect.cornerRadius}
	public function set innerCornerRadius(value){
		innerRect.cornerRadius=value;
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function get glowStrength(){return glowObj.strength}
	public function set glowStrength(value){
		glowObj.strength=value;
		glowObj.blurY=value;
		glowObj.blurX=value;
		rect.applyFilter("glow",glowObj);
		//refresh();
	}
	
	
	// ................................................................
	// @ 
	public function get glowBlurX(){return glowObj.blurX}
	public function set glowBlurX(value){
		glowObj.blurX=value;
		rect.applyFilter("glow",glowObj);
		//refresh();
	}
	
	// ................................................................
	// @ 
	public function get glowBlurY(){return glowObj.blurY}
	public function set glowBlurY(value){
		glowObj.blurY=value;
		rect.applyFilter("glow",glowObj);
		//refresh();
	}
		
		
	// ................................................................
	// @ 
	public function get glowColor(){return glowObj.color}
	public function set glowColor(value){
		glowObj.color=value;
		rect.applyFilter("glow",glowObj);
		//refresh();
	}	
	
	// ................................................................
	// @ 
	public function get innerGlowColor(){return innerGlowObj.color}
	public function set innerGlowColor(value){
		innerGlowObj.color=value;
		innerRect.applyFilter("glow",innerGlowObj);
		//refresh();
	}


	// ................................................................
	// @ 
	public function get innerGlowStrength(){return innerGlowObj.strength}
	public function set innerGlowStrength(value){
		innerGlowObj.strength=value;
		innerGlowObj.blurY=value;
		innerGlowObj.blurX=value;
		innerRect.applyFilter("glow",innerGlowObj);
		//refresh();
	}


	// ................................................................
	// @ 
	public function get innerGlowAlpha(){return innerGlowObj.alpha}
	public function set innerGlowAlpha(value){
		innerGlowObj.alpha=value;
		innerRect.applyFilter("glow", innerGlowObj);
		//refresh()
	}


	// ................................................................
	// @ 
	public function get glowDirection(){return glowObj.inner}
	public function set glowDirection(value){
		glowObj.inner=value;
		rect.applyFilter("glow", glowObj);
		//refresh();
	}


	// ................................................................
	// @ 
	public function get innerGlowDirection(){return innerGlowObj.inner}
	public function set innerGlowDirection(value){
		innerGlowObj.inner=value;
		innerRect.applyFilter("glow", innerGlowObj);
		//refresh();
	}


	// ................................................................
	// @ 
	public function get innerGlowBlurX(){return  innerGlowObj.blurX}
	public function set innerGlowBlurX(value){
		 innerGlowObj.blurX=value;
		innerRect.applyFilter("glow", innerGlowObj);
		//refresh();
	}


	// ................................................................
	// @ 
	public function get innerGlowBlurY(){return innerGlowObj.blurY}
	public function set innerGlowBlurY(value){
		 innerGlowObj.blurY=value;
		innerRect.applyFilter("glow", innerGlowObj);
		//refresh();
	}


	// ................................................................
	// @ 
	public function get blurX(){return blurObj.blurX}
	public function set blurX(value){
		//trace("Setting BlurX: "+blurObj)
		blurObj.blurX=value;
		rect.applyFilter("blur",blurObj);
		//refresh();
	}


	// ................................................................
	// @ 
	public function get blurY(){return blurObj.blurY}
	public function set blurY(value){
		//trace("Setting BlurY: "+blurObj);
		blurObj.blurY=value;
		rect.applyFilter("blur",blurObj);
		//refresh();
	}


	// ................................................................
	// @ 
	public function get innerBlurX(){return innerBlurObj.blurX}
	public function set innerBlurX(value){
		//trace("Setting innerBlurX: "+blurObj)
		innerBlurObj.blurX=value;
		innerRect.applyFilter("blur",innerBlurObj);
		//refresh();
	}



	// ................................................................
	// @ 
	public function get innerBlurY(){return innerBlurObj.blurY}
	public function set innerBlurY(value){
		//trace("Setting innerBlurY: "+blurObj);
		innerBlurObj.blurY=value;
		innerRect.applyFilter("blur",innerBlurObj);
		//refresh();
	}

	// EOClass

	
}
