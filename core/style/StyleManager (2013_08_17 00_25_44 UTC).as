import com.abazaba.core.vo.style.Theme;
import mx.events.EventDispatcher;

class com.abazaba.core.view.style.StyleManager {
	private static var inst:StyleManager; 	// instance of self
	public var baseFormTheme:Theme;
	public var applicationFormTheme:Theme;
	public var userFormTheme:Theme;
	public var navigationFormTheme:Theme;
	public var modalWindowFormTheme:Theme;
	public var messageListHighlightItemTheme:Theme;
	public var messageListItemTheme:Theme;
	public var mediaMessageListFormTheme:Theme;
	public var reqDataNotificationFormTheme:Theme;
	public var resetObject:Object;
	
	function StyleManager() {
		EventDispatcher.initialize(this);
	}
	
	public function stylePropChanged(prop, oldVal, newVal, obj) {
		obj.dispatchEvent({type:"stylePropChanged", data:{prop:prop, oldVal:oldVal, newVal:newVal}});
		dispatchEvent({type:"onResetComplete"})
		//trace("Style Updated!")
	}

	public function applyTheme(linkage:String, val:Theme):Void {	
		
		
		// assign listeners to notify objects listening to changes made to these properties
		this.unwatch(linkage);
		
		// assign the local variable to hold the value of session
		this[linkage] = val;
		
		this.watch(linkage, stylePropChanged, this);
		
		/*
			when a new version of the theme is added to the manager
			fire off all of the property change events.
			technically they have all changed with the presence of the new object
			so the listeners have to be updated.
			then set all of the watch listeners again, to watch individual properties 
			of the theme object change
		*/
		
		stylePropChanged(linkage, this[linkage], val, this);
	}
	
	public static function getInstance ( application ) {
		//
		// Return reference to singleton instance
		//
		if ( inst == null )
		{
			// create a single instance of the singleton
			inst = new StyleManager( );
			return inst;
		}
		else
		{
			// instance already exists, return a reference to it
			return inst;
		}
	}
	
	function addEventListener() {
		// Used by EventDispacther mixin
	}
	
	function removeEventListener() {
		// Used by EventDispacther mixin
	}
	
	function dispatchEvent() {
		// Used by EventDispacther mixin
	}
	
	function dispatchQueue() {
		// Used by EventDispacther mixin
	}

}
