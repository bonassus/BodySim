

package mvc
{
	import flash.events.Event;
	

	public class Controller
	{
		private var _model:Model;
		private var _sliderAmout:Number = 5;


		public function Controller(model:Model){
			_model = model;
		}

        public function set sliderAmout(value:Number):void {
            _sliderAmout = Math.floor(value / 20);
            _model.setOxegnAmout(_sliderAmout);
        }

        public function breathInLungsTrue():void{
              _model.breathInLungs  = true;
            _model.oxegenInLungs();
        }

        public function breathInLungsFalse():void{
              _model.breathInLungs  = false;
            _model.oxegenOutLungs();
        }

        public function feedApple():void{
             _model.startFood();

        }

        public function dialIncrement(amount:Number):void{
            _model.setDialAmount(amount);
         }

       public function resetFoodBtn():void{
            _model.resetFoodBtn();
       }

       public function startCo2():void{
            _model.startCo2();
       }

       public function oxegenInBlood():void{

          _model.bloodOxegenLevel = 10 *(_sliderAmout+ 5);
           _model.oxegenInBlood();
       }

       public function oxegenOutBlood():void{
           _model.bloodOxegenLevel = 0;
           _model.oxegenOutBlood();
       }

//       public function setTotalCo2(amount:Number):void{
//           var quantity:Number;
//
//             quantity += amount;
//           trace(quantity + "quantity");
//            _model.totalCo2  = quantity;
//       }

        public function co2InLungs(amount:Number){
          _model.addToTotalCo2(amount);
          _model.upDateCo2R();
       }

        public function co2OutLungs(amount:Number){
         _model.subToTotalCo2(amount);
         _model.upDateCo2R();

       }

//       public function setTotalCo2(amount:Number){
//           _model.totalCo2 = amount;
//       }

//       public function co2InBlood(amount:Number){
//          _model.addToTotalCo2(amount);
//          _model.upDateCo2R();
//       }
//
//        public function co2OutBlood(amount:Number){
//         _model.subToTotalCo2(amount);
//         _model.upDateCo2R();
//
//       }

        public function foodCell(){
         _model.foodCell();
        }

        public function addGlucose(amount:Number){
         _model.addGlucose(amount);
         _model.upDateGlucose();
       }

       public function subGlucose(amount:Number){
         _model.subGlucose(amount);
         _model.upDateGlucose();
       }



       public function addStarchAmount(amount:Number){
         _model.addStarch(amount);
         _model.upDateStarch();
       }

       public function subStarchAmount(amount:Number){
         _model.subStarch(amount);
         _model.upDateStarch();
       }

       public function oxInCell(){
         _model.oxInCell();
       }


    }
}