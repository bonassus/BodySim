package  view {
import flash.display.MovieClip;
//import com.greensock.*;
//import com.greensock.easing.*;
import flash.display.*;
import flash.events.*;
import mvc.Model;
import mvc.Controller;

public class Resp extends MovieClip {
      // private var _model:Model;
      // private var _controller:Controller;
     private var lungBtn:LungBtn;
       private var oxegen:Oxegen;
       private var co2:Co2;
	public function Resp(model:Model, controller:Controller){
           // _model = model;
           // _controller = controller;
           oxegen = new Oxegen(model,controller);
           co2 = new Co2(model,controller);
         lungBtn = new LungBtn(model,controller);
            init();
		}

    private function init():void{

        creation();
		}

     private function creation(){
          addChild(oxegen);
          addChild(co2);
        // addChild(lungBtn);
       }

	}
	
}
