package view {

import flash.display.MovieClip;
import com.greensock.*;
import com.greensock.easing.*;
import flash.display.*;
import flash.events.*;
import mvc.Model;
import mvc.Controller;

public class Digestive extends MovieClip{
    private var _model:Model;
    private var _controller:Controller;
    private var foodBtn:FoodBtn;
    private var _posX:Number;
    private var _posY:Number;
    private var gis1:Gis;
    private var gis2:Gis;
    private var gis3:Gis;
    private var gis4:Gis;
    private var gis5:Gis;
    private var gis6:Gis;
    private var gis7:Gis;
    private var gis8:Gis;
    private var gis9:Gis;
    private var gis10:Gis;
    private var gisArray = [gis1,gis2,gis3,gis4,gis5,gis6,gis7,gis8,gis9,gis10];
    private var counter:Number = 0;
    public function Digestive(model:Model, controller:Controller){
            _model = model;
            _controller = controller;
            foodBtn = new FoodBtn(model,controller);

        for(var i=0;i<10;i++){

          gisArray[i] = new Gis(model,controller);
            addChild(gisArray[i]);
        }
            _posX = _model.PosX ;
            _posY = _model.PosY ;
            init();
    }

    private function init():void{



        foodBtn.x = _posX - 1780;
        foodBtn.y = _posY -30;
        addChild(foodBtn);
   	   initModelEventListeners();
		}

    private function initModelEventListeners():void{
       _model.addEventListener(Model.FOOD, addFood)
    }

    function addFood(e:Event){


           counter ++;
          trace(counter);
        switch(counter){
           case 1:
              gisArray[1].addFood();
            break;
            case 2:
              gisArray[2].addFood();
            break;
            case 3:
              gisArray[3].addFood();
            break;
            case 4:
              gisArray[4].addFood();
            break;
            case 5:
              gisArray[5].addFood();
            break;
            case 6:
              gisArray[6].addFood();
            break;
            case 7:
              gisArray[7].addFood();
            break;
            case 8:
              gisArray[8].addFood();
            break;
            case 9:
              gisArray[9].addFood();
            break;
            case 10:
              counter = 0;

            case 11:

            break;
        }

        }
}
}
