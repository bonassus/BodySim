
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
        private var totalCo2Text:TextDisplay = new TextDisplay("0x0061a8",true,40,0);
        private var totalOxInBloodText:TextDisplay = new TextDisplay("0x0061a8",true,40,0);

        private var cellOxText:TextDisplay = new TextDisplay("0xce9f0f",true,40,0);
        private var cellCo2Text:TextDisplay = new TextDisplay("0xce9f0f",true,40,0);

        private var glucoseText:TextDisplay = new TextDisplay("0x63991d",true,40,0);
        private var starchText:TextDisplay = new TextDisplay("0x63991d",true,40,0);

         private var weightNeedle:WeightNeedle;

        private var totalCo2:Number;
      //  private var foodBtn:FoodBtn;

        private var bodySimBG:BodySimBG = new BodySimBG;


		public function View(model:Model, controller:Controller){
			_model = model;
			_controller = controller;
            respiratory  = new Resp(model,controller);
            weightNeedle= new WeightNeedle(model,controller);
           // foodBtn = new FoodBtn(model,controller);
            digestive = new Digestive(model,controller);
			init();
		}
		
		private function init():void{
			initModelEventListeners();
            creation();
		}

		private function initModelEventListeners():void{
			//_model.addEventListener(Model.TOTAL_CO2, setTotalCo2);
            _model.addEventListener(Model.OXEGEN_IN_BLOOD, oxInBlood);
            _model.addEventListener(Model.OXEGEN_OUT_BLOOD, oxOutBlood);
            _model.addEventListener(Model.CO2_UPDATE, upDateCo2R);
           _model.addEventListener(Model.FOOD, addStarchTextAmout);
            _model.addEventListener(Model.GLUCOSE_UPDATE, updateGlucoseText);
            _model.addEventListener(Model.STARCH_UPDATE, updateStarchText);
            _model.addEventListener(Model. OX_IN_CELL, oxInCell);
            _model.addEventListener(Model. FOOD_CELL, oxInCell);

            // _model.addEventListener(Model.FOOD, addFood)
		}



        private function creation (){
          addChild(bodySimBG);
          addChild(respiratory);


          totalOxInBloodText.x  = 1015;
          totalOxInBloodText.y = 225;
          addChild(totalOxInBloodText);

          totalCo2Text.x  = 1015;
          totalCo2Text.y = 285;
          addChild(totalCo2Text);

          cellOxText.x  = 1015;
          cellOxText.y = 585;
          addChild(cellOxText);

          cellCo2Text.x  = 1015;
          cellCo2Text.y = 645;
          addChild(cellCo2Text);

          glucoseText.x  = -15;
          glucoseText.y = 225;
          addChild(glucoseText);

          starchText.x  = -15;
          starchText.y = 285;
          addChild(starchText);

        weightNeedle.x  = 142;
        weightNeedle.y = 720;
        addChild(weightNeedle);

        addChild(digestive);
       }




       function oxInBlood(e:Event){
       totalOxInBloodText.theText = String(_model.bloodOxegenLevel);
       }

       function oxOutBlood(e:Event){

      // var totalOxInBlood  = _model.bloodOxegenLevel;
       totalOxInBloodText.theText = String(_model.bloodOxegenLevel);


       }

       function oxInCell(e:Event){
       cellOxText.theText = String(100);
       cellCo2Text.theText = String(0);

            var cellTimer:Timer = new Timer(900, 1);
            cellTimer.addEventListener(TimerEvent.TIMER_COMPLETE, cellTimerHandler);
            cellTimer.start();

           var cellTimer2:Timer = new Timer(1700, 1);
            cellTimer2.addEventListener(TimerEvent.TIMER_COMPLETE, cellTimerHandler2);
            cellTimer2.start();
    }

    function cellTimerHandler(e:TimerEvent){
      cellOxText.theText = String(0);
       cellCo2Text.theText = String(100);
    }

    function cellTimerHandler2(e:TimerEvent){
      cellOxText.theText = String(0);
      cellCo2Text.theText = String(0);
    }

      function upDateCo2R(e:Event){
          totalCo2Text.theText = String(_model.totalCo2);

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