package  view{
	
import flash.display.MovieClip;
import com.greensock.*;
import com.greensock.easing.*;
import flash.display.*;
import flash.events.*;
import mvc.Model;
import mvc.Controller;
//import FoodBtn;
	
	public class Gis extends MovieClip{
         private var _model:Model;
       private var _controller:Controller;
       private var starchChain1:StarchChain = new StarchChain;
       private var starchChain2:StarchChain2 = new StarchChain2;
       private var starchChain3:StarchChain3 = new StarchChain3;

      private var protienChain1:ProtienChain1 = new ProtienChain1;
      private var protienChain2:ProtienChain2 = new ProtienChain2;

      private var starchChainArray = [ starchChain1,starchChain2,starchChain3];

         //private var starch2:Starch2 = new Starch2;
       //  private var starch3:Starch3 = new Starch3;
      // private var starchArray = [ starch1,starch2,starch3];
      // private var foodBtn:FoodBtn = new FoodBtn;
        public function Gis(model:Model, controller:Controller){
            _model = model;
           // _controller = controller;
            init();
		}

    private function init():void{
         addChild(protienChain1);
        protienChain1.alpha = 0;
        protienChain1.addEventListener("end", protienChainEnd1);

        addChild(protienChain2);
        protienChain2.alpha = 0;

             for(var i = 0; i<starchChainArray.length; i++){
                 addChild(starchChainArray[i]);
                 starchChainArray[i].alpha = 0;
             }



        _model.addEventListener(Model.FOOD, addFood)
		        }

           function addFood(e:Event){
              protienChain1.alpha = 1;
              protienChain1.gotoAndPlay("one");
              protienChain1.bg.visible = false;
              starchChain1.alpha = 1;
              starchChain1.gotoAndPlay("one");
              starchChain1.addEventListener("end", starchChainEnd1);
           }

        function starchChainEnd1(e:Event){


          starchChain2.alpha = 1;
          starchChain2.gotoAndPlay("one");

        }


         function protienChainEnd1(){
         protienChain1.alpha = 0;
        protienChain1.gotoAndStop("first");
             trace("ttottt");


        protienChain2.alpha = 1;
        protienChain2.gotoAndPlay("one");
        protienChain2.bg.visible = false;

         }


	}
	
}
