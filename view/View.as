
package view
{
import flash.text.TextField;
import flash.text.TextFormat;
	import mvc.Model;
	import mvc.Controller;
	import flash.display.*;
	import flash.events.*;

	import flash.net.URLRequest;
    import com.greensock.*;
	import com.greensock.easing.*;
	
	public class View extends MovieClip
	{
		private var _model:Model;
		private var _controller:Controller;
        private var resp:Resp;
        private var lungBtn:LungBtn
        private var foodBtn:FoodBtn;
        private var bodySimBG:BodySimBG = new BodySimBG;
        private var gis:Gis;

		public function View(model:Model, controller:Controller)
		{
			_model = model;
			_controller = controller;

            resp = new Resp(model,controller);
            lungBtn = new LungBtn(model,controller);
            foodBtn = new FoodBtn(model,controller);
            gis = new Gis(model,controller);
			init();
		}
		
		private function init():void{
			initModelEventListeners();
            creation();
		}

		private function initModelEventListeners():void{
			//_model.addEventListener(Model.OXEGEN_AMOUNT, currOxegenAmoutHandler);
		}

        private function creation (){
          addChild(bodySimBG);
          addChild(resp);
          addChild(lungBtn);
          addChild(foodBtn);
          addChild(gis);

       }

	}



}