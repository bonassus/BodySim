
package mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Model extends EventDispatcher
	{

		public static const OXEGEN_AMOUNT:String = 'Oxegen_Amount';

		public var valueObject:Object = new Object();
		

		public function Model()
		{
		}
	
		public function setOxegnAmout(Ox:Number):void{
			valueObject[OXEGEN_AMOUNT] = Ox;
			dispatchEvent(new Event(OXEGEN_AMOUNT));
		}



	}
}