//Include the Transition class
import mx.transitions.*;
import mx.transitions.easing.*;

class com.abazaba.core.view.utilities.TransitionEngine{
	public function flikr(target,playLength,state){
		//mx.transitions.TransitionManager.start(target, {type:mx.transitions.Photo, direction:mx.transitions.Transition[state], duration:playLength, easing:mx.transitions.easing.Back.easeInOut});
		trace("Target="+target)
		if(state=="IN"){
			target._alpha=100
		}else{
			target._alpha=0
		}
	}
	
	
	public function pixleFade(target,pixleCount,playLength,state){
		mx.transitions.TransitionManager.start(target, {type:mx.transitions.PixelDissolve, direction:mx.transitions.Transition[state], duration:playLength, easing:mx.transitions.easing.Back.easeInOut, xSections:pixleCount, ySections:pixleCount});
	}
}