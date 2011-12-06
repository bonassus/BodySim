
package mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Model extends EventDispatcher
	{

		public static const OXEGEN_AMOUNT:String = 'Oxegen_Amount';
        public static const BREATH_IN_LUNGS:String = 'BreathInLungs';
        public static const BREATH_OUT_LUNGS:String = 'BreathoutLungs';
        public static const FOOD:String = 'Food';
        public static const RESET_FOOD = 'Reset_Food';
        public static const START_CO2 = 'Start_Co2';
        public static const OXEGEN_IN_BLOOD = 'oxegenInBlood';
        public static const OXEGEN_OUT_BLOOD = 'oxegenOutBlood';
        public static const CO2_UPDATE = 'Co2UpDate';
        public static const GLUCOSE_UPDATE = 'Glucose_Update';
        public static const STARCH_UPDATE = 'Starch_Update';
        public static const OX_IN_CELL = 'oxInCell';
        public static const FOOD_CELL = 'food_cell';


        private var _posX:Number = 825;
        private var _posY:Number = 379;
		private var _oxegenAmout:Number = 5;
        private var  _breathInLungs:Boolean = false;
       // private var canAddFood:Boolean = true;

        private var _totalCo2:Number = 10;
        private var _glucoseTotal:Number = 0;
        private var _starchTotal:Number = 0;
        private var _bloodOxegenLevel:Number;
        private var _dialAmount:Number = 0;

        public function get dialAmount():Number {
            return _dialAmount;
        }

//        public function set dialAmount(value:Number):void {
//            _dialAmount = value;
//        }
    public function setDialAmount(amount){
         _dialAmount = _dialAmount + amount;
    }

        public function get bloodOxegenLevel():Number {
            return _bloodOxegenLevel;
        }

        public function set bloodOxegenLevel(value:Number):void {
            _bloodOxegenLevel = value;
        }

        public function Model()
		{
		}
	
		public function setOxegnAmout(Ox:Number):void{
			_oxegenAmout = Ox;
           // trace(_oxegenAmout + "from model");
			dispatchEvent(new Event(OXEGEN_AMOUNT));
		}

        public function resetFoodBtn(){
        // canAddFood = true;
         dispatchEvent(new Event(RESET_FOOD));
        }

        public function startFood():void{
              dispatchEvent(new Event(FOOD));
        }

       public function startCo2():void{
          dispatchEvent(new Event(START_CO2));
       }



       public function oxegenInBlood():void{
          dispatchEvent(new Event(OXEGEN_IN_BLOOD));
       }

        public function oxegenOutBlood():void{
         dispatchEvent(new Event(OXEGEN_OUT_BLOOD));
       }


        public function get oxegenAmout():Number {
            return _oxegenAmout;
        }

        public function get breathInLungs():Boolean {
            return _breathInLungs;
        }

        public function set breathInLungs(value:Boolean):void {
            _breathInLungs = value;


        }

        public function oxegenInLungs():void {
             dispatchEvent(new Event(BREATH_IN_LUNGS));
        }
        public function oxegenOutLungs():void {
             dispatchEvent(new Event(BREATH_OUT_LUNGS));
        }


        public function get PosX():Number {
            return _posX;
        }

        public function get PosY():Number {
            return _posY;
        }

        public function addToTotalCo2(value:Number):void {
           _totalCo2 = _totalCo2 + (value * 10);
           // trace(_totalCo2);
        }

        public function subToTotalCo2(value:Number):void {
          _totalCo2 = _totalCo2 - (value * 10);

        }

        public function get totalCo2():Number {

            if(_totalCo2 > 100){
                _totalCo2 = 100;
                return _totalCo2 ;
            }else if(_totalCo2 < 10){
                _totalCo2 = 10;
                return _totalCo2 ;
            }else{
                return _totalCo2 ;
            }




        }

        public function set totalCo2(value:Number):void {
            _totalCo2 = value;
        }

        public function upDateCo2R():void{
         dispatchEvent(new Event(CO2_UPDATE));
        }


        public function addGlucose(value:Number):void {
           _glucoseTotal = _glucoseTotal + value;
        }

        public function subGlucose(value:Number):void {
          _glucoseTotal = _glucoseTotal - value;
        }

        public function upDateGlucose():void{
         dispatchEvent(new Event(GLUCOSE_UPDATE));
        }

        public function get glucoseTotal():Number {
            return _glucoseTotal* 2;
        }

        public function addStarch(value:Number):void {
           _starchTotal = _starchTotal + value;
        }

        public function subStarch(value:Number):void {
          _starchTotal = _starchTotal - value;
        }

        public function upDateStarch():void{
         dispatchEvent(new Event(STARCH_UPDATE));
        }

        public function get starchTotal():Number {
            return _starchTotal * 2;
        }

        public function oxInCell(){
           dispatchEvent(new Event( OX_IN_CELL));
        }
       public function foodCell(){
        dispatchEvent(new Event(FOOD_CELL));
       }


    }
}