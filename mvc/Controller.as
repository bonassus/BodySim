

package mvc
{
	import flash.events.Event;
	

	public class Controller
	{
		private var _model:Model;
		private var _sliderAmout:Number;


		public function Controller(model:Model)
		{
			_model = model;
			initModelEventListeners();
		}
		


	
		private function initModelEventListeners():void{
		//	_model.addEventListener(Model.OXEGEN_AMOUNT, OxegenAmoutUpdateHandler);

		}
		

		//private function OxegenAmoutUpdateHandler(eve:Event):void{
	//	var oxegnAmout:Number = _model.valueObject[Model.OXEGEN_AMOUNT];
		//	_model.setOxegnAmout(oxegnAmout);
		//}


        public function set sliderAmout(value:Number):void {
            _sliderAmout = Math.floor(value / 20);
            _model.setOxegnAmout(_sliderAmout);


        }
    }
}