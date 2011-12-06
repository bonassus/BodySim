
package view
{
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.Timer;

import mvc.Model;
	import mvc.Controller;
	import flash.display.*;
	import flash.events.*;

	import flash.net.URLRequest;
    import com.greensock.*;
	import com.greensock.easing.*;
	
	public class View extends MovieClip
	{
		private var _model:Model;
		private var _controller:Controller;
        private var respiratory:Resp;
        private var digestive:Digestive;
        private var totalCo2Text:TextDisplay = new TextDisplay("0x0061a8",true,40,10);
        private var oxegenInLungsText:TextDisplay = new TextDisplay("0x0061a8",true,40,10);

        private var cellOxText:TextDisplay = new TextDisplay("0xce9f0f",true,40,10);
        private var cellCo2Text:TextDisplay = new TextDisplay("0xce9f0f",true,40,10);

        private var glucoseText:TextDisplay = new TextDisplay("0x63991d",true,40,0);
        private var starchText:TextDisplay = new TextDisplay("0x63991d",true,40,0);



      //private var score:Number = 10;
     //  private var targetScore:Number = 100;

         private var weightNeedle:WeightNeedle;

        private var totalCo2:Number;
      //  private var foodBtn:FoodBtn;
          private var _obj:Object = {};
        private var bodySimBG:BodySimBG = new BodySimBG;


		public function View(model:Model, controller:Controller){
            var score:Number = 10;
			_model = model;
			_controller = controller;
            respiratory  = new Resp(model,controller);
            weightNeedle= new WeightNeedle(model,controller);
           // foodBtn = new FoodBtn(model,controller);
            digestive = new Digestive(model,controller);
			init();
		}
		
		private function init():void{
            _obj.oxVarLow = 10;
            _obj.oxVarHigh = 100;
			initModelEventListeners();
            creation();
		}


		private function initModelEventListeners():void{
			//_model.addEventListener(Model.TOTAL_CO2, setTotalCo2);
            _model.addEventListener(Model.OXEGEN_IN_BLOOD, oxInBlood);
           // _model.addEventListener(Model.OXEGEN_OUT_BLOOD, oxOutBlood);
            _model.addEventListener(Model.CO2_UPDATE, upDateCo2R);
           _model.addEventListener(Model.FOOD, addStarchTextAmout);
            _model.addEventListener(Model.GLUCOSE_UPDATE, updateGlucoseText);
            _model.addEventListener(Model.STARCH_UPDATE, updateStarchText);
            _model.addEventListener(Model. OX_IN_CELL, oxInCell);
            _model.addEventListener(Model. FOOD_CELL, oxInCell);
            _model.addEventListener(Model.BREATH_IN_LUNGS, breathInLungsHandler);
            _model.addEventListener(Model.BREATH_OUT_LUNGS, breathOutLungsHandler);
            // _model.addEventListener(Model.FOOD, addFood)
		}



        private function creation (){
          addChild(bodySimBG);
          addChild(respiratory);


          oxegenInLungsText.x  = 1015;
          oxegenInLungsText.y = 225;
          addChild(oxegenInLungsText);
            oxegenInLungsText.theText = String(10);

          totalCo2Text.x  = 1015;
          totalCo2Text.y = 285;
          addChild(totalCo2Text);
          totalCo2Text.theText = String(10);

          cellOxText.x  = 1015;
          cellOxText.y = 585;
          addChild(cellOxText);
          cellOxText.theText = String(10);

          cellCo2Text.x  = 1015;
          cellCo2Text.y = 645;
          addChild(cellCo2Text);
            cellCo2Text.theText = String(10);

          glucoseText.x  = -15;
          glucoseText.y = 225;
          addChild(glucoseText);
          glucoseText.theText = String(0);

          starchText.x  = -15;
          starchText.y = 285;
          addChild(starchText);
          starchText.theText = String(0);

        weightNeedle.x  = 142;
        weightNeedle.y = 720;
        addChild(weightNeedle);

        addChild(digestive);
       }









       function breathInLungsHandler(e:Event){
        TweenMax.to(_obj, .5, {oxVarLow:100, onUpdate:oxText1, ease:Linear.easeNone});
       }

        function oxText1(){
             oxegenInLungsText.theText = String(Math.floor(_obj.oxVarLow));
          }



       function breathOutLungsHandler(e:Event){
        TweenMax.to(_obj, .5, {oxVarLow:10, onUpdate:oxText1, ease:Linear.easeNone});
       }



   //Oxegen in blood removed
       function oxInBlood(e:Event){
            TweenMax.to(_obj, .5, {oxVarLow:10, onUpdate:oxText1, ease:Linear.easeNone});
       }

//       function oxOutBlood(e:Event){
//      // var totalOxInBlood  = _model.bloodOxegenLevel;
//       }

       function oxInCell(e:Event){
       cellOxText.theText = String(100);
       cellCo2Text.theText = String(10);

            var cellTimer:Timer = new Timer(900, 1);
            cellTimer.addEventListener(TimerEvent.TIMER_COMPLETE, cellTimerHandler);
            cellTimer.start();

           var cellTimer2:Timer = new Timer(1700, 1);
            cellTimer2.addEventListener(TimerEvent.TIMER_COMPLETE, cellTimerHandler2);
            cellTimer2.start();
    }

    function cellTimerHandler(e:TimerEvent){
      cellOxText.theText = String(10);
       cellCo2Text.theText = String(100);
    }

    function cellTimerHandler2(e:TimerEvent){
      cellOxText.theText = String(10);
      cellCo2Text.theText = String(10);
    }

      function upDateCo2R(e:Event){


//          if(_model.totalCo2 > 100){
//             // _controller.setTotalCo2(100);
//
//             totalCo2Text.theText = String(100);
//        }else{
         totalCo2Text.theText = String(_model.totalCo2);
//        }
      }

    function updateGlucoseText(e:Event){
       glucoseText.theText = String(_model.glucoseTotal);
    }


    function addStarchTextAmout(e:Event){
      _controller.addStarchAmount(5);
    }

    function updateStarchText(e:Event){
        if(_model.starchTotal > 100){
             starchText.theText = String(100);
        }else{
          starchText.theText = String(_model.starchTotal);
        }

    }




	}



}