
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
        private var slider1:Slider;
        private var lungInvis:Invis = new Invis();
        private var lungBack:LungSliderBack = new LungSliderBack;
        private var oxegenAni:OxegenAni = new OxegenAni;

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

       private var cO2_1inLung:CO2_1inLung = new CO2_1inLung;
       private var cO2inLung2:CO2_2inLung = new CO2_2inLung;
       private var cO2_3inLung:CO2_3inLung = new CO2_3inLung;
       private var cO2_4inLung:CO2_4inLung = new CO2_4inLung;
       private var cO2_5inLung:CO2_5inLung = new CO2_5inLung;
       private var cO2_6inLung:CO2_6inLung = new CO2_6inLung;


        private var cO2_2LeavingLungs2:CO2_2LeavingLungs = new CO2_2LeavingLungs;


        private var breathAni:BreathAni = new BreathAni;
        private var lungBtn:LungBtn = new LungBtn;
        private var oxText:TextDisplay = new TextDisplay("0x000000",true,20);
        private var oxText2:TextDisplay = new TextDisplay("0xffffff",true,20);
        private var oxText3:TextDisplay = new TextDisplay("0xffffff",true,52);

        private var co2Text:TextDisplay = new TextDisplay("0x909090",true,21);
        private var oxLabel:TextDisplay = new TextDisplay("0x333333",true,16);
        private var co2Label:TextDisplay = new TextDisplay("0x333333",true,16);

        private var  oxegenAniStopped:Boolean = true;
        private var  co2InLungs:Boolean = false;
        private var  co2EndOfLoop:Boolean = false;
         private var  BreathInLungs:Boolean = false;

       // private var OxLabel:TextField = new TextField();
        private var theOxegenAmout:Number ;
        private var oxDisplayNumber:String= "100";
		public function View(model:Model, controller:Controller)
		{
			_model = model;
			_controller = controller;
			init();
		}
		
		private function init():void{
			initModelEventListeners();
            initAni();
			initSliders();
            creation ();
		}



		private function initModelEventListeners():void{
			_model.addEventListener(Model.OXEGEN_AMOUNT, currOxegenAmoutHandler);
		}
			





        private function creation (){



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

            co2Text.x  = 820;
            co2Text.y = 100;
            addChild(co2Text)
            co2Text.theText = "100";




//            oxLabel.x  = oxText.x;
//            oxLabel.y = oxText.y - 20;
//            addChild(oxLabel)
//            oxLabel.theText = "Oxegen";


            co2Label.x  = co2Text.x;
            co2Label.y = co2Text.y - 20;
            addChild(co2Label)
            co2Label.theText = "CO2";

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
         //TweenLite.to(slider1, 1, {alpha:0, ease:Circ.easeOut});
         //TweenLite.to(lungBack, 1, {alpha:0, ease:Circ.easeOut});
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

          //  trace(theOxegenAmout +" from model");

            switch(theOxegenAmout){

              case 0:
               oxText.theText =  "50";
               oxText2.theText =  "50";
               oxText3.theText =  "50";
               co2Text.theText =  "50";
               ox1.alpha = 0;
               ox2.alpha = 0;
               ox3.alpha = 0;
               ox4.alpha = 0;
               ox5.alpha = 0;

              cO2_1.alpha = 0;
              cO2_2.alpha = 0;
              cO2_3.alpha = 0;
              cO2_4.alpha = 1;
              cO2_5.alpha = 1;
              cO2_6.alpha = 1;
             break;

             case 1:
               oxText.theText = "60";
               oxText2.theText =  "60";
               oxText3.theText =  "60";
               co2Text.theText = "60";
               ox1.alpha = 0;
               ox2.alpha = 0;
               ox3.alpha = 0;
               ox4.alpha = 0;
               ox5.alpha = 1;


               cO2_1.alpha = 0;
              cO2_2.alpha = 0;
              cO2_3.alpha = 0;
              cO2_4.alpha = 1;
              cO2_5.alpha = 1;
              cO2_6.alpha = 1;
             break;

             case 2:
              oxText.theText =  "70";
              oxText2.theText =  "70";
              oxText3.theText =  "70";
              co2Text.theText = "70";
              ox1.alpha = 0;
              ox2.alpha = 0;
              ox3.alpha = 0;
              ox4.alpha = 1;
              ox5.alpha = 1;

              cO2_1.alpha = 0;
              cO2_2.alpha = 0;
              cO2_3.alpha = 1;
              cO2_4.alpha = 1;
              cO2_5.alpha = 1;
              cO2_6.alpha = 1;

            break;

            case 3:
              oxText.theText =  "80";
              oxText2.theText =  "80";
              oxText3.theText =  "80";
              co2Text.theText = "80";
              ox1.alpha = 0;
              ox2.alpha = 0;
              ox3.alpha = 1;
              ox4.alpha = 1;
              ox5.alpha = 1;

              cO2_1.alpha = 0;
              cO2_2.alpha = 0;
              cO2_3.alpha = 1;
              cO2_4.alpha = 1;
              cO2_5.alpha = 1;
              cO2_6.alpha = 1;

            break;

            case 4:
              oxText.theText =  "90";
              oxText2.theText =  "90";
              oxText3.theText =  "90";
              co2Text.theText = "90";
              ox1.alpha = 0;
              ox2.alpha = 1;
              ox3.alpha = 1;
              ox4.alpha = 1;
              ox5.alpha = 1;

              cO2_1.alpha = 0;
              cO2_2.alpha = 1;
              cO2_3.alpha = 1;
              cO2_4.alpha = 1;
              cO2_5.alpha = 1;
              cO2_6.alpha = 1;
                break;

            case 5:
               oxText.theText =  "100";
               oxText2.theText =  "100";
               oxText3.theText =  "100";
               co2Text.theText = "100";
               ox1.alpha = 1;
               ox2.alpha = 1;
               ox3.alpha = 1;
               ox4.alpha = 1;
               ox5.alpha = 1;


              cO2_1.alpha = 1;
              cO2_2.alpha = 1;
              cO2_3.alpha = 1;
              cO2_4.alpha = 1;
              cO2_5.alpha = 1;
              cO2_6.alpha = 1;
            break;


            default:
                oxText.theText =  "100";
                oxText2.theText =  "100";
                oxText3.theText =  "100";
                co2Text.theText = "100";
                ox1.alpha = 1;
                ox2.alpha = 1;
                ox3.alpha = 1;
                ox4.alpha = 1;
                ox5.alpha = 1;

               cO2_1.alpha = 1;
               cO2_2.alpha = 1;
               cO2_3.alpha = 1;
               cO2_4.alpha = 1;
               cO2_5.alpha = 1;
               cO2_6.alpha = 1;
                }
            }




        private function initAni():void{

            oxegenAni.x = 645
            oxegenAni.y =  379

            breathAni.x = oxegenAni.x;
            breathAni.y = oxegenAni.y;

            for(var i = 0; i<5; i++){
             oxArray[i].x = oxegenAni.x
             oxArray[i].y = oxegenAni.y;
            }

             for(var i = 0; i<6; i++){
            cO2Array[i].x  = oxegenAni.x;
            cO2Array[i].y  = oxegenAni.y;
            }

            cO2inLung2.x = cO2_2.x;
            cO2_1inLung.y = cO2_1.y;
            cO2inLung2.x = cO2_2.x;
            cO2_1inLung.y = cO2_1.y;

            cO2_2LeavingLungs2.x = cO2_2.x;
            cO2_2LeavingLungs2.y = cO2_2.y;


            addChild(oxegenAni);
            addChild(breathAni);

            addChild(ox1);
            addChild(ox2);
            addChild(ox3);
            addChild(ox4);
            addChild(ox5);

           // addChild(cO2_1);
          addChild(cO2_2);
//           addChild(cO2_3);
//           addChild(cO2_4);
//           addChild(cO2_5);
//           addChild(cO2_6);
            cO2inLung2.visible = false;
           addChild(cO2inLung2);

            cO2_2LeavingLungs2.visible = false;
            addChild(cO2_2LeavingLungs2);


     breathAni.addEventListener("airIn", ariIn);
     breathAni.addEventListener("BreathIn",  BreathIn);
     breathAni.addEventListener("BreathOut",  BreathOut);

     oxegenAni.addEventListener("stopped", oxAbsorbStopped);
     oxegenAni.addEventListener("playing", oxAbsorbPlaying);

          //  cO2_2.addEventListener("co2InLungs", co2InLungsTrue);
           // cO2_2.addEventListener("co2OutOfLungs", co2InLungsFalse);
            cO2_2.addEventListener("end", co2end);
            cO2inLung2.addEventListener("end", cO2_2inLungEnd);
            cO2_2LeavingLungs2.addEventListener("end", cO2_2LeavingEnd);



        }

        function BreathIn(e:Event){
            trace(" BreathInLungs = true;")
               BreathInLungs = true;
               }

         function BreathOut(e:Event){
              trace(" BreathInLungs = false;")
                BreathInLungs = false;
               }


        function co2end(e:Event){
            co2InLungs = true ;


            cO2_2.visible = false;

            cO2inLung2.visible = true;
            cO2inLung2.play();


        }





           function cO2_2inLungEnd(e:Event){

             trace(BreathInLungs);
             if(BreathInLungs == true){
                 trace("yep");
                 cO2inLung2.visible = false;
                 cO2inLung2.gotoAndStop("first");
                 cO2_2LeavingLungs2.visible = true;
                cO2_2LeavingLungs2.play();

             }
        }


         function cO2_2LeavingEnd(e:Event){
                cO2_2LeavingLungs2.visible = false;
         }



        function ariIn(e:Event){

            trace("ariIn");

             if (oxegenAniStopped == true){

               oxegenAni.gotoAndPlay("one");
               ox1.gotoAndPlay("one");
               ox2.gotoAndPlay("one");
               ox3.gotoAndPlay("one");
               ox4.gotoAndPlay("one");
               ox5.gotoAndPlay("one");
             }

            if(co2InLungs == true){



              //cO2_1.gotoAndPlay("resume");
            }


        }

        function oxAbsorbStopped(e:Event){
             oxegenAniStopped = true;
//            if(co2InLungs == false){
//                cO2_2.gotoAndPlay("one");
//                cO2_2.visible = true;
//            }

             cO2_2.gotoAndPlay("one");
            cO2_2.visible = true;
//             cO2_3.gotoAndPlay("one");
//             cO2_4.gotoAndPlay("one");
//             cO2_5.gotoAndPlay("one");
//             cO2_6.gotoAndPlay("one");


        }
         function oxAbsorbPlaying(e:Event){
             oxegenAniStopped = false;
        }


//         function co2InLungsTrue(e:Event){
//         co2InLungs = true ;
//         trace("in");
//        }
//         function co2InLungsFalse(e:Event){
//         co2InLungs = false ;
//
//         trace("out");
//        }

		private function initSliders():void{



           // trace(slider1.svalue);
          //  sliderPercent

		}


        function slider1ChangeHandler(eve:Event){
                _controller.sliderAmout = slider1.svalue;
        }






	}



}