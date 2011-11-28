
package view
{
import flash.text.TextField;
import flash.text.TextFormat;
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
        private var resp:Resp;
        private var slider1:Slider;
        private var lungInvis:Invis = new Invis();
        private var lungBack:LungSliderBack = new LungSliderBack;
        private var lungBtn:LungBtn = new LungBtn;



         private var oxText:TextDisplay = new TextDisplay("0x000000",true,20);
        private var oxText2:TextDisplay = new TextDisplay("0xffffff",true,20);
        private var oxText3:TextDisplay = new TextDisplay("0xffffff",true,52);

        private var co2Text:TextDisplay = new TextDisplay("0x909090",true,21);
        private var oxLabel:TextDisplay = new TextDisplay("0x333333",true,16);
        private var co2Label:TextDisplay = new TextDisplay("0x333333",true,16);



//        private var ox1:Ox1 = new Ox1;
//        private var ox2:Ox2 = new Ox2;
//        private var ox3:Ox3 = new Ox3;
//        private var ox4:Ox4 = new Ox4;
//        private var ox5:Ox5 = new Ox5;
//        private var oxArray = [ox1,ox2,ox3,ox4,ox5];
//
//        private var cO2_1:CO2_1 = new CO2_1;
//        private var cO2_2:CO2_2 = new CO2_2;
//        private var cO2_3:CO2_3 = new CO2_3;
//        private var cO2_4:CO2_4 = new CO2_4;
//        private var cO2_5:CO2_5 = new CO2_5;
//        private var cO2_6:CO2_6 = new CO2_6;
//
//        private var cO2Array = [cO2_1,cO2_2,cO2_3,cO2_4,cO2_5,cO2_6];
//
//       private var cO2inLung1:CO2_1inLung = new CO2_1inLung;
//       private var cO2inLung2:CO2_2inLung = new CO2_2inLung;
//       private var cO2inLung3:CO2_3inLung = new CO2_3inLung;
//       private var cO2inLung4:CO2_4inLung = new CO2_4inLung;
//       private var cO2inLung5:CO2_5inLung = new CO2_5inLung;
//       private var cO2inLung6:CO2_6inLung = new CO2_6inLung;
//
//       private var cO2inLungArray = [cO2inLung1,cO2inLung2,cO2inLung3,cO2inLung4,cO2inLung5,cO2inLung6];
//
//
//       private var cO2LeavingLungs1:CO2_1LeavingLungs = new CO2_1LeavingLungs;
//       private var cO2LeavingLungs2:CO2_2LeavingLungs = new CO2_2LeavingLungs;
//       private var cO2LeavingLungs3:CO2_3LeavingLungs = new CO2_3LeavingLungs;
//       private var cO2LeavingLungs4:CO2_4LeavingLungs = new CO2_4LeavingLungs;
//       private var cO2LeavingLungs5:CO2_5LeavingLungs = new CO2_5LeavingLungs;
//       private var cO2LeavingLungs6:CO2_6LeavingLungs = new CO2_6LeavingLungs;
//
//        private var cO2LeavingLungArray = [cO2LeavingLungs1,cO2LeavingLungs2,cO2LeavingLungs3,cO2LeavingLungs4,cO2LeavingLungs5,cO2LeavingLungs6 ];
//
//
//        private var breathAni:BreathAni = new BreathAni;
//
//
//
//        private var  oxegenAniStopped:Boolean = true;
//        private var  co2InLungs:Boolean = false;
//        private var  co2EndOfLoop:Boolean = false;
//         private var  BreathInLungs:Boolean = false;


        private var theOxegenAmout:Number  = 5;
//        private var oxDisplayNumber:String= "100";
		public function View(model:Model, controller:Controller)
		{
			_model = model;
			_controller = controller;

            resp = new Resp(model,controller);
			init();
		}
		
		private function init():void{
			initModelEventListeners();
           // initAni();
            creation ();
		}

		private function initModelEventListeners():void{
			_model.addEventListener(Model.OXEGEN_AMOUNT, currOxegenAmoutHandler);
		}

        private function creation (){
            addChild(resp);


            lungBtn.x  =1053;
            lungBtn.y  = 504 ;
            addChild(lungBtn);


            var thumb1:Thumb = new Thumb();
            var track1:Track = new Track();
            lungInvis.x = 1052;
            lungInvis.y = 502;
            lungInvis.alpha = 0;
            addChild(lungInvis);

            lungBack.x = 946;
            lungBack.y = 410;
            lungBack.alpha = 0;


            slider1 = new Slider(thumb1, track1, 15, 145);
            slider1.x = 1255;
            slider1.y =580;
            slider1.alpha = 0;
            slider1.rotation = 180;

            oxText.x  = 1055;
            oxText.y = 513;
            addChild(oxText);
            oxText.theText = "100";

            oxText2.x  = 1055;
            oxText2.y = 513;
            oxText2.alpha = 0;
            addChild(oxText2);
            oxText2.theText = "100";

            oxText3.x  = 1060;
            oxText3.y = 480;
            oxText3.alpha = 0;
            oxText3.theText = "100";

//            co2Text.x  = 820;
//            co2Text.y = 100;
//            addChild(co2Text)
//            co2Text.theText = "100";
//            co2Text.visible = false;
//
//
//            co2Label.x  = co2Text.x;
//            co2Label.y = co2Text.y - 20;
//            addChild(co2Label)
//            co2Label.theText = "CO2";
//            co2Label.visible = false;

            slider1.addEventListener(Slider.SLIDER_CHANGE, slider1ChangeHandler);

            lungInvis.addEventListener(MouseEvent.CLICK,onLungInvis);
            lungInvis.addEventListener(MouseEvent.ROLL_OVER,overlungInvis);
            lungInvis.addEventListener(MouseEvent.ROLL_OUT,outlungInvis);


        }



        function onLungInvis(eve:Event){
        addChild(lungBack);
        addChild(slider1);
        addChild(oxText3);
        TweenLite.to(oxText3, 1, {alpha:1, ease:Circ.easeOut});
        TweenLite.to(lungBack, 1, {alpha:1, ease:Circ.easeOut});
        TweenLite.to(slider1, 1.2, {alpha:1, ease:Circ.easeOut});
        lungBack.addEventListener(MouseEvent.CLICK, onlungBack)
         }

         function onlungBack(eve:Event){
         removeChild(lungBack);
         removeChild(slider1);
         removeChild(oxText3);
         lungBack.removeEventListener(MouseEvent.CLICK, onlungBack)
         }

        function overlungInvis(eve:Event){

             oxText.alpha = 0;
            oxText2.alpha = 1;

           TweenLite.to(lungBtn.over, .5, {alpha:1, ease:Circ.easeOut});

        }
        function outlungInvis(eve:Event){
            oxText.alpha = 1;
            oxText2.alpha = 0;
           TweenLite.to(lungBtn.over, .5, {alpha:0, ease:Circ.easeOut});

        }

       private function currOxegenAmoutHandler(eve:Event):void{

         theOxegenAmout = _model.oxegenAmout;

       //    trace(theOxegenAmout);

            switch(theOxegenAmout){

              case 0:
               oxText.theText = oxText2.theText = oxText3.theText =co2Text.theText ="50";
             break;

             case 1:
               oxText.theText = oxText2.theText = oxText3.theText = co2Text.theText = "60";
             break;

             case 2:
              oxText.theText =  oxText2.theText = oxText3.theText = co2Text.theText =  "70";
            break;

            case 3:
              oxText.theText = oxText2.theText = oxText3.theText = co2Text.theText ="80";
            break;

            case 4:
              oxText.theText = oxText2.theText = oxText3.theText = co2Text.theText =  "90";
            break;

            case 5:
               oxText.theText = oxText2.theText = oxText3.theText = co2Text.theText = "100";
            break;

            default:
                oxText.theText = oxText2.theText = oxText3.theText = co2Text.theText ="100";
               }
            }




//        private function initAni():void{
//
//            oxegenAni.x = oxAniPosX;
//            oxegenAni.y =  oxAniPosY;
//
//            breathAni.x = oxAniPosX;
//            breathAni.y = oxAniPosY;
//
//            addChild(oxegenAni);
//            addChild(breathAni);
//
//            for(var i = 0; i<5; i++){
//             oxArray[i].x = oxAniPosX;
//             oxArray[i].y = oxAniPosY;
//             addChild(oxArray[i]);
//            }
//
//            for(var j = 0; j<6; j++){
//            cO2Array[j].x  = oxAniPosX;
//            cO2Array[j].y  = oxAniPosY;
//            cO2Array[j].addEventListener("end", co2end);
//            addChild(cO2Array[j]);
//
//            cO2inLungArray[j].x  = oxAniPosX;
//            cO2inLungArray[j].y  = oxAniPosY;
//            cO2inLungArray[j].visible = false;
//            cO2inLungArray[j].addEventListener("end", cO2_2inLungEnd);
//            addChild(cO2inLungArray[j]);
//
//
//            cO2LeavingLungArray[j].x = oxAniPosX;
//            cO2LeavingLungArray[j].y = oxAniPosY;
//            cO2LeavingLungArray[j].visible = false;
//            cO2LeavingLungArray[j].addEventListener("end", cO2_2LeavingEnd);
//            addChild(cO2LeavingLungArray[j]);
//            }
//
//             breathAni.addEventListener("airIn", ariIn);
//             breathAni.addEventListener("BreathIn",  BreathIn);
//             breathAni.addEventListener("BreathOut",  BreathOut);
//
//             oxegenAni.addEventListener("stopped", oxAbsorbStopped);
//             oxegenAni.addEventListener("playing", oxAbsorbPlaying);
//        }
//
//        function BreathIn(e:Event){
//               BreathInLungs = true;
//               }
//
//         function BreathOut(e:Event){
//                BreathInLungs = false;
//               }
//
//
//        function co2end(e:Event){
//            for(var j = 0; j<6; j++){
//            cO2Array[j].visible = false;
//            cO2inLungArray[j].visible = true;
//            cO2inLungArray[j].play();
//            }
//           }
//
//           function cO2_2inLungEnd(e:Event){
//             if(BreathInLungs == true){
//                 for(var j = 0; j<6; j++){
//                  cO2inLungArray[j].visible = false;
//                  cO2inLungArray[j].gotoAndStop("first");
//
//                  cO2LeavingLungArray[j].visible = true;
//                  cO2LeavingLungArray[j].play();
//                 }
//             }
//        }
//
//
//         function cO2_2LeavingEnd(e:Event){
//               for(var j = 0; j<6; j++){
//                  cO2inLungArray[j].visible = false;
//                  cO2LeavingLungArray[j].visible = false;
//                 }
//         }
//
//
//        function ariIn(e:Event){
//
//
//             switch(theOxegenAmout){
//
//              case 0:
//
//              break;
//
//              case 1:
//
//              break;
//
//              case 2:
//
//              break;
//
//              case 3:
//
//              break;
//
//              case 4:
//
//              break;
//
//              case 5:
//
//              break;
//
//
//              default:
//
//              }
//
//
//             //    trace(theOxegenAmout + "= theOxegenAmout");
//
//
//             if (oxegenAniStopped == true){
//                 oxegenAni.gotoAndPlay("one");
//                 for(var i = 0; i<5; i++){
//                 oxArray[i].gotoAndPlay("one");
//                 }
//              }
//        }
//
//        function oxAbsorbStopped(e:Event){
//             oxegenAniStopped = true;
//
//             for(var j = 0; j<6; j++){
//            cO2Array[j].gotoAndPlay("one");
//            cO2Array[j].visible = true;
//            }
//
//
//        }
//         function oxAbsorbPlaying(e:Event){
//             oxegenAniStopped = false;
//        }

        function slider1ChangeHandler(eve:Event){
                _controller.sliderAmout = slider1.svalue;
        }


	}



}