
package view {

	import mvc.Model;
	import mvc.Controller;
	import flash.display.*;
	import flash.events.*;
    import com.greensock.*;
	import com.greensock.easing.*;

public class WeightNeedle extends MovieClip{

    private var _model:Model;
   private var _controller:Controller;
    private var needle:Needle = new Needle;
    public function WeightNeedle(model:Model, controller:Controller){

        _model = model;
		_controller = controller;
        _model.addEventListener(Model.FOOD, fed);
           init();
    }

      function init(){
        needle.x = 0;
        needle.y = 0;
       // needle.rotation = 70;
        addChild(needle);
        burrningCals();
      }

    function burrningCals(){
      TweenLite.to(needle, 100,{rotation:-70})

    }

    function fed(e:Event){
     TweenLite.to(needle, 2,{rotation:70,onComplete:burrningCals})
    }
}
}
