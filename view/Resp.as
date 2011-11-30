package  view {
import flash.display.MovieClip;
import com.greensock.*;
import com.greensock.easing.*;
import flash.display.*;
import flash.events.*;
import mvc.Model;
import mvc.Controller;

public class Resp extends MovieClip {
       private var _model:Model;
       private var _controller:Controller;
       private var ox1:Ox1 = new Ox1;
       private var ox2:Ox2 = new Ox2;
       private var ox3:Ox3 = new Ox3;
       private var ox4:Ox4 = new Ox4;
       private var ox5:Ox5 = new Ox5;
       private var oxArray = [ox1,ox2,ox3,ox4,ox5];
       private var cO2_1:CO2_1 = new CO2_1;
       private var cO2_2:CO2_2 = new CO2_2;
       private var cO2_3:CO2_3 = new CO2_3;
       private var cO2_4:CO2_4 = new CO2_4;
       private var cO2_5:CO2_5 = new CO2_5;
       private var cO2_6:CO2_6 = new CO2_6;
       private var cO2Array = [cO2_1,cO2_2,cO2_3,cO2_4,cO2_5,cO2_6];
       private var cO2inLung1:CO2_1inLung = new CO2_1inLung;
       private var cO2inLung2:CO2_2inLung = new CO2_2inLung;
       private var cO2inLung3:CO2_3inLung = new CO2_3inLung;
       private var cO2inLung4:CO2_4inLung = new CO2_4inLung;
       private var cO2inLung5:CO2_5inLung = new CO2_5inLung;
       private var cO2inLung6:CO2_6inLung = new CO2_6inLung;
       private var cO2inLungArray = [cO2inLung1,cO2inLung2,cO2inLung3,cO2inLung4,cO2inLung5,cO2inLung6];
       private var cO2LeavingLungs1:CO2_1LeavingLungs = new CO2_1LeavingLungs;
       private var cO2LeavingLungs2:CO2_2LeavingLungs = new CO2_2LeavingLungs;
       private var cO2LeavingLungs3:CO2_3LeavingLungs = new CO2_3LeavingLungs;
       private var cO2LeavingLungs4:CO2_4LeavingLungs = new CO2_4LeavingLungs;
       private var cO2LeavingLungs5:CO2_5LeavingLungs = new CO2_5LeavingLungs;
       private var cO2LeavingLungs6:CO2_6LeavingLungs = new CO2_6LeavingLungs;
       private var cO2LeavingLungArray = [cO2LeavingLungs1,cO2LeavingLungs2,cO2LeavingLungs3,cO2LeavingLungs4,cO2LeavingLungs5,cO2LeavingLungs6 ];
       private var breathAni:BreathAni = new BreathAni;
       private var oxegenAni:OxegenAni = new OxegenAni;
       private var oxAniPosX:Number = 645;
       private var oxAniPosY:Number = 379;
       private var  oxegenAniStopped:Boolean = true;
       private var  co2InLungs:Boolean = false;
       private var  co2EndOfLoop:Boolean = false;
       //private var  BreathInLungs:Boolean = false;
       private var theOxegenAmout:Number  = 5;

	public function Resp(model:Model, controller:Controller){
            _model = model;
            _controller = controller;
            init();
		}

    private function init():void{
			initModelEventListeners();
            initAni();
		}

    private function initModelEventListeners():void{
			_model.addEventListener(Model.OXEGEN_AMOUNT, currOxegenAmoutHandler);
       // _model.addEventListener(Model.BREATH_IN_LUNGS, breathInLungsHandler);
		}

    private function currOxegenAmoutHandler(eve:Event):void{
             theOxegenAmout = _model.oxegenAmout;
            }


         private function initAni():void{

            oxegenAni.x = oxAniPosX;
            oxegenAni.y =  oxAniPosY;

            breathAni.x = oxAniPosX;
            breathAni.y = oxAniPosY;

            addChild(oxegenAni);
            addChild(breathAni);

            for(var i = 0; i<5; i++){
             oxArray[i].x = oxAniPosX;
             oxArray[i].y = oxAniPosY;
             addChild(oxArray[i]);
            }

            for(var j = 0; j<6; j++){
            cO2Array[j].x  = oxAniPosX;
            cO2Array[j].y  = oxAniPosY;
            cO2Array[j].addEventListener("end", co2end);
            addChild(cO2Array[j]);

            cO2inLungArray[j].x  = oxAniPosX;
            cO2inLungArray[j].y  = oxAniPosY;
            cO2inLungArray[j].visible = false;
            cO2inLungArray[j].addEventListener("end", cO2_2inLungEnd);
            addChild(cO2inLungArray[j]);


            cO2LeavingLungArray[j].x = oxAniPosX;
            cO2LeavingLungArray[j].y = oxAniPosY;
            cO2LeavingLungArray[j].visible = false;
            cO2LeavingLungArray[j].addEventListener("end", cO2_2LeavingEnd);
            addChild(cO2LeavingLungArray[j]);
            }

             breathAni.addEventListener("airIn", ariIn);
             breathAni.addEventListener("BreathIn",  BreathIn);
             breathAni.addEventListener("BreathOut",  BreathOut);


             oxegenAni.addEventListener("stopped", oxAbsorbStopped);
             oxegenAni.addEventListener("playing", oxAbsorbPlaying);
        }

        function BreathIn(e:Event){
               _controller.breathInLungsTrue();
               }

         function BreathOut(e:Event){
                _controller.breathInLungsFalse();
               }


        function co2end(e:Event){
            for(var j = 0; j<6; j++){
            cO2Array[j].visible = false;
            cO2inLungArray[j].visible = true;
            cO2inLungArray[j].play();
            }
           }

           function cO2_2inLungEnd(e:Event){
             if(_model.breathInLungs == true){
                 for(var j = 0; j<6; j++){
                  cO2inLungArray[j].visible = false;
                  cO2inLungArray[j].gotoAndStop("first");
                  cO2LeavingLungArray[j].visible = true;
                  cO2LeavingLungArray[j].play();
                 }
             }
        }


         function cO2_2LeavingEnd(e:Event){
               for(var j = 0; j<6; j++){
                  cO2inLungArray[j].visible = false;
                  cO2LeavingLungArray[j].visible = false;
                 }
         }


        function ariIn(e:Event){

                  trace(theOxegenAmout);


             if (oxegenAniStopped == true){

                   switch(theOxegenAmout){

              case 0:
               ox1.alpha = 0;
               ox2.alpha = 0;
               ox3.alpha = 0;
               ox4.alpha = 0;
               ox5.alpha = 0;


               breathAni.ox6.alpha = 0;
               breathAni.ox7.alpha = 0;
               breathAni.ox8.alpha = 0;
               breathAni.ox9.alpha = 0;
               breathAni.ox10.alpha = 0;


            for(var j = 0; j<3; j++){
             cO2inLungArray[j].alpha = 0;
             cO2Array[j].alpha = 0;
             cO2LeavingLungArray[j].alpha = 0;
            }
            for(var i = 3; i<6; i++){
            cO2inLungArray[i].alpha = 1;
            cO2Array[i].alpha = 1;

             cO2LeavingLungArray[j].alpha = 1;
            }

             break;

             case 1:
               ox1.alpha = 0;
               ox2.alpha = 0;
               ox3.alpha = 0;
               ox4.alpha = 0;
               ox5.alpha = 1;


               breathAni.ox5.alpha = 0;
               breathAni.ox6.alpha = 0;
               breathAni.ox7.alpha = 0;
               breathAni.ox8.alpha = 0;
               breathAni.ox9.alpha = 0;
               breathAni.ox10.alpha = 0;

             for(var k = 0; k<3; k++){
             cO2inLungArray[k].alpha = 0;
             cO2Array[k].alpha = 0;
              cO2LeavingLungArray[k].alpha = 0;
            }
            for(var l = 3; l<6; l++){
            cO2inLungArray[l].alpha = 1;
            cO2Array[l].alpha = 1;
             cO2LeavingLungArray[l].alpha = 1;
            }

             break;

             case 2:
              ox1.alpha = 0;
              ox2.alpha = 0;
              ox3.alpha = 0;
              ox4.alpha = 1;
              ox5.alpha = 1;


               breathAni.ox4.alpha = 0;
               breathAni.ox5.alpha = 0;
               breathAni.ox6.alpha = 0;
               breathAni.ox7.alpha = 0;
               breathAni.ox8.alpha = 0;
               breathAni.ox9.alpha = 0;
               breathAni.ox10.alpha = 0;

           for(var m = 0; m<2; m++){
             cO2inLungArray[m].alpha = 0;
             cO2Array[m].alpha = 0;
              cO2LeavingLungArray[m].alpha = 0;
            }
            for(var n = 2; n<6; n++){
            cO2inLungArray[n].alpha = 1;
            cO2Array[n].alpha = 1;
             cO2LeavingLungArray[n].alpha = 1;
            }


            break;

            case 3:
              ox1.alpha = 0;
              ox2.alpha = 0;
              ox3.alpha = 1;
              ox4.alpha = 1;
              ox5.alpha = 1;


               breathAni.ox3.alpha = 0;
               breathAni.ox4.alpha = 0;
               breathAni.ox5.alpha = 0;
               breathAni.ox6.alpha = 0;
               breathAni.ox7.alpha = 0;
               breathAni.ox8.alpha = 0;
               breathAni.ox9.alpha = 0;
               breathAni.ox10.alpha = 0;

            for(var o = 0; o<2; o++){
             cO2inLungArray[o].alpha = 0;
             cO2Array[o].alpha = 0;
              cO2LeavingLungArray[o].alpha = 0;
            }
            for(var p = 2; p<6; p++){
            cO2inLungArray[p].alpha = 1;
            cO2Array[p].alpha = 1;
             cO2LeavingLungArray[p].alpha = 1;
            }

            break;

            case 4:
              ox1.alpha = 0;
              ox2.alpha = 1;
              ox3.alpha = 1;
              ox4.alpha = 1;
              ox5.alpha = 1;


               breathAni.ox2.alpha = 0;
               breathAni.ox3.alpha = 0;
               breathAni.ox4.alpha = 0;
               breathAni.ox5.alpha = 0;
               breathAni.ox6.alpha = 0;
               breathAni.ox7.alpha = 0;
               breathAni.ox8.alpha = 0;
               breathAni.ox9.alpha = 0;
               breathAni.ox10.alpha = 0;

              for(var q = 0; q<1; q++){
             cO2inLungArray[q].alpha = 0;
             cO2Array[q].alpha = 0;
              cO2LeavingLungArray[q].alpha = 0;
            }
            for(var r = 1; r<6; r++){
            cO2inLungArray[r].alpha = 1;
            cO2Array[r].alpha = 1;
             cO2LeavingLungArray[r].alpha = 1;
            }

                break;

            case 5:
               ox1.alpha = 1;
               ox2.alpha = 1;
               ox3.alpha = 1;
               ox4.alpha = 1;
               ox5.alpha = 1;

               breathAni.ox1.alpha = 0;
               breathAni.ox2.alpha = 0;
               breathAni.ox3.alpha = 0;
               breathAni.ox4.alpha = 0;
               breathAni.ox5.alpha = 0;
               breathAni.ox6.alpha = 0;
               breathAni.ox7.alpha = 0;
               breathAni.ox8.alpha = 0;
               breathAni.ox9.alpha = 0;
               breathAni.ox10.alpha = 0;

            for(var s = 0; s<6; s++){
            cO2inLungArray[s].alpha = 1;
            cO2Array[s].alpha = 1;
            cO2LeavingLungArray[s].alpha = 1;
            }

            break;


            default:
                ox1.alpha = 1;
                ox2.alpha = 1;
                ox3.alpha = 1;
                ox4.alpha = 1;
                ox5.alpha = 1;


               breathAni.ox1.alpha = 1;
               breathAni.ox2.alpha = 1;
               breathAni.ox3.alpha = 1;
               breathAni.ox4.alpha = 1;
               breathAni.ox5.alpha = 1;
               breathAni.ox6.alpha = 1;
               breathAni.ox7.alpha = 1;
               breathAni.ox8.alpha = 1;
               breathAni.ox9.alpha = 1;
               breathAni.ox10.alpha = 1;

                for(var t = 0; t<6; t++){
                cO2inLungArray[t].alpha = 1;
                cO2Array[t].alpha = 1;
                cO2LeavingLungArray[t].alpha = 1;
                }

               }






                 oxegenAni.gotoAndPlay("one");
                 for(var h = 0; h<5; h++){
                 oxArray[h].gotoAndPlay("one");
                 }
              }
        }




        function oxAbsorbStopped(e:Event){
             oxegenAniStopped = true;

             for(var j = 0; j<6; j++){
            cO2Array[j].gotoAndPlay("one");
            cO2Array[j].visible = true;
            }


        }
         function oxAbsorbPlaying(e:Event){
             oxegenAniStopped = false;
        }

	}
	
}
