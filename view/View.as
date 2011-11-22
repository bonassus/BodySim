
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
        private var cO2_1:CO2_1 = new CO2_1;
        private var cO2_2:CO2_2 = new CO2_2;
        private var cO2_3:CO2_3 = new CO2_3;
        private var cO2_4:CO2_4 = new CO2_4;
        private var cO2_5:CO2_5 = new CO2_5;
        private var cO2_6:CO2_6 = new CO2_6;
        private var breathAni:BreathAni = new BreathAni;
        private var lungBtn:LungBtn = new LungBtn;
        private var oxText:TextDisplay = new TextDisplay("0x000000",true,20);
        private var oxText2:TextDisplay = new TextDisplay("0xffffff",true,20);
        private var oxText3:TextDisplay = new TextDisplay("0xffffff",true,52);

        private var co2Text:TextDisplay = new TextDisplay("0x909090",true,21);
        private var oxLabel:TextDisplay = new TextDisplay("0x333333",true,16);
        private var co2Label:TextDisplay = new TextDisplay("0x333333",true,16);
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

            ox1.x = oxegenAni.x;
            ox2.x = oxegenAni.x;
            ox3.x = oxegenAni.x;
            ox4.x = oxegenAni.x;
            ox5.x = oxegenAni.x;

            ox1.y = oxegenAni.y;
            ox2.y = oxegenAni.y;
            ox3.y = oxegenAni.y;

            ox4.y = oxegenAni.y;
            ox5.y = oxegenAni.y;

            cO2_1.x  = oxegenAni.x;
            cO2_1.y  = oxegenAni.y;
            cO2_2.x  = oxegenAni.x;
            cO2_2.y  = oxegenAni.y;
            cO2_3.x  = oxegenAni.x;
            cO2_3.y  = oxegenAni.y;
            cO2_4.x  = oxegenAni.x;
            cO2_4.y  = oxegenAni.y;
            cO2_5.x  = oxegenAni.x;
            cO2_5.y  = oxegenAni.y;
            cO2_6.x  = oxegenAni.x;
            cO2_6.y  = oxegenAni.y;

            addChild(oxegenAni);
            addChild(breathAni);

            addChild(ox1);
            addChild(ox2);
            addChild(ox3);
            addChild(ox4);
            addChild(ox5);

            addChild(cO2_1);
            addChild(cO2_2);
            addChild(cO2_3);
            addChild(cO2_4);
            addChild(cO2_5);
            addChild(cO2_6);

//


        }

		private function initSliders():void{



           // trace(slider1.svalue);
          //  sliderPercent

		}


        function slider1ChangeHandler(eve:Event){
                _controller.sliderAmout = slider1.svalue;
        }






	}



}