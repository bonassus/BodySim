package  view {
import flash.display.MovieClip;
import com.greensock.*;
import com.greensock.easing.*;
import flash.display.*;
import flash.events.*;
import mvc.Model;
import mvc.Controller;
import com.greensock.plugins.TweenPlugin;
import com.greensock.plugins.ColorTransformPlugin;

public class FoodBtn extends MovieClip {
     //    public static const SLIDER_END:String = 'Slider End';
       private var _model:Model;
       private var _controller:Controller;
       private var foodSliderBack:FoodSliderBack = new FoodSliderBack;
       private var apple:Apple = new Apple;
       private var track:FoodTrack = new FoodTrack;
		public function FoodBtn(model:Model, controller:Controller) {
			_model = model;
            _controller = controller;
            init();
            creation ();
		}

        function init(){
        TweenPlugin.activate([ColorTransformPlugin]);

        }

       function creation (){


          foodSliderBack.x =941;
          foodSliderBack.y  = 36;
          addChild(foodSliderBack);


           track.x = 1000;
           track.y = 80;
           addChild(track);

           apple.x = 1000;
           apple.y = 80;
           addChild(apple);
           apple.addEventListener(MouseEvent.CLICK, onApple);
        }

         function onApple(e:MouseEvent){
           TweenLite.to(apple,1.5,{x:1170, colorTransform:{tint:0xFF0000, tintAmount:.5},ease:Quad.easeInOut,onComplete:appleEnd});
         }

    function appleEnd(){
        _controller.feedApple();
       // dispatchEvent(new Event(SLIDER_END));
        apple.removeEventListener(MouseEvent.CLICK, onApple);
        TweenLite.to(apple,.5,{alpha:0,ease:Quad.easeInOut,delay:3,onComplete:onAppleOut});
    }

    function onAppleOut(){
        TweenLite.to(apple,0,{x:1000, colorTransform:{tint:0xFF0000, tintAmount:0},ease:Quad.easeInOut,onComplete:onAppleBack});
    }

    function onAppleBack(){
        apple.addEventListener(MouseEvent.CLICK, onApple);
       TweenLite.to(apple,1,{alpha:1,ease:Quad.easeInOut});
    }

}
	
}
