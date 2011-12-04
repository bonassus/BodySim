package  view{
import flash.display.MovieClip;
import com.greensock.*;
import com.greensock.easing.*;
import flash.display.*;
import flash.events.*;
import mvc.Model;
import mvc.Controller;
	
	public class LungBtn extends MovieClip{
       private var _model:Model;
       private var _controller:Controller;
        private var slider1:Slider;
        private var lungInvis:Invis = new Invis();
        private var lungBack:LungSliderBack = new LungSliderBack;
        private var lungGraph:LungBtnGraph = new LungBtnGraph;
        private var oxText:TextDisplay = new TextDisplay("0x000000",true,20);
        private var oxText2:TextDisplay = new TextDisplay("0xffffff",true,20);
        private var oxText3:TextDisplay = new TextDisplay("0xffffff",true,52);
        private var co2Text:TextDisplay = new TextDisplay("0x909090",true,21);
        private var oxLabel:TextDisplay = new TextDisplay("0x333333",true,16);
        private var co2Label:TextDisplay = new TextDisplay("0x333333",true,16);
        private var theOxegenAmout:Number  = 5;

		public function LungBtn(model:Model, controller:Controller) {

		    _model = model;
            _controller = controller;
            init();
		}

    private function init():void{
		initModelEventListeners();
        creation ();
  //      initAni();
		}

    private function initModelEventListeners():void{
			_model.addEventListener(Model.OXEGEN_AMOUNT, currOxegenAmoutHandler);
		}


             private function creation (){
            lungGraph.x  =1053;
            lungGraph.y  = 504 ;
            addChild(lungGraph);


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

           TweenLite.to(lungGraph.over, .5, {alpha:1, ease:Circ.easeOut});

        }
        function outlungInvis(eve:Event){
            oxText.alpha = 1;
            oxText2.alpha = 0;
           TweenLite.to(lungGraph.over, .5, {alpha:0, ease:Circ.easeOut});

        }

       private function currOxegenAmoutHandler(eve:Event):void{

         theOxegenAmout = _model.oxegenAmout;

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


        function slider1ChangeHandler(eve:Event){
                _controller.sliderAmout = slider1.svalue;
        }
	}
	
}
