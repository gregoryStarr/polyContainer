import mx.utils.Delegate;
import mx.events.EventDispatcher;


 class com.abazaba.core.view.controls.Slider extends MovieClip
{
	
	private var TARGET ,boundingBox;
	private var fs,tf,txtField, fieldSetr;
	private var depth ;
	private var changeFlag:Boolean ;
	private var slider;
	private var _value,LABEL;
	private var __width,__height,padding,min,max;
	public var addEventListener,removeEventListener,dispatchEvent,_controlType,resetterValue;
	public var CONTROLS:Array;
	public function Slider(){
		EventDispatcher.initialize(this)
		resetterValue;
		CONTROLS=new Array()
		CONTROLS.push(fs = attachMovie ("com.metaliq.controls.FieldSet", "fieldSet", this.getNextHighestDepth()));
		CONTROLS.push(tf = attachMovie ("com.metaliq.controls.TextInput", "txtField",this.getNextHighestDepth()));
		CONTROLS.push(slider = attachMovie ("com.metaliq.controls.Slider", "slider", this.getNextHighestDepth()));
		slider.addEventListener("change",this)
		
		tf.addEventListener("enter",this);
		
		max=20
		min=2
		var sx = tf._x;
		var sy = tf._y;
		padding = 5;
		__width=boundingBox._width
		__height=boundingBox._height
		setMaxLimit(15)
		setMinLimit(2)
		//boundingBox._width=boundingBox._height=0
		boundingBox._visible=false;
		fs.label=_controlType.toUpperCase()
		setSize(__width,__height)
		
		
		var listener={}
		var ref=this
		//listener.onMouseMove=function(){
			//ref.txtField.setText(ref.slider.value)
		//}
		
		listener.onMouseUp=function(){
			//if(ref.hitTest(_root._xmouse,_root._ymouse,true)){
				ref.changeFlag=true;
				ref.change({target:ref.slider})
			//}
		}
		listener.onMouseDown=function(){
			if(ref.hitTest(_root._xmouse,_root._ymouse,true)){
				ref.changeFlag=false;
			}
		}
		Mouse.addListener(listener)
	}
	
	
	function enter(e){
		slider.value=txtField.text;
	}
	
	
	function pushValue(value){
		slider.value=value;
		
	}



	function setSize (w, h)
	{
		__width=w
		__height=h
		fs.setSize (w,h+(padding*2));
		
		tf.setSize(w/4,tf.height);
		tf._x=fs._x+padding;
		txtField._y=fs._y+(padding*4);
		
		slider.setSize(w-tf.width-(padding*6),slider.height);
		slider._x=tf._x+tf.width+(padding*3);
		slider._y=tf._y	;
	}

	
	function change(e){
		//trace("Slider Change")
		var value=(e.target.value<=max && e.target.value>=min)?e.target.value:Math.round(e.target.value);
		this.txtField.setText (value)
		
		if(changeFlag){
			__value=txtField.text
		}
	}
	
	
	
	function get __value ()
	{
		return _value;
	}
	
	
	
	function set __value (value)
	{
		if(value==undefined){value=min}
		this.txtField.setText (value)
		_value=this.txtField.text;

		dispatchEvent ({type : "change", target : this, data : _value})
	}
	
	
	function setLabel (sValue)
	{
		fs.label = sValue;
		__value=sValue
	}
	
	function setMaxLimit(nValue){
	//trace("setting Max Limit: "+nValue)
	slider.setMaxValue(nValue)
	max=nValue
	}

	function setMinLimit(nValue){
		slider.setMinValue(nValue)
		min=nValue
	}
	
	function set resetValue (value)
	{
		resetterValue=value
	}
	
	function reset(){
		pushValue(resetterValue);
	}
	

}
