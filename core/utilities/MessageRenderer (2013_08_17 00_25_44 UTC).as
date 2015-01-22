import com.abazaba.core.view.utilities.FilterExtension;
import ui.containers.PanelComponent;
import com.abazaba.core.view.utilities.StyleManager;
import com.abazaba.core.view.utilities.transitionEngine;



 
 // ActionScript 2.0 class.
class com.abazaba.core.view.utilities.MessageRenderer extends com.metaliq.controls.DemoRowRenderer
{
	public var messageBkg, label
	// Constructor. Should be empty.
	public function MessageRenderer ()
	{
		createChildren()
	}
	
	
	/* UIObject expects you to fill in createChildren by instantiating all the movie clip assets you might need upon initialization. In this case we are creating one label*/
	public function createChildren () : Void
	{
		// The createLabel method is a useful method of UIObject and a handy
		// way to make labels in components.
		//
		//createLabel ("label", getNextHighestDepth () , "Value")
		trace("	CREATING CHILDREN")
		
	}
	
	
	public function setSize (w, h)
	{
		//trace ("	Setting Size()")
		//label.setSize(__width-5,__height-5)
		
	}
	
	
	
	
	/* *****************************************/;
	// @ methodName;
	public function setEnabled (p_enable : Boolean) : Void
	{
		//trace ("	SettingEnabled: " + p_enable)
	}
	
	
	/* *****************************************/;
	// @ methodName;
	public function setInstanceStyle (p_style : String, p_val) : Void
	{
		//trace ("	SettingInstanceStyle: " + p_style+" To "+p_val)
		
	}
	
	
	/* *****************************************/;
	// @ methodName;
	public function setValue (p_item : Object, p_selected : Boolean) : Void
	{
		if(p_item!=undefined){
			trace("P_ITEM: "+p_item+" SELECTED: "+p_selected)
			label.text = p_item.label;
		}
	}
}
