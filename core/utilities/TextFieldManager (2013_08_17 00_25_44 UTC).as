 import com.metaliq.controls.UIObject;
 import com.abazaba.core.view.style.StyleManager;
class com.abazaba.core.view.utilities.TextFieldManager {
	private static var instance:TextFieldManager = null;
	private var text_fmt:TextFormat;
	private var styleManager:StyleManager;
	private var fields:Array;
	private var nonTFObjects:Array;
	function TextFieldManager() {
		styleManager=StyleManager.getInstance();
		text_fmt = new TextFormat();
		text_fmt.font = "Arial";
		text_fmt.bold = false;
		text_fmt.size = 12;
		fields = new Array();
		nonTFObjects = new Array();
		
	}
	
	public static function getInstance():TextFieldManager {
        if (TextFieldManager.instance == null) {
            TextFieldManager.instance = new TextFieldManager();
        }
        return TextFieldManager.instance;
    }

	public  function createNewTextField(
								instanceName:String, 
								depth:Number, 
								x:Number, 
								y:Number, 
								width:Number, 
								height:Number, 
								owner:MovieClip) {
		
		var text_txt:TextField = owner.createTextField(instanceName, depth, x, y, width, height);
		text_txt.setNewTextFormat(text_fmt);
		fields.push(text_txt);
		return text_txt;
	}
	
	public function applyStyleToAllFields(font, size, color, style) {
		
		
		/*text_fmt.font = font;
		text_fmt.size = size;*/
		text_fmt.color = color;
		//text_fmt.bold=false;
		for(var i = 0; i < fields.length; i++) {
			fields[i].setTextFormat(text_fmt);
		}
		
		
		for(var i = 0; i < nonTFObjects.length; i++) {
			nonTFObjects[i].setInstanceStyle("fontFace",font);
			nonTFObjects[i].setInstanceStyle("fontSize",size);
			nonTFObjects[i].setInstanceStyle("fontColor",color);
			nonTFObjects[i].setInstanceStyle("fontStyle",style);
		}

	}
	
	public function addNonTFObject(obj){
		nonTFObjects.push(obj)
	}
}
