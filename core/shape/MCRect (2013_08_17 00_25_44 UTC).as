/*// ................................................................
	Greg Starr:
	This is preAlpha code. Stability unknown!
// ................................................................*/

import com.abazaba.core.view.utilities.*;
import mx.utils.Delegate;
import mx.events.EventDispatcher;

class com.abazaba.core.view.shape.MCRect extends MovieClip{	
	private var boundingBox:MovieClip;
	private var _cornerRadius:Number;
	private var _strokeColor:Number;
	private var _strokeAlpha:Number;
	private var _strokeThickness:Number;
	private var _color:Array;
	private var __alpha:Array;
	private var _ratios:Array;
	private var _matrix:Object;
	private var _fillType:String;
	private var __height:Object;
	private var __width:Object;
	
	// ................................................................
	// Constructor:
	public function MCRect(){
		//trace(this)
		init();
	}
	
	
	
	public function init(){		
		// Corners
		_cornerRadius=4;
		
		
		// Colors
		_fillType = "linear";
		_color = [0xcccccc, 0x999999];
		__alpha = [100, 100];
		_ratios = [0x00, 0xFF];
		_matrix = {matrixType:"box", x:0, y:0, w:45, h:45, r:Math.PI/2};

		// Stroke Definition
		_strokeThickness=2;
		_strokeColor=0xcccccc;
		_strokeAlpha=100;
		
		// Width/Height
		__width=boundingBox._width;
		__height=boundingBox._height;
		
		// Remove BoundingBox;
		boundingBox._width=boundingBox._height=0;
		boundingBox._visible=false;
		
		//Sett initial size
		setSize(width,height)	
	}
	
	
	public function move(sx,sy){
		_x=sx;
		_y=sy;
	}
	
	
	public function centerOn(target){
		var tw,th;
		tw=(target.width!=undefined)?target.width:target._width
		th=(target.height!=undefined)?target.height:target._height
		

		//trace((tw-width)/2+" || "+(th-height)/2)
		move((tw-width)/2,(th-height)/2);
	}


	// ................................................................
	// drawShape our rect:
	private function drawShape(doNotClearOnCall) {		
		// Clear the drawShapeing board:
		//trace("Begin Drawing Now: Clear First? "+(doNotClearOnCall==undefined))
		this.clear()
		
		this.beginGradientFill( _fillType, _color, __alpha, _ratios, _matrix);
	
		this.lineStyle(_strokeThickness,_strokeColor,_strokeAlpha);
				
		with(this){
			moveTo(cornerRadius, 0);
			lineTo(width - cornerRadius, 0);
			curveTo(width, 0, width, cornerRadius);
			lineTo(width, cornerRadius);
			lineTo(width, height - cornerRadius);
			curveTo(width, height, width - cornerRadius, height);
			lineTo(width - cornerRadius, height);
			lineTo(cornerRadius, height);
			curveTo(0, height, 0, height - cornerRadius);
			lineTo(0, height - cornerRadius);
			lineTo(0, cornerRadius);
			curveTo(0, 0, cornerRadius, 0);
			lineTo(cornerRadius, 0);
			endFill();
		}


		return true;
	}	
	
	
	public function redraw(){
		drawShape();
	}
	
	
	// --------------------------------------------------------------------------------
	// 									**Getter/setters**
	// --------------------------------------------------------------------------------
	
	// --------------------------------------------------------------------------------
	
	// ................................................................
	// drawShape this!
	public function setSize(w,h){
		height=h;
		width=w;
		drawShape();
	}
	
	
	// ................................................................
	// drawShape our rect new height:
	public function get height(){return __height}
	public function set height(value){
		__height=value;
		drawShape();
	}
	
	
	// ................................................................
	// drawShape our rect new width:
	public function get width(){return  __width}
	public function set width(value){
		__width=value;
		drawShape();
	}
	
	
	
	// ................................................................
	// drawShape our rect new width:
	public function get ratios(){return _ratios}
	public function set ratios(value){
		_ratios=value;
		drawShape();
	}
	
	// drawShape our rect new width:
	public function get fillType(){return _fillType}
	public function set fillType(value){
		_fillType=value;
		drawShape();
	}

	// ................................................................
	// drawShape our rect new corners:
	public function get cornerRadius(){return _cornerRadius}
	public function set cornerRadius(value){
		_cornerRadius=value;
		drawShape();
	}
	


	public function get color(){return _color}
	public function set color(value){
		var colorValue=value
		if(typeof(value)=="string"){colorValue=value.split("|")}
		_color=colorValue;
		drawShape();
		
	}
	
	public function get alpha(){return __alpha}
	public function set alpha(value){
		__alpha=value;
		drawShape();
	}

	
	
	// ................................................................
	// drawShape our rect new lineColor:
	public function get strokeColor(){return _strokeColor}
	public function set strokeColor(value){
		_strokeColor=value;
		//trace("stroke color: "+value);
		drawShape();
	}
	
	
	
	// ................................................................
	// drawShape our rect new line thickness:
	public function get strokeThickness(){return _strokeThickness}
	public function set strokeThickness(value){
		_strokeThickness=value;
		drawShape();
	}
	
		// ................................................................
	// drawShape our rect new line alpha:
	public function get strokeAlpha(){return _strokeAlpha}
	public function set strokeAlpha(value){
		_strokeAlpha=value;
		drawShape();
	}

	
	// ................................................................
	// Assign values to MC properties
	public function assignMCProp(prop,value){
		// //trace("Property "+prop+" Value: "+value)
			this[prop]=value;
	}
	
	public function getMCProp(prop){
			return this[prop];
	}
	
	
	// ................................................................
	// Assign a filter to a target
	public function applyFilter(name,params){
		var filterFactory=new FilterExtension();
		filterFactory.addFilter(name,this,params);
	}
	
	
	public function get useBitMapCache(){return this.cacheAsBitmap}
	public function set useBitMapCache(value){
		this.cacheAsBitmap=value;
	}
	
	
}


