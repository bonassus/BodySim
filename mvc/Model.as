
package mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Model extends EventDispatcher
	{

		public static const OXEGEN_AMOUNT:String = 'Oxegen_Amount';
        public static const BREATH_IN_LUNGS:String = 'BreathInLungs';
        public static const FOOD:String = 'Food';
        public static const RESET_FOOD = 'Reset_Food';
        public static const START_CO2 = 'Start_Co2';
        public static const OXEGEN_IN_BLOOD = 'oxegenInBlood';

        private var _ResPosX:Number = 645;
        private var _ResPosY:Number = 379;
		private var _oxegenAmout:Number;
        private var  _breathInLungs:Boolean = false;
        private var canAddFood:Boolean = true;
		public function Model()
		{
		}
	
		public function setOxegnAmout(Ox:Number):void{
			_oxegenAmout = Ox;
			dispatchEvent(new Event(OXEGEN_AMOUNT));
		}

        public function setcanAddFoodToTrue(){

         canAddFood = true;
         dispatchEvent(new Event(RESET_FOOD));
        }

        public function startFood():void{
            if(canAddFood == true){
              dispatchEvent(new Event(FOOD));
             canAddFood = false;
            }

        }
       public function startCo2():void{
          dispatchEvent(new Event(START_CO2));
       }
       public function oxegenInBlood():void{
          dispatchEvent(new Event(OXEGEN_IN_BLOOD));
       }

        public function get oxegenAmout():Number {
            return _oxegenAmout;
        }

        public function get breathInLungs():Boolean {
            return _breathInLungs;
        }

        public function set breathInLungs(value:Boolean):void {
            _breathInLungs = value;
            dispatchEvent(new Event(BREATH_IN_LUNGS));

        }

        public function get ResPosX():Number {
            return _ResPosX;
        }

        public function get ResPosY():Number {
            return _ResPosY;
        }
    }
}