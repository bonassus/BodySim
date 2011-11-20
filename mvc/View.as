
package mvc
{
	import slider.Slider;
	
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	
	public class View extends MovieClip
	{
		private var _model:Model;
		private var _controller:Controller;

		public function View(model:Model, controller:Controller)
		{
			_model = model;
			_controller = controller;
			init();
		}
		
		private function init():void{
			initModelEventListeners();

			initSliders();
		}
		


		private function initModelEventListeners():void{
			_model.addEventListener(Model.OXEGEN_AMOUNT, currOxegenAmoutHandler);
		}
			

		private function currOxegenAmoutHandler(eve:Event):void{
			trace(_model.valueObject[Model.OXEGEN_AMOUNT]);
		}
		

		private function initSliders():void{

             var thumb1:Thumb = new Thumb();
             var track1:Track = new Track();

			
			var slider1:Slider = new Slider(thumb1, track1, 0, 349);
            slider1.x = 300;
            slider1.y = 300;
			addChild(slider1);

           // trace(slider1.svalue);
            sliderPercent

		}
		

	}
}