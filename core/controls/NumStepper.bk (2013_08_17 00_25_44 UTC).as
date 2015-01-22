import mx.utils.Delegate;
import mx.events.EventDispatcher;


 class com.abazaba.core.view.controls.NumStepper extends MovieClip
{
	
	private var TARGET ,boundingBox,fs;
	private var numStepper;
	private var depth ;
	private var _value,LABEL;
	private var __width,__height,padding
	public var addEventListener,removeEventListener,dispatchEvent,_controlType,CONTROLS:Array,resetterValue;

	public function NumStepper(){
		EventDispatcher.initialize(this)
		resetterValue;

		CONTROLS=new Array()
		CONTROLS.push(fs = attachMovie ("com.metaliq.controls.FieldSet", "fieldSet", this.getNextHighestDepth()));
		CONTROLS.push(numStepper = attachMovie ("com.metaliq.controls.NumericStepper", "numStepper", this.getNextHighestDepth()));
		padding = 5;
		__width=boundingBox._width
		__height=boundingBox._height
		//boundingBox._width=boundingBox._height=0
		boundingBox._visible=false;
		numStepper.addEventlistener("change",this)
		setLabel(_controlType.toUpperCase())
		setSize (__width,__height )
	}


	function setSize (w, h)
	{
		__width=w
		__height=h
		fs.setSize (w,h+(padding*2));
		numStepper.setSize(w-(padding*2),h-(padding*3));
		numStepper._x=fs._x+padding
		numStepper._y=fs._y+(padding*4)
	}

	
	
	function get __value ()
	{
		return _value;
	}
	
	
	function change(e){
		__value=e.target.seledctedItem.data;
	}
	
	function set __value(value)
	{
		if(value==undefined){value=1}
		_value=value;
		//trace("Dispatching from numStepper");
		dispatchEvent ({type : "change", target : this, data : _value})
	}
	
	
	function pushValue(value){
		numStepper.value=(value)?value:"";
		_value=value
		__value=value
	}
	
	
	function setLabel (sValue)
	{
		fs.label = sValue;
	}
	
	
	function set resetValue (value)
	{
		resetterValue=value
	}
	
	function reset(){
		pushValue(resetterValue);
	}
}
