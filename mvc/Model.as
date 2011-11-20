
package mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Model extends EventDispatcher
	{

		public static const OXEGEN_AMOUNT:String = 'Oxegen_Amount';

		//public var valueObject:Object = new Object();
		private var _oxegenAmout:Number;

		public function Model()
		{
		}
	
		public function setOxegnAmout(Ox:Number):void{
			_oxegenAmout = Ox;
			dispatchEvent(new Event(OXEGEN_AMOUNT));
		}


        public function get oxegenAmout():Number {
            return _oxegenAmout;
        }
    }
}