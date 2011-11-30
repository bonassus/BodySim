
package mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Model extends EventDispatcher
	{

		public static const OXEGEN_AMOUNT:String = 'Oxegen_Amount';
        public static const BREATH_IN_LUNGS:String = 'BreathInLungs';
        public static const FOOD:String = 'Food';

		//public var valueObject:Object = new Object();
		private var _oxegenAmout:Number;
        private var  _breathInLungs:Boolean = false;
		public function Model()
		{
		}
	
		public function setOxegnAmout(Ox:Number):void{
			_oxegenAmout = Ox;
			dispatchEvent(new Event(OXEGEN_AMOUNT));
		}

        public function startFood():void{
             dispatchEvent(new Event(FOOD));
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