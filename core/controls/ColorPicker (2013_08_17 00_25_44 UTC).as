import mx.utils.Delegate;
import mx.events.EventDispatcher;


 class com.abazaba.core.view.controls.ColorPicker extends MovieClip
{
	
	private var TARGET ,boundingBox;
	private var fs,tf,txtField, fieldSet,colorPicker;
	private var depth ;
	private var cp;
	private var _value,LABEL;
	private var hexColor,ref
	private var __width,__height,padding,shield;
	public var addEventListener,removeEventListener,dispatchEvent,_controlType:String,CONTROLS:Array,resetterValue;

	public function ColorPicker(){
		EventDispatcher.initialize(this)
		cp.focusHandler=onSetFocus;
		
		CONTROLS=new Array()
		CONTROLS.push(fs = attachMovie ("com.metaliq.controls.FieldSet", "fieldSet", this.getNextHighestDepth()));
		CONTROLS.push(tf = attachMovie ("com.metaliq.controls.TextInput", "txtField",this.getNextHighestDepth()));
		CONTROLS.push(cp = attachMovie ("ColorChooser", "colorPicker", this.getNextHighestDepth()));
		tf.ref=this
		tf.addEventListener("enter",this);
		tf.onKillFocus=this.onKillFocus;
		var sx = tf._x;
		var sy = tf._y;
		padding = 5;
		__width=boundingBox._width
		__height=boundingBox._height
		boundingBox._visible=false;
		//setLabel(_controlType.toUpperCase())
		
		var listener = {}
		var ref = this
		cp.eventOnValue=true;
		cp.addEventListener("change",this)
		setSize (__width,__height );
		cp.focusHandler=onSetFocus;
		
		
		cp.onMouseMove=function(){
			if(this.hitTest(_root._xmouse,_root._ymouse) && this.__window.display.text!=undefined){
				this.hexColor=this.__window.display.text.substr(1)
			}
		}
	}
	
	
	
	function onSetFocus(e){
		_parent._parent.swapDepths(_root.getNextHighestDepth())
		_parent.swapDepths(_root.getNextHighestDepth()+1)	}
	
	function validateValue(value){
		if(_value!=undefined || _value!=null){
			if(value==""){value=__value}
			if(value.length<5){value=__value}
			if(!(value.indexOf("#")==-1)){value=value.substr(1)}
			if(!(value.indexOf("0x")==-1)){value=value.substr(2)}
			
			return value;
		}
	}
	
	
	function onKillFocus(){
		if(this.ref.txtField.text=="" || this.ref.txtField.text==undefined){
			this.ref.setValue(this.ref.__value);
		}
	}
	
	
	function enter(e){
		var ref=this;
		var value=txtField.text;
		trace("Entrered")

		
		if(txtField.text.indexOf("|")!=-1){
			
			parseToArray(txtField.text)
			return
		}else{
			if(value.indexOf("#")!=-1){value=value.substr(1)}
			if(value==""){setValue(__value)}
			if(value.length<5 || value.length>7){setValue(__value);}
			__value=value;
		}
	}
	
	
	function pushValue(value){setValue(value)}
	
	function change(e:Object){		
		var value=this.cp.hexColor
		if(value!=undefined  && value!=null){__value=value}
	}
	
	

	function setSize (w, h)
	{
		__width=w
		__height=h
		fs.setSize (w,(h+(padding*2)));
		tf.setSize(w/2,.95*(tf.height));
		tf._x=fs._x+padding;
		tf._y=fs._y+(padding*4);
		
		cp._y=txtField._y+((txtField.height-cp.height)/2)
		cp.setSize(txtField.height,.95*(txtField.height))
		cp._x=txtField._x+txtField.width+padding
	}
	
	
	
	public function setValue(value){
		if(value.indexOf("|")!=-1){parseToArray(value)}
		if(!(value.indexOf("#")==-1)){value=value.substr(1)}
		if(!(value.indexOf("0x")==-1)){value=value.substr(2)}
		
		if(txtField.text!=value){txtField.text=value};
		txtField.storedValue=value
		_value=value
		
		value="0x"+value
		cp.value=value
	}
	


	function parseToArray(value){
		trace("PARSINGASARRAY: "+value)
		cp.value=colorArray[0];
		_value=value;
		var colorArray=value.split("|");
		txtField.text=value;
		dispatchEvent ({type : "change", target : this, data : _value})
	}

	function get __value ()
	{
		if(_value!=undefined || _value!=null){
			return "0x"+_value;
		}
	}
	
	
	function set __value (value)
	{
			trace(value)
			value=(value=="")?_value:value;
			txtField.text=(value.indexOf("0x")==-1)?value:value.substr(2);
			_value=value
			dispatchEvent ({type : "change", target : this, data : _value})
	}
	
	
	function setLabel (sValue)
	{
		fs.label = sValue;
	}
	
	
	// ---------------------------------------------------------------
	// @
	function set resetValue (value)
	{
		resetterValue=value
	}
	
	// ---------------------------------------------------------------
	// @
	function reset(){
		trace("resetterValue: "+resetterValue)
		pushValue(resetterValue);
		__value=resetterValue;
	}
}



















