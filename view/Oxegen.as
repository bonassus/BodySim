
package  view {
import flash.display.MovieClip;
import com.greensock.*;
import com.greensock.easing.*;
import flash.display.*;
import flash.events.*;
import mvc.Model;
import mvc.Controller;



public class Oxegen extends MovieClip {
       private var _model:Model;
       private var _controller:Controller;
       private var breathAni:BreathAni = new BreathAni;
       private var oxegenAni:OxegenAni = new OxegenAni;
       private var co2Amount:Number  = 10;
       private var oxAniPosX:Number;
       private var oxAniPosY:Number;
       private var _oxegenAmount:Number = 5;
       private var  oxegenAniStopped:Boolean = true;
       private var theOxegenAmout:Number  = 5;

	public function Oxegen(model:Model, controller:Controller){
            _model = model;
            _controller = controller;
             oxAniPosX = _model.ResPosX;
             oxAniPosY = _model.ResPosY;
            init();
		}

    private function init():void{
			initModelEventListeners();
            initAni();
		}

    private function initModelEventListeners():void{

			_model.addEventListener(Model.OXEGEN_AMOUNT, currOxegenAmoutHandler);

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


             breathAni.addEventListener("airIn", oxegenInBlood);
             breathAni.addEventListener("BreathIn",  BreathIn);
             breathAni.addEventListener("BreathOut",  BreathOut);


             oxegenAni.addEventListener("stopped", oxegenAniEnd);
             oxegenAni.addEventListener("playing", oxAbsorbPlaying);
              oxegenAni.addEventListener("cell", oxInCell);

        }

        function BreathIn(e:Event){
               _controller.breathInLungsTrue();
               }

         function BreathOut(e:Event){
                _controller.breathInLungsFalse();
               }



        function oxegenInBlood(e:Event){

             if (oxegenAniStopped == true){

                 setOxegenAmount();
                 _controller.oxegenInBlood();

                  oxegenAni.gotoAndPlay("one");


                   switch(_oxegenAmount){

              case 0:


               oxegenAni.ox1.visible = false;
               oxegenAni.ox2.visible = false;
               oxegenAni.ox3.visible = false;
               oxegenAni.ox4.visible = false;
               oxegenAni.ox5.visible = false;
               oxegenAni.ox6.visible = true;
               oxegenAni.ox7.visible = true;
               oxegenAni.ox8.visible = true;
               oxegenAni.ox9.visible = true;
               oxegenAni.ox10.visible = true;


               breathAni.ox6.visible = false;
               breathAni.ox7.visible = false;
               breathAni.ox8.visible = false;
               breathAni.ox9.visible = false;
               breathAni.ox10.visible = false;


             break;

             case 1:

              oxegenAni.ox1.visible = false;
               oxegenAni.ox2.visible = false;
               oxegenAni.ox3.visible = false;
               oxegenAni.ox4.visible = false;
               oxegenAni.ox5.visible = true;
               oxegenAni.ox6.visible = true;
               oxegenAni.ox7.visible = true;
               oxegenAni.ox8.visible = true;
               oxegenAni.ox9.visible = true;
               oxegenAni.ox10.visible = true;

               breathAni.ox5.visible = false;
               breathAni.ox6.visible = false;
               breathAni.ox7.visible = false;
               breathAni.ox8.visible = false;
               breathAni.ox9.visible = false;
               breathAni.ox10.visible = false;


             break;

             case 2:

               oxegenAni.ox1.visible = false;
               oxegenAni.ox2.visible = false;
               oxegenAni.ox3.visible = false;
               oxegenAni.ox4.visible = true;
               oxegenAni.ox5.visible = true;
               oxegenAni.ox6.visible = true;
               oxegenAni.ox7.visible = true;
               oxegenAni.ox8.visible = true;
               oxegenAni.ox9.visible = true;
               oxegenAni.ox10.visible = true;

               breathAni.ox4.visible = false;
               breathAni.ox5.visible = false;
               breathAni.ox6.visible = false;
               breathAni.ox7.visible = false;
               breathAni.ox8.visible = false;
               breathAni.ox9.visible = false;
               breathAni.ox10.visible = false;



            break;

            case 3:

               oxegenAni.ox1.visible = false;
               oxegenAni.ox2.visible = false;
               oxegenAni.ox3.visible = true;
               oxegenAni.ox4.visible = true;
               oxegenAni.ox5.visible = true;
               oxegenAni.ox6.visible = true;
               oxegenAni.ox7.visible = true;
               oxegenAni.ox8.visible = true;
               oxegenAni.ox9.visible = true;
               oxegenAni.ox10.visible = true;

               breathAni.ox3.visible = false;
               breathAni.ox4.visible = false;
               breathAni.ox5.visible = false;
               breathAni.ox6.visible = false;
               breathAni.ox7.visible = false;
               breathAni.ox8.visible = false;
               breathAni.ox9.visible = false;
               breathAni.ox10.visible = false;


            break;

            case 4:

               oxegenAni.ox1.visible = false;
               oxegenAni.ox2.visible = true;
               oxegenAni.ox3.visible = true;
               oxegenAni.ox4.visible = true;
               oxegenAni.ox5.visible = true;
               oxegenAni.ox6.visible = true;
               oxegenAni.ox7.visible = true;
               oxegenAni.ox8.visible = true;
               oxegenAni.ox9.visible = true;
               oxegenAni.ox10.visible = true;

               breathAni.ox2.visible = false;
               breathAni.ox3.visible = false;
               breathAni.ox4.visible = false;
               breathAni.ox5.visible = false;
               breathAni.ox6.visible = false;
               breathAni.ox7.visible = false;
               breathAni.ox8.visible = false;
               breathAni.ox9.visible = false;
               breathAni.ox10.visible = false;


                break;

            case 5:

               oxegenAni.ox1.visible = true;
               oxegenAni.ox2.visible = true;
               oxegenAni.ox3.visible = true;
               oxegenAni.ox4.visible = true;
               oxegenAni.ox5.visible = true;
               oxegenAni.ox6.visible = true;
               oxegenAni.ox7.visible = true;
               oxegenAni.ox8.visible = true;
               oxegenAni.ox9.visible = true;
               oxegenAni.ox10.visible = true;
//
//
               breathAni.ox1.visible = false;
               breathAni.ox2.visible = false;
               breathAni.ox3.visible = false;
               breathAni.ox4.visible = false;
               breathAni.ox5.visible = false;
               breathAni.ox6.visible = false;
               breathAni.ox7.visible = false;
               breathAni.ox8.visible = false;
               breathAni.ox9.visible = false;
               breathAni.ox10.visible = false;



            break;


            default:
               co2Amount = 10
               oxegenAni.ox1.visible = true;
               oxegenAni.ox2.visible = true;
               oxegenAni.ox3.visible = true;
               oxegenAni.ox4.visible = true;
               oxegenAni.ox5.visible = true;
               oxegenAni.ox6.visible = true;
               oxegenAni.ox7.visible = true;
               oxegenAni.ox8.visible = true;
               oxegenAni.ox9.visible = true;
               oxegenAni.ox10.visible = true;



               breathAni.ox1.visible = true;
               breathAni.ox2.visible = true;
               breathAni.ox3.visible = true;
               breathAni.ox4.visible = true;
               breathAni.ox5.visible = true;
               breathAni.ox6.visible = true;
               breathAni.ox7.visible = true;
               breathAni.ox8.visible = true;
               breathAni.ox9.visible = true;
               breathAni.ox10.visible = true;



               }

              }
        }

     function setOxegenAmount(){
     _oxegenAmount = theOxegenAmout;
     }





        function oxegenAniEnd(e:Event){

             oxegenAniStopped = true;
            _controller.oxegenOutBlood();
            _controller.startCo2();
        }

    function oxInCell(e:Event){
        _controller.oxInCell();
    }


         function oxAbsorbPlaying(e:Event){
             oxegenAniStopped = false;
        }

	}

}
