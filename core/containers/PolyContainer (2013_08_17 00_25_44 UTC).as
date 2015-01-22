
import flash.geom.Matrix
class net.lost.core.containers.PolyContainer extends MovieClip{
	var mcName:String
	var backGround:MovieClip
	var _padding:Object
	var scope:MovieClip;
	var boundingBox:MovieClip;
	var children:Array;
	var _ratios:Array;
	var _matrix;
	var __width:Number;
	var __height:Number;
	var __x:Number;
	var __y:Number;
	var _fillType:String;
	var _color:Array;
	var __alpha:Array;
	var _cornerRadius:Object;
	var _strokeColor:Number;
	var _strokeThickness:Number;
	var _strokeAlpha:Number;
	

	//................................................................
	//@
	public function PolyContainer(mcScope,strName,sx,sy,sw,sh){
		scope=mcScope;
		mcName=strName;
		__width=sw;
		__height=sh;
		_x=sx;
		_y=sy;
		
		_fillType="linear";
		_color=[0x999999,0xffffff];
		__alpha=[100,100];
		_ratios=[0,255];
		

		_matrix= new Matrix();
		_matrix= {matrixType:"box", x:0, y:0, w:45, h:45, r:Math.PI/2};

		_padding={top:4,btm:4,left:4,right:4};
		padding=6;
		
		cornerRadius=2;
		cornerRadiusTL=10;
		
		_strokeColor=0x222222;
		_strokeThickness=0;
		_strokeAlpha=100;
		
		init();
	}
	
	//................................................................
	//@
	public function init(){
		createChild(mcName,200,200,scope)
		
	}
	
	//................................................................
	//@
	public function createChild(strName,w,h,scope){
		backGround=scope.createEmptyMovieClip(strName,scope.getNextHighestDepth())
		scope[strName].prototype.constructor=PolyContainer;
		
		Object.registerClass(strName,PolyContainer);
		
		draw(scope[strName])
	}
	
	//................................................................
	//@
	public function addChild(child){
		children.push(child)
		return children
	}

	//................................................................
	//draw our poly 
	private function draw(target){
		var mc=target;
		
		mc.clear()
		trace('_fillType: ' + _fillType + ', _color: ' + _color + ', __alpha: ' + __alpha + ', _ratios: ' + _ratios + ', _matrix: ' + _matrix)
		trace('_strokeThickness: ' + _strokeThickness + ', _strokeColor: ' + _strokeColor + ', _strokeAlpha: ' + _strokeAlpha)
	
		trace('cornerRadius: ' + cornerRadius)
		
		
		mc.beginGradientFill( _fillType,_color, __alpha, _ratios, _matrix);
		mc.lineStyle(_strokeThickness,_strokeColor,_strokeAlpha);		
		
		
			mc.moveTo(cornerRadius, 0);
			mc.lineTo(width - cornerRadius, 0);
			mc.curveTo(width, 0, width, cornerRadius);
			mc.lineTo(width, cornerRadius);
			
			
			
			mc.lineTo(width, height - cornerRadius);
			mc.curveTo(width, height, width - cornerRadius, height);
			mc.lineTo(width - cornerRadius, height);
			
			
			mc.lineTo(cornerRadius, height);
			mc.curveTo(0, height, 0, height - cornerRadius);
			mc.lineTo(0, height - cornerRadius);
			
			
			mc.lineTo(0, cornerRadius);
			mc.curveTo(0, 0, cornerRadius, 0);
			mc.lineTo(cornerRadius, 0);
			
			
			mc.endFill();
		
	}
	
	
	
	
	// ................................................................
	// @ 
	public function applySettings(target,settingsObject){
		for(var i in settingsObject){
			target=settingsObject[i];
		}
	}
	
	
	// ................................................................
	// @ 
	public function setSize(w,h){
		width=w;
		height=h;
		applySettings()
		draw(backGround)
	}
	
	// ................................................................
	// @ 
	public function move(sx,sy){
		x=sx;
		y=sy
	}
	


	// ................................................................
	// @ 
	public function get x(){return _x}
	public function set x(value){
		_x=value;
	}
	

	// ................................................................
	// @ 
	public function get y(){return _y}
	public function set y(value){
		 _y;
	}
	

	// ................................................................
	// @ 
	public function get width(){return __width}
	public function set width(value){
		__width=value;
	}

	// @ 
	public function get height(){return __height}
	public function set height(value){
		
		__height=value;
	}
	
	// ................................................................
	// @ 
	public function redraw(){
		setSize(__width,__height);
	}
	
	// ................................................................
	// @ 
	public function center(target){
		//trace("centering");
		var targetWidth=(target.width!=undefined)?target.width:target._width;
		var targetHeight=(target.height!=undefined)?target.height:target._height;
		
		this._x=(targetWidth-this.width)/2;
		this._y=(targetHeight-this.height)/2;
	};	

	// ................................................................
	// @
	public function setStyle(style,value){
		if(style && value ){this[style]=value}else{return false}
	}
	
	// ................................................................
	// @ 
	public function get matrix(){return _matrix}
	public function set matrix(matrixObj:Matrix ){
		_matrix=matrixObj;
	}

	// ................................................................
	// @ 
	public function get color(){return _color}
	public function set color(value){
		if( value!=undefined ) {
			_color=value;
		}
	}
		
	// ................................................................
	// @ 
	public function get fillType(){return _fillType}
	public function set fillType(value){
		if( value!=undefined ) {
			
			_fillType=value;
		}
		 
		return;
	}
	
	// ................................................................
	// @ 
	public function get ratios(){return _ratios}
	public function set ratios(value){
		if( value!=undefined ) {			
			_ratios=value;
		}
	}
	
	// ................................................................
	// @ 
	public function get strokeColor(){return _strokeColor}
	public function set strokeColor(value){
		if( value!=undefined ) {			
			_strokeColor=value;
		}
	}
	
	// ................................................................
	// @ 
	public function get strokeThickness(){return _strokeThickness}
	public function set strokeThickness(value){
		if( value!=undefined ) {			
			_strokeThickness=value;
		}
	}
	
	// ................................................................
	// @ 
	public function get strokeAlpha(){return _strokeAlpha}
	public function set strokeAlpha(value){
		if( value!=undefined ) {			
			_strokeAlpha=value;
		}
	}
	
	// ................................................................
	// @ 
	public function get alpha(){return __alpha}
	public function set alpha(value){
		if( value!=undefined ) {			
			__alpha=value;
		}
	}
	
	// ................................................................
	// @ 
	public function get padding(){return Number(_padding.top)}
	public function set padding(value:Number){
		paddingLeft=value;
		paddingRight=value;
		paddingTop=value;
		paddingBtm=value;
	}
	
	// ................................................................
	// @ 
	public function get paddingBtm(){return Number((_padding.btm!=undefined)?_padding.btm:0)}
	public function set paddingBtm(value){
		_padding.btm=value;
	}
	
	// ................................................................
	// @ 
	public function get paddingLeft(){return Number((_padding.left!=undefined)?_padding.left:0)}
	public function set paddingLeft(value){
		_padding.left=value;
		
	}
	
	// ................................................................
	// @ 
	public function get paddingRight(){return Number((_padding.right!=undefined)?_padding.right:0)}
	public function set paddingRight(value){
		_padding.right=value;
		
	}
	
	// ................................................................
	// @ 
	public function get paddingTop(){return Number((_padding.top!=undefined)?_padding.top:0)}
	public function set paddingTop(value){
		_padding.top=value;
	}
	
	// ................................................................
	// @ 
	public function get margins(){return Number((_padding.margins!=undefined)?_padding.margins:0)}
	public function set margins(value){
		_padding.margins=value;
		
	} 

	// ................................................................
	// @ 
	public function get cornerRadius(){return (_cornerRadius!=undefined)?_cornerRadius:0}
	public function set cornerRadius(value){
		_cornerRadius=value;
		_cornerRadius.btmLft=value;
		_cornerRadius.btmRight=value;
		_cornerRadius.topLeft=value;
		_cornerRadius.topRight=value;
	}
	
	// ................................................................
	// @ 
	public function get cornerRadiusBL(){return _cornerRadius.btmLft}
	public function set cornerRadiusBL(value){
		_cornerRadius.btmLft=value;
		
	}
	
	// ................................................................
	// @ 
	public function get cornerRadiusBR(){return _cornerRadius.btmRight}
	public function set cornerRadiusBR(value){
		_cornerRadius.btmRight=value;
		
	}
	
	// ................................................................
	// @ 
	public function get cornerRadiusTL(){return _cornerRadius.topLeft}
	public function set cornerRadiusTL(value){
		_cornerRadius.topLeft=value;
		
	}
	
	// ................................................................
	// @ 
	public function get cornerRadiusTR(){return _cornerRadius.topRight}
	public function set cornerRadiusTR(value){
		_cornerRadius.topRight=value;
		
	}
	
	// ................................................................
	// :
	public function get innerHeight(){return __height-paddingLeft-paddingTop}
	
	// ................................................................
	// :
	public function get innerWidth(){return  __width-paddingLeft-paddingRight}
}
