
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

        private var oxText:TextDisplay = new TextDisplay("0xffffff",true,21);
        private var oxLabel:TextDisplay = new TextDisplay("0x333333",false,16);
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
            createTextField ();
		}



		private function initModelEventListeners():void{
			_model.addEventListener(Model.OXEGEN_AMOUNT, currOxegenAmoutHandler);
		}
			





        private function createTextField (){
            oxText.x  = 820;
            oxText.y = 100;
            addChild(oxText)
            oxText.theText = "100";

            oxLabel
            oxLabel.x  = oxText.x;
            oxLabel.y = oxText.y - 20;
            addChild(oxLabel)
            oxLabel.theText = "Oxegen";

        }


        private function currOxegenAmoutHandler(eve:Event):void{

             theOxegenAmout = _model.oxegenAmout;

          //  trace(theOxegenAmout +" from model");

            switch(theOxegenAmout){

                case 0:
               ox1.alpha = 0;
               ox2.alpha = 0;
               ox3.alpha = 0;
               ox4.alpha = 0;
               ox5.alpha = 0;
               oxText.theText =  "50";

                break;
                case 1:
               ox1.alpha = 0;
               ox2.alpha = 0;
               ox3.alpha = 0;
               ox4.alpha = 0;
               ox5.alpha = 1;
               oxText.theText = "60";
                break;
                case 2:
               ox1.alpha = 0;
               ox2.alpha = 0;
               ox3.alpha = 0;
               ox4.alpha = 1;
               ox5.alpha = 1;
              oxText.theText =  "70";
                break;
                case 3:
               ox1.alpha = 0;
               ox2.alpha = 0;
               ox3.alpha = 1;
               ox4.alpha = 1;
               ox5.alpha = 1;
               oxText.theText =  "80";
                break;
                case 4:
               ox1.alpha = 0;
               ox2.alpha = 1;
               ox3.alpha = 1;
               ox4.alpha = 1;
               ox5.alpha = 1;
              oxText.theText =  "90";
                break;
                case 5:
               ox1.alpha = 1;
               ox2.alpha = 1;
               ox3.alpha = 1;
               ox4.alpha = 1;
               ox5.alpha = 1;
               oxText.theText =  "100";
                break;


                default:
                oxText.theText =  "100";
                ox1.alpha = 1;
                ox2.alpha = 1;
                ox3.alpha = 1;
                ox4.alpha = 1;
                ox5.alpha = 1;
                }
            }




        private function initAni():void{

            oxegenAni.x = 645
            oxegenAni.y =  379

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

            addChild(oxegenAni);
            addChild(ox1);
            addChild(ox2);
            addChild(ox3);
            addChild(ox4);
            addChild(ox5);

            addChild(cO2_1);

//


        }

		private function initSliders():void{

             var thumb1:Thumb = new Thumb();
             var track1:Track = new Track();


			slider1 = new Slider(thumb1, track1, 15, 145);
            slider1.x = 1255;
            slider1.y =580;
            slider1.alpha = 0;
            slider1.rotation = 180;
			addChild(slider1);
            slider1.addEventListener(Slider.SLIDER_CHANGE, slider1ChangeHandler);

            lungInvis.x = 1052;
            lungInvis.y = 502;
            lungInvis.alpha = .5;
            addChild(lungInvis);

             lungInvis.addEventListener(MouseEvent.CLICK,lungInvisHandler);

           // trace(slider1.svalue);
          //  sliderPercent

		}


        function slider1ChangeHandler(eve:Event){
                _controller.sliderAmout = slider1.svalue;
        }


          function lungInvisHandler(eve:Event){
              lungBack.x = 946;
              lungBack.y = 410;
              lungBack.alpha = 0;
              addChild(lungBack);
              TweenLite.to(lungBack, 1, {alpha:1, ease:Circ.easeOut});
              addChild(slider1);
              TweenLite.to(slider1, 1.2, {alpha:1, ease:Circ.easeOut});



        }




	}



}