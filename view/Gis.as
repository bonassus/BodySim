package  view{
	
import flash.display.MovieClip;
import com.greensock.*;
import com.greensock.easing.*;
import flash.display.*;
import flash.events.*;
import mvc.Model;
import mvc.Controller;

	
	public class Gis extends MovieClip{
      private var _model:Model;
       private var _controller:Controller;
      private var foodBtn:FoodBtn;

       private var starchChain1:StarchChain = new StarchChain;
       private var starchChain2:StarchChain2 = new StarchChain2;
       private var starchChain3:StarchChain3 = new StarchChain3;
       private var starchChain4:StarchChain4 = new StarchChain4;
       private var starchChain5:StarchChain5 = new StarchChain5;
       private var protienInBlood:Boolean = false;
       private var canAddFood:Boolean = true;

       private var protienChain1:ProtienChain1 = new ProtienChain1;
       private var protienChain2:ProtienChain2 = new ProtienChain2;

       private var oxAniPosX:Number;
       private var oxAniPosY:Number;

       private var cO2_1:CO2_1 = new CO2_1;
       private var cO2_1_5:cO2_last = new cO2_last;
       private var cO2_2:CO2_2 = new CO2_2;
       private var cO2_3:CO2_3 = new CO2_3;
       private var cO2_4:CO2_4 = new CO2_4;
       private var cO2_5:CO2_5 = new CO2_5;
       private var cO2_6:CO2_6 = new CO2_6;
       private var cO2Array = [cO2_1,cO2_2,cO2_3,cO2_4,cO2_5,cO2_6];
       private var cO2inLung1:CO2_1inLung = new CO2_1inLung;
        private var cO2_5inLung:cO2inLungLast = new cO2inLungLast;

       private var cO2inLung2:CO2_2inLung = new CO2_2inLung;
       private var cO2inLung3:CO2_3inLung = new CO2_3inLung;
       private var cO2inLung4:CO2_4inLung = new CO2_4inLung;
       private var cO2inLung5:CO2_5inLung = new CO2_5inLung;
       private var cO2inLung6:CO2_6inLung = new CO2_6inLung;

       private var cO2inLungArray = [cO2inLung1,cO2inLung2,cO2inLung3,cO2inLung4,cO2inLung5,cO2inLung6];
       private var cO2LeavingLungs1:CO2_1LeavingLungs = new CO2_1LeavingLungs;

       private var cO2_5LeavingLung:cO2LeavingLungsLast = new cO2LeavingLungsLast;

       private var cO2LeavingLungs2:CO2_2LeavingLungs = new CO2_2LeavingLungs;
       private var cO2LeavingLungs3:CO2_3LeavingLungs = new CO2_3LeavingLungs;
       private var cO2LeavingLungs4:CO2_4LeavingLungs = new CO2_4LeavingLungs;
       private var cO2LeavingLungs5:CO2_5LeavingLungs = new CO2_5LeavingLungs;
       private var cO2LeavingLungs6:CO2_6LeavingLungs = new CO2_6LeavingLungs;
       private var cO2LeavingLungArray = [cO2LeavingLungs1,cO2LeavingLungs2,cO2LeavingLungs3,cO2LeavingLungs4,cO2LeavingLungs5,cO2LeavingLungs6 ];
        private var starchChainArray = [ starchChain1,starchChain2,starchChain3,starchChain4,starchChain5];
         //private var starch2:Starch2 = new Starch2;
       //  private var starch3:Starch3 = new Starch3;
      // private var starchArray = [ starch1,starch2,starch3];
      // private var foodBtn:FoodBtn = new FoodBtn;
        public function Gis(model:Model, controller:Controller){
            _model = model;
            _controller = controller;
            foodBtn = new FoodBtn(model,controller);
            oxAniPosX = _model.ResPosX ;
            oxAniPosY = _model.ResPosY ;
            init();
		}

    private function init():void{

        protienChain1.alpha = 0;
        protienChain1.x = oxAniPosX - 660;

        addChild(protienChain1);
        protienChain1.addEventListener("end", protienChainEnd1);
        protienChain2.addEventListener("intoBlood", protienIntoBlood);
        protienChain2.addEventListener("end", protienChainEnd2);


        protienChain2.alpha = 0;
        protienChain2.x = oxAniPosX - 660;
        addChild(protienChain2);

          cO2_1_5.addEventListener("end", protienChainEnd2);
        cO2_1_5.x  = oxAniPosX;
        cO2_1_5.y  = oxAniPosY;
        cO2_1_5.visible = false;
        addChild(cO2_1_5);

        cO2_5inLung.x  = oxAniPosX;
        cO2_5inLung.y  = oxAniPosY;
        cO2_5inLung.visible = false;
        addChild(cO2_5inLung);

          cO2_5LeavingLung.x  = oxAniPosX;
        cO2_5LeavingLung.y  = oxAniPosY;
        cO2_5LeavingLung.visible = false;
        addChild(cO2_5LeavingLung);

        foodBtn.x = oxAniPosX - 1780;
        foodBtn.y = oxAniPosY -30;
        addChild(foodBtn);

             for(var i = 0; i<starchChainArray.length; i++){
               starchChainArray[i].x = oxAniPosX - 660;
               addChild(starchChainArray[i]);
               starchChainArray[i].alpha = 0;
             }

            for(var j = 0; j<6; j++){
            cO2Array[j].x  = oxAniPosX ;
            cO2Array[j].y  = oxAniPosY;

            addChild(cO2Array[j]);
            cO2inLungArray[j].x  = oxAniPosX;
            cO2inLungArray[j].y  = oxAniPosY;
            cO2inLungArray[j].visible = false;

            addChild(cO2inLungArray[j]);
            cO2LeavingLungArray[j].x = oxAniPosX;
            cO2LeavingLungArray[j].y = oxAniPosY;
            cO2LeavingLungArray[j].visible = false;

            addChild(cO2LeavingLungArray[j]);}
        _model.addEventListener(Model.FOOD, checkToAddFood)
		    }



        function checkToAddFood(e:Event){
        addFood();
        }

           function addFood(){

              protienChain1.alpha = 1;
              protienChain1.gotoAndPlay("one");
              starchChain1.alpha = 1;
              starchChain1.gotoAndPlay("one");
              starchChain1.addEventListener("end", starchChainEnd1);
              starchChain2.addEventListener("end", starchChainEnd2);
              starchChain3.addEventListener("end", starchChainEnd3);
              starchChain4.addEventListener("end", starchChainEnd4);

               starchChain4.addEventListener("g1", starchChainEnd4g1);
               starchChain4.addEventListener("g2", starchChainEnd4g2);
               starchChain4.addEventListener("g3", starchChainEnd4g3);
               starchChain4.addEventListener("g4", starchChainEnd4g4);
               starchChain4.addEventListener("cell", foodCell);
                starchChain5.addEventListener("cell", foodCell);
                protienChain2.addEventListener("cell", foodCell);

              starchChain5.addEventListener("end", starchChainEnd5);
              starchChain5.addEventListener("g5", starchChainEnd5g5);
           }

        function starchChainEnd1(e:Event){
          starchChain2.alpha = 1;
          starchChain2.gotoAndPlay("one");
        }


         function protienChainEnd1(e:Event){
         protienChain1.alpha = 0;
         protienChain1.gotoAndStop("first");
         protienChain2.alpha = 1;
         protienChain2.gotoAndPlay("one");
         }




        function protienIntoBlood(e:Event){
              protienInBlood = true;
            }


        function starchChainEnd2(e:Event){
              if(protienInBlood == true){

                  starchChain2.alpha = 0;
                starchChain2.gotoAndStop("first");

                starchChain3.alpha = 1;
                starchChain3.gotoAndPlay("one");
        }

        }

        function starchChainEnd3(e:Event){

          starchChain3.alpha = 0;
          starchChain3.gotoAndStop("first");

          starchChain4.alpha = 1;
          starchChain4.gotoAndPlay("one");
          starchChain5.alpha = 1;
          starchChain5.gotoAndPlay("one");

            _controller.canAddFoodToTrue();
        }

        function starchChainEnd4(e:Event){
            _controller.co2InBlood(3);
             _controller.subGlucose(4);

          starchChain4.alpha = 0;
          starchChain4.gotoAndStop("first");

          for(var j = 0; j<3; j++){
            cO2Array[j].play();
            cO2Array[j].visible = true;
            cO2Array[0].addEventListener("end", co2end);
            }
        }

        function foodCell(e:Event){
        _controller.foodCell()
        }



       function protienChainEnd2(e:Event){
           _controller.co2InBlood(3);

            for(var j = 3; j<6; j++){
            cO2Array[j].play();
            cO2Array[j].visible = true;
            cO2Array[3].addEventListener("end", co2endP);

            }
         }

          function co2endP(e:Event){
              _controller.co2OutBlood(3);

               for(var j = 3; j<6; j++){
               cO2Array[j].visible = false;
               cO2inLungArray[j].gotoAndPlay("one");
               cO2inLungArray[j].visible = true;
               cO2inLungArray[3].addEventListener("end", cO2_2inLungEndP);

                   cO2Array[j].removeEventListener("end", co2endP);
               }
              }

              function cO2_2inLungEndP(e:Event){
                if(_model.breathInLungs == true){
                    for(var j = 3; j<6; j++){
                     cO2inLungArray[j].visible = false;
                     cO2inLungArray[j].gotoAndStop("first");
                      cO2LeavingLungArray[j].gotoAndPlay("one");
                     cO2LeavingLungArray[j].visible = true;
                      cO2LeavingLungArray[3].addEventListener("end", cO2_2LeavingEndP);
                        cO2inLungArray[j].removeEventListener("end", cO2_2inLungEndP);
                   }
               }
           }


            function cO2_2LeavingEndP(e:Event){
                  for(var j = 3; j<6; j++){
                     cO2inLungArray[j].visible = false;
                     cO2inLungArray[j].gotoAndStop("first");
                     cO2LeavingLungArray[j].visible = false;
                     cO2LeavingLungArray[j].gotoAndStop("first");
                     cO2LeavingLungArray[j].removeEventListener("end", cO2_2LeavingEndP);
               }
            }


        function co2end(e:Event){
            _controller.co2OutBlood(3);

            canAddFood = false;
            for(var j = 0; j<3; j++){
            cO2Array[j].visible = false;
            cO2inLungArray[j].gotoAndPlay("one");
            cO2inLungArray[j].visible = true;
           cO2inLungArray[0].addEventListener("end", cO2_2inLungEnd);
            cO2Array[j].removeEventListener("end", co2end);
             }
           }

           function cO2_2inLungEnd(e:Event){

             if(_model.breathInLungs == true){
                 for(var j = 0; j<3; j++){
                  cO2inLungArray[j].visible = false;
                  cO2inLungArray[j].gotoAndStop("first");
                  cO2LeavingLungArray[j].gotoAndPlay("one");
                  cO2LeavingLungArray[j].visible = true;
                  cO2LeavingLungArray[0].addEventListener("end", cO2_2LeavingEnd);
                  cO2inLungArray[j].removeEventListener("end", cO2_2inLungEnd);
                }
            }
        }

         function cO2_2LeavingEnd(e:Event){
               for(var j = 0; j<3; j++){
                 cO2inLungArray[j].visible = false;
                 cO2inLungArray[j].gotoAndStop("first");
                 cO2LeavingLungArray[j].visible = false;
                 cO2LeavingLungArray[j].gotoAndStop("first");
                 cO2LeavingLungArray[j].removeEventListener("end", cO2_2LeavingEnd);
                 }
         }
        //----------------------------------------------------------------------
//       function starchChainEnd5(e:Event){
////          starchChain5.alpha = 0;
////          starchChain5.gotoAndStop("first");
////           trace("5end");
//        }

         function starchChainEnd5(e:Event){
             _controller.co2InBlood(1);
             _controller.subGlucose(1);
              starchChain5.alpha = 0;
          starchChain5.gotoAndStop("first");
           trace("5end");

            cO2_1_5.visible = true;
            cO2_1_5.gotoAndPlay("one");
             cO2_1_5.addEventListener("end2", co2_5end);
         }



        function co2_5end(e:Event){
             _controller.co2OutBlood(1);
                 trace("intering lungs");
               cO2_1_5.visible = false;
               cO2_5inLung.gotoAndPlay("one");
               cO2_5inLung.visible = true;
                cO2_5inLung.addEventListener("end2", cO2_2_5inLungEnd);

               cO2_1_5.removeEventListener("end2", co2_5end);

              }

              function cO2_2_5inLungEnd(e:Event){
                if(_model.breathInLungs == true){
                      trace("leaving lungs");
                     cO2_5inLung.visible = false;
                     cO2_5inLung.gotoAndStop("first");
                     cO2_5LeavingLung.gotoAndPlay("one");
                    cO2_5LeavingLung.visible = true;
                    cO2_5LeavingLung.addEventListener("end2", cO2_2_5LeavingEnd);
                   cO2_5inLung.removeEventListener("end2", cO2_2_5inLungEnd);

               }
           }


            function cO2_2_5LeavingEnd(e:Event){

                     cO2_5inLung.visible = false;
                     cO2_5inLung.gotoAndStop("first");
                     cO2_5LeavingLung.visible = false;
                     cO2_5LeavingLung.gotoAndStop("first");
                     cO2_5LeavingLung.removeEventListener("end2", cO2_2_5LeavingEnd);

            }

    function starchChainEnd4g1(e:Event){
          _controller.addGlucose(1);
         _controller.subStarchAmount(1);
        }
    function starchChainEnd4g2(e:Event){
          _controller.addGlucose(1);
         _controller.subStarchAmount(1);
        }
    function starchChainEnd4g3(e:Event){
          _controller.addGlucose(1);
         _controller.subStarchAmount(1);
        }
    function starchChainEnd4g4(e:Event){
           _controller.addGlucose(1);
         _controller.subStarchAmount(1);
        }
     function starchChainEnd5g5(e:Event){
           _controller.addGlucose(1);
          _controller.subStarchAmount(1);
        }

	}
	
}
