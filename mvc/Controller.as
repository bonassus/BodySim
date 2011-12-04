

package mvc
{
	import flash.events.Event;
	

	public class Controller
	{
		private var _model:Model;
		private var _sliderAmout:Number;


		public function Controller(model:Model){
			_model = model;
		}

        public function set sliderAmout(value:Number):void {
            _sliderAmout = Math.floor(value / 20);
            _model.setOxegnAmout(_sliderAmout);
        }

        public function breathInLungsTrue():void{
              _model.breathInLungs  = true;
        }

        public function breathInLungsFalse():void{
              _model.breathInLungs  = false;
        }

        public function feedApple():void{
             _model.startFood();
        }

       public function canAddFoodToTrue():void{
            _model.setcanAddFoodToTrue();
       }

       public function startCo2():void{
            _model.startCo2();
       }

       public function oxegenInBlood():void{

             _model.oxegenInBlood();
       }


    }
}