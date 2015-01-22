//
import net.lost.core.shape.PolyObject;
import mx.utils.Delegate;
import mx.events.EventDispatcher;
import net.lost.core.shape.PolyTheme;

class net.lost.core.containers.RoundedPolyContainer extends MovieClip{
	private var mc:MovieClip,innerMC:MovieClip,boundingBox:MovieClip;
	
	private var primaryPoly:PolyObject,polyContainer:PolyObject;
	private var colorObj,strokeObj,glowObj,innerGlowObj;
	public var THEME:PolyTheme;
	public var _margins,_padding,_border,_corners,_stroke;
	public var __width, __height
	
	// ................................................................
	// @ 
	public function RoundedPolyContainer(){
		init();
		cacheAsBitmap=true;
	}

	// ................................................................
	// @ 
	public function init(){
		__width=boundingBox._width;
		__height=boundingBox._height;
		
		boundingBox._width=boundingBox._height=0;
		boundingBox._visible=false;
		_padding={}
		glowObj={}
		innerGlowObj={}
		createChildren();
		setSize(__width,__height);
		
	}

	// ................................................................
	// @
	public function createChildren(){
		
		primaryPoly=mkPoly("primaryPoly");
		polyContainer=mkPoly("polyContainer");
		setSize(__width,__height)
	}
	
	// ................................................................
	// @
	public function mkPoly(name){
		return  this.attachMovie("net.lost.core.shape.PolyObject","_mc"+name,this.getNextHighestDepth());
	}
	
	
	// ................................................................
	// @ 
	public function getTheme(themeProvider:PolyTheme){
		THEME=(themeProvider!=undefined)?themeProvider:new PolyTheme();
		return THEME;
	}
	
	// ................................................................
	// @ 
	public function applyTheme()
	{
		
		
		
	}
	
	
	// ................................................................
	// @
	public function setStyle(style,value){
		if(style && value ){this[style]=value}else{return false}
	}
	
	
	// ................................................................
	// @ 
	public function redraw(){
		applyTheme();
		primaryPoly.redraw();
		polyContainer.redraw();		
	}
	
	
	// ................................................................
	// @ 
	public function setSize(w,h){
		width=w;
		height=h;
	}
	
	// ................................................................
	// @ 
	public function refresh(){
		applyTheme()
		setSize(__width,_height)
	}
	
	
	
		// ................................................................
	// @ 
	public function get width(){return __width}
	public function set width(value){
		value=( value!=undefined )?value:10;
		__width=value;
		primaryPoly.setSize(value,__height);
		
		polyContainer.width=__width-paddingLeft-paddingRight;
		polyContainer._x=paddingLeft;
		redraw()
	}

	// ................................................................
	// @ 
	public function get height(){return __height}
	public function set height(value){
		value=( value!=undefined )?value:10;
		__height=value;
		primaryPoly.setSize(__width,value);
			
		polyContainer.height=__height-paddingTop-paddingBtm;
		polyContainer._y=paddingTop;
		redraw()
	}
	
	// ................................................................
	// @ 
	public function center(target){
		//trace("centering");
		var targetWidth=(target.width!=undefined)?target.width:target._width
		var targetHeight=(target.height!=undefined)?target.height:target._height
		
		this._x=(targetWidth-this.width)/2;
		this._y=(targetHeight-this.height)/2;


	};	
	
	
	// ................................................................
	// :
	public function get innerHeight(){return polyContainer.height}
	
	// ................................................................
	// :
	public function get innerWidth(){return  polyContainer.width}
	
	
	
	/* ############################################################### */
	/*							Publlic Operator Methods						   	   */
	/* ############################################################### */		


	// ................................................................
	// @
	public function get blend(){return primaryPoly.blendMode}
	public function set blend(value){primaryPoly.blendMode=value}
	
	// ................................................................
	// @	
	public function get innerBlend(){return polyContainer.blendMode}
	public function set innerBlend(value){polyContainer.blendMode=value}
	

	// ................................................................
	// @ 
	public function set color(value){
		value=( value!=undefined )?value:null;
			outerColor=value;
			innerColor=value;
	}
	
	// ................................................................
	// @ 
	public function set outerColor(value){
		value=( value!=undefined )?value:null;
			primaryPoly.color=value;
	}

	// ................................................................
	// @ 
	public function set innerColor(value){
		trace("INNERCOLOR: "+value)
		value=( value!=undefined )?value:null;
			polyContainer.color=value;
	}
	
	
	public function set ratios(value){
		value=( value!=undefined )?value:null;
			gradRatios=value;
			innerGradRatios=value;
	}
	
	
	// ................................................................
	// @ 
	public function set gradRatios(value){
		value=( value!=undefined )?value:null;
		primaryPoly.ratios=value;
	}

	// ................................................................
	// @ 
	public function set innerGradRatios(value){
		value=( value!=undefined )?value:null;
		polyContainer.ratios=value;
	}
	
	// ................................................................
	// @ 
	public function set alphas(value){
		value=( value!=undefined )?value:null;
		alpha=value;
		innerAlpha=value;
	}
	
	// ................................................................
	// @ 
	public function set alpha(value){
		value=( value!=undefined )?value:null;
		primaryPoly.alpha=value;
	}

	
	// ................................................................
	// @ 
	public function set innerAlpha(value){
		value=( value!=undefined )?value:null;
		polyContainer.alpha=value;
	}
	
	
	public function set Strokes(strokeObject){
		strokeColor=innerStrokeColor=strokeObject.color;
		strokeAlpha=innerStrokeAlpha=strokeObject.alpha;
		strokeThickness=innerStrokeThickness=strokeObject.thickness;
	}
	
	
	// ................................................................
	// @ 
	public function set strokeThickness(value){
		primaryPoly.strokeThickness=value;
	}
	
	// ................................................................
	// @ 
	public function set strokeColor(value){
		primaryPoly.strokeColor=value;

	}
	
	
	// ................................................................
	// @ 
	public function set strokeAlpha(value){
		primaryPoly.strokeAlpha=value;

	}
	
	
	// ................................................................
	// @ 
	public function set innerStrokeThickness(value){
		polyContainer.strokeThickness=value;

	}
	
	
	// ................................................................
	// @ 
	public function set innerStrokeColor(value){
		polyContainer.strokeColor=value;

	}
	
	
	// ................................................................
	// @ 
	public function set innerStrokeAlpha(value){
		polyContainer.strokeAlpha=value;

	}
	


	// ................................................................
	// @ 
	public function get padding(){return _padding}
	public function set padding(value){
		value=( value!=undefined )?value:null;
		_padding.left=value;
		_padding.right=value;
		_padding.top=value;
		_padding.btm=value;
	}
	
	
	// ................................................................
	// @ 
	public function get paddingBtm(){return _padding.btm}
	public function set paddingBtm(value){
		_padding.btm=value;
	}
	
	
	// ................................................................
	// @ 
	public function get paddingLeft(){return _padding.left}
	public function set paddingLeft(value){
		_padding.left=value;
	}
	
	
	// ................................................................
	// @ 
	public function get paddingRight(){return _padding.right}
	public function set paddingRight(value){
		_padding.right=value;
	}
	
	
	// ................................................................
	// @ 
	public function get paddingTop(){return _padding.top}
	public function set paddingTop(value){
		_padding.top=value;
	}
	
	
	
	// ................................................................
	// @ 
	public function get margins(){return _margins}
	public function set margins(value){
		_margins=value;
	}
	
	
	// ................................................................
	// @ 
	public function get corners(){return _corners}
	public function set corners(value){

		_corners=value;
		primaryPoly.cornerRadius=value;
		polyContainer.cornerRadius=value;
	}
	
	
	// ................................................................
	// @ 
	public function get cornerRadius(){return primaryPoly.cornerRadius}
	public function set cornerRadius(value){
		primaryPoly.cornerRadius=value;
	}
	
	
	
	// ................................................................
	// @ 
	public function get innerCornerRadius(){return polyContainer.cornerRadius}
	public function set innerCornerRadius(value){
		polyContainer.cornerRadius=value;
	}
	
	
	// ................................................................
	// @ 
	public function get glowColor(){return glowObj.color}
	public function set glowColor(value){
		glowObj.color=value;
	}	
	
	// ................................................................
	// @ 
	public function get innerGlowColor(){return innerGlowObj.color}
	public function set innerGlowColor(value){
		innerGlowObj.color=value;
	}

	
	
	
	// ................................................................
	// @ 
	public function get glowStrength(){return glowObj.strength}
	public function set glowStrength(value){
		glowObj.strength=value;
		glowObj.blurY=value;
		glowObj.blurX=value;
	}
	
	

	// ................................................................
	// @ 
	public function get innerGlowStrength(){return innerGlowObj.strength}
	public function set innerGlowStrength(value){
		innerGlowObj.strength=value;
		innerGlowObj.blurY=value;
		innerGlowObj.blurX=value;
	}	
	
	// ................................................................
	// @ 
	public function get glowBlur(){return glowBlurX}
	public function set glowBlur(value){
		glowBlurX=value
		glowBlurY=value
	}
	
	
	// ................................................................
	// @ 
	public function get innerGlowBlur(){return innerGlowObj.blurX}
	public function set innerGlowBlur(value){
		innerGlowBlurX=value
		innerGlowBlurY=value
	}
	
	
	
	// ................................................................
	// @ 
	public function get glowBlurX(){return glowObj.blurX}
	public function set glowBlurX(value){
		glowObj.blurX=value;


	}
	
	// ................................................................
	// @ 
	public function get glowBlurY(){return glowObj.blurY}
	public function set glowBlurY(value){
		glowObj.blurY=value;


	}
		


	// ................................................................
	// @ 
	public function get innerGlowBlurX(){return  innerGlowObj.blurX}
	public function set innerGlowBlurX(value){
		 innerGlowObj.blurX=value;

	}


	// ................................................................
	// @ 
	public function get innerGlowBlurY(){return innerGlowObj.blurY}
	public function set innerGlowBlurY(value){
		 innerGlowObj.blurY=value;

	}


	// EOClass

	
}
