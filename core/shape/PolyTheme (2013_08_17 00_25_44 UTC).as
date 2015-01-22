

// ###############################################
class net.lost.core.shape.PolyTheme {
	var _className:String;
	
	var boundingBox:MovieClip;
	var _cornerRadius:Number;
	var _strokeColor:Number;
	var _strokeAlpha:Number;
	var _strokeThickness:Number;
	var _colorObj:Object;
	var _color:Array;
	var __alpha:Array;
	var _ratios:Array;
	var _matrix:Object;
	var _fillType:String;
	
	var generated:Boolean;
	var filters:String;
	var blendMode:String;
	var blend:String;
	var innerBlend:String;
	var externalAssets:String;
	
	var glowColor:Number;
	var innerGlowColor:Number;
	var glowStrength:Number;
	var innerGlowStrength:Number;
	var igblurY:Number;
	var igblurX:Number;
	var innerBlurY:Number;
	var gblurY:Number;
	var gblurX:Number;
	
	var innerBlurX:Number;
	var blurY:Number;
	var blurX:Number;
	
	var margins:Number;
	var innerMargins:Number;
	
	var paddingLeft:Number;
	var paddingRight:Number;
	var paddingTop:Number;
	var paddingBtm:Number;
	
	var gradA:Number;
	var gradB:Number;
	var innerGradB:Number;
	var innerGradA:Number;
	var color:String;
	var innerColor:String;
	
	var alpha:String;
	var innerAlpha:String;
	
	var strokeColor:Number;
	var innerStrokeColor:Number;
	var strokeAlpha:Number;
	var innerStrokeAlpha:Number;
	var strokeThickness:Number;
	var innerStrokeThickness:Number;
	var corners:Number;
	
	var gradRatioA:String;
	var gradRatioB:String;
	
	var innerGradRatioB:String;
	var innerGradRatioA:String;
	var ratios:String;
	var innerRatios:String;
	
	var fontFace:String;
	var fontSize:String;
	var fontColor:String;
	var fontStyle:String;
	
	// Aliased temp values:
	// -------------------------------------------------------------

	public function PolyTheme(obj:Object)
	{
		_className = "net.lost.core.shape.PolyTheme";
		
		//if(!obj){
			//trace("bad theme object");
			
			var obj={}
			obj.generated=true;
			obj.blendMode="normal"
			obj.blend="normal"
			obj.glowColor = 0;
			obj.glowStrength = 0;
			obj.gblurY = 5;
			obj.gblurX = 1.5;
			
			
			obj.innerBlurX = 0;
			obj.blurY = 0;
			obj.blurX = 0;
			
			
			obj.paddingLeft =2;
			obj.paddingRight =2;
			obj.paddingTop =2;
			obj.paddingBtm = 2;
			
			
			obj._fillType="linear"
			obj.color=[0x999999,0xAABBCC]
			obj.radius=[0,255]
			obj._matrix = {matrixType:"box", x:0, y:0, w:45, h:45, r:Math.PI/2};
			obj.gradA = 0x999999;
			obj.gradB = 0xFFFFFF;
			
			obj.alpha = [100,100];
			
			obj.gradRatioA=0;
			obj.gradRatioB=255;;
			
			obj.strokeColor = 0x666666
			obj.strokeAlpha = 100;0;
			obj.strokeThickness = 0;
			obj.cornerRadius= 10;
		//}
		
		for(var i in obj) {
			if(obj[i]==undefined){i++}
			this[i] = obj[i];
		}
	}

	public function toString():String
	{
		var str:String = new String(); 
		for(var i in this) {
			str += "\n" + i + " : " + this[i];
		}
		
		return str;
	}
}
