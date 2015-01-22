/*// ................................................................
	Greg Starr:
// ................................................................*/
import net.lost.core.utilities.*;
import mx.utils.Delegate;
import mx.events.EventDispatcher;
import net.lost.core.shape.PolyTheme;

class net.lost.core.shape.PolyObject extends MovieClip{	
	private var boundingBox:MovieClip;
	private var _cornerRadius:Number;
	private var _strokeColor:Number;
	private var _strokeAlpha:Number;
	private var _strokeThickness:Number;
	private var _colorObj:Object;
	private var _color:Array;
	private var __alpha:Array;
	private var _ratios:Array;
	private var _matrix:Object;
	private var _fillType:String;
	private var __height:Object;
	private var __width:Object;
	private var _name;
	public var THEME:PolyTheme;

	
	//................................................................
	//Constructor:
	public function PolyObject(makeFlag:Boolean){
		//trace(this)
		
		
		
		init();
	}
	
	
	//................................................................
	//
	public function init(){		
		//Sett initial size
		THEME=new PolyTheme();
		
		
		__width=boundingBox._width;
		__height=boundingBox._height;
		
		boundingBox._width=boundingBox._height=0;
		boundingBox._visible=false;
		
		
		cornerRadius=6
		color=[0x333333,0x22222]
		ratios=[0,255]
		
		
		setSize(__width,__height)
		applyTheme();
	}
	
	//................................................................
	//
	public function move(sx,sy){
		_x=sx;
		_y=sy;
	}
	
	//................................................................
	//
	public function centerOn(target){
		var tw,th;
		tw=(target.width!=undefined)?target.width:target._width
		th=(target.height!=undefined)?target.height:target._height
		move((tw-width)/2,(th-height)/2);
	}
	
	
	public function applyTheme(themeObj:PolyTheme){
		var themeObj=(themeObj!=undefined)?themeObj:new PolyTheme();
		for(var i in themeObj){
			this[i]=themeObj[i]
			for(var j in themeObj[i]){
				this[j]=themeObj[i][j];
			}
		}
		setSize(__width,__height);
	}


	//................................................................
	//draw our poly 
	private function draw(target){
		
		var mc=(target==undefined)?this:target;
		
		mc.clear()

		mc.beginGradientFill( _fillType,_color, __alpha, _ratios, _matrix);
		mc.lineStyle(_strokeThickness,_strokeColor,_strokeAlpha);		


		with(mc){
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
	
	
	//................................................................
	//
	public function redraw(){
		setSize(__width,__height)
	}
	
	
	// ................................................................
	public function setSize(w,h){
		height=h;
		width=w;
		draw()
	}
	
	
	//................................................................
	//height:
	public function get height(){return __height}
	public function set height(value){
		__height=value;
	}
	
	
	//................................................................
	//width:
	public function get width(){return  __width}
	public function set width(value){
		__width=value;
	}
	
	//................................................................
	// ................................................................
	//width:
	public function get ratios(){return _ratios}
	public function set ratios(value){
		_ratios=value;
	}
	
	// ................................................................
	//width:
	public function get fillType(){return _fillType}
	public function set fillType(value){
		_fillType=value;
	}
	
	// ................................................................
	//width:
	public function get matrix(){return _matrix}
	public function set matrix(value){
		_matrix=value;
	}
	

	//................................................................
	//corners:
	public function get cornerRadius(){return _cornerRadius}
	public function set cornerRadius(value){
		_cornerRadius=value;
	}
	
	//................................................................
	//
	public function get color(){return _color}
	public function set color(value){
		var colorValue=value;
		_color=colorValue;
	}
	
	//................................................................
	//
	public function get alpha(){return __alpha}
	public function set alpha(value){
		__alpha=value;
	}

	//................................................................
	//lineColor:
	public function get strokeColor(){return _strokeColor}
	public function set strokeColor(value){
		_strokeColor=value;
	}
	
	//................................................................
	//line thickness:
	public function get strokeThickness(){return _strokeThickness}
	public function set strokeThickness(value){
		_strokeThickness=value;
	}
	
	//................................................................
	// 
	public function get strokeAlpha(){return _strokeAlpha}
	public function set strokeAlpha(value){
		_strokeAlpha=value;
	}

	//................................................................
	//Assign values to MC properties
	public function assignMCProp(prop,value){
		// //trace("Property "+prop+" Value: "+value)
			this[prop]=value;
	}
	
	//................................................................
	//
	public function getMCProp(prop){
			return this[prop];
	}
	
	//................................................................
	//
	public function applyFilter(filterObject){
		trace("Applying filter")
	}
	
}



