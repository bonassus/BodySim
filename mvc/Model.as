
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
    }
}