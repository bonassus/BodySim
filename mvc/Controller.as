
package mvc
{
	import flash.events.Event;
	

	public class Controller
	{
		private var _model:Model;
		

		public function Controller(model:Model)
		{
			_model = model;
			initModelEventListeners();
		}
		


	
		private function initModelEventListeners():void{
			_model.addEventListener(Model.OXEGEN_AMOUNT, OxegenAmoutUpdateHandler);

		}

        private function sliderPercent(perc:number){
           var sliderPer = perc;
            trace(sliderPer);

        }
		

		private function OxegenAmoutUpdateHandler(eve:Event):void{
		var oxegnAmout:Number = _model.valueObject[Model.OXEGEN_AMOUNT];
			_model.setOxegnAmout(oxegnAmout); 
		}
		

	}
}