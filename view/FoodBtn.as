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

       private var _model:Model;
       private var _controller:Controller;
       private var foodSlider:Slider;
       private var foodSliderBack:FoodSliderBack = new FoodSliderBack;
       private var apple:Apple = new Apple;
       private var track:FoodTrack = new FoodTrack;
       private var foodSliderAmount:Number;
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

           foodSlider = new Slider(apple,track,15, 175);
           foodSlider.x = 1000;
           foodSlider.y = 80;
           foodSlider.alpha = 1;
           addChild(foodSlider);
          foodSlider.addEventListener(Slider.SLIDER_CHANGE, slider1ChangeHandler)
        }

         function slider1ChangeHandler(eve:Event){

                    // 10 - sliderValue
             foodSliderAmount =int((foodSlider.svalue * .01)*10)/10;
             trace(1 -foodSliderAmount);
               // _controller.sliderAmout = foodSlider.svalue;

             TweenLite.to(apple, 0, {colorTransform:{tint:0xFF0000, tintAmount:(1 - foodSliderAmount)-.4}});

             if(foodSliderAmount<=.5){

                 TweenLite.to(foodSlider.thumb, .4, {x:foodSlider.boundsLeft});
                  //foodSlider.thumb.x = foodSlider.boundsLeft;
               //   trace("less then two");
             }

        }

	}
	
}
