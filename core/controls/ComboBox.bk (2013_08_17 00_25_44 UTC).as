import mx.utils.Delegate;
import mx.events.EventDispatcher;


 class com.abazaba.core.view.controls.ComboBox extends MovieClip
{
	
	private var TARGET ,boundingBox,fs;
	private var combo;
	private var depth ;
	private var _value,LABEL;
	private var __width,__height,padding
	public var addEventListener,removeEventListener,dispatchEvent,_controlType,CONTROLS:Array,resetterValue;

	public function ComboBox(){
		EventDispatcher.initialize(this)
		resetterValue;

		CONTROLS=new Array()
		CONTROLS.push(fs = attachMovie ("com.metaliq.controls.FieldSet", "fieldSet", this.getNextHighestDepth()));
		CONTROLS.push(combo = attachMovie ("com.metaliq.controls.ComboBox", "combo", this.getNextHighestDepth()));
		padding = 5;
		__width=boundingBox._width;
		__height=boundingBox._height;
		//boundingBox._width=boundingBox._height=0
		boundingBox._visible=false;
		combo.addEventlistener("change",this);
		setLabel(_controlType.toUpperCase());
		setSize (__width,__height );
	}


	function setSize (w, h)
	{
		
		__width=w;
		__height=h;
		fs.setSize (w,h+(padding*2));
		combo.setSize(w-(padding*2),h-(padding*3));
		combo._x=fs._x+padding;
		combo._y=fs._y+(padding*4);
	}

	
	
	function get __value ()
	{
		return combo.selectedIndex.data;
	}
	
	
	function pushValue(value){
		for(var i in combo.dataProvider){
			if(combo.dataProvider[i].data==value){combo.selectedIndex=i}
		}
	}
	
	
	function change(e){
		__value=e.target.selectedIndex.data;
	}
	
	function set __value (value)
	{
		if(value==undefined){value=combo.getItemAt(0) }
		__value=value;
		dispatchEvent ({type : "change", target : this, data : value})
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
