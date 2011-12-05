﻿package  view{import flash.display.MovieClip;import com.greensock.*;import com.greensock.easing.*;import flash.display.*;import flash.events.*;import mvc.Model;import mvc.Controller;		public class Co2 extends MovieClip {       private var _model:Model;       private var _controller:Controller;       private var _co2Amount:Number = 5;       private var co2InBloodAmount:Number = 6;       private var co2PosX:Number;       private var co2PosY:Number;       private var cO2_1:CO2_1 = new CO2_1;       private var cO2_2:CO2_2 = new CO2_2;       private var cO2_3:CO2_3 = new CO2_3;       private var cO2_4:CO2_4 = new CO2_4;       private var cO2_5:CO2_5 = new CO2_5;       private var cO2_6:CO2_6 = new CO2_6;       private var cO2Array = [cO2_1,cO2_2,cO2_3,cO2_4,cO2_5,cO2_6];       private var cO2inLung1:CO2_1inLung = new CO2_1inLung;       private var cO2inLung2:CO2_2inLung = new CO2_2inLung;       private var cO2inLung3:CO2_3inLung = new CO2_3inLung;       private var cO2inLung4:CO2_4inLung = new CO2_4inLung;       private var cO2inLung5:CO2_5inLung = new CO2_5inLung;       private var cO2inLung6:CO2_6inLung = new CO2_6inLung;       private var cO2inLungArray = [cO2inLung1,cO2inLung2,cO2inLung3,cO2inLung4,cO2inLung5,cO2inLung6];       private var cO2LeavingLungs1:CO2_1LeavingLungs = new CO2_1LeavingLungs;       private var cO2LeavingLungs2:CO2_2LeavingLungs = new CO2_2LeavingLungs;       private var cO2LeavingLungs3:CO2_3LeavingLungs = new CO2_3LeavingLungs;       private var cO2LeavingLungs4:CO2_4LeavingLungs = new CO2_4LeavingLungs;       private var cO2LeavingLungs5:CO2_5LeavingLungs = new CO2_5LeavingLungs;       private var cO2LeavingLungs6:CO2_6LeavingLungs = new CO2_6LeavingLungs;       private var cO2LeavingLungArray = [cO2LeavingLungs1,cO2LeavingLungs2,cO2LeavingLungs3,cO2LeavingLungs4,cO2LeavingLungs5,cO2LeavingLungs6 ];		public function Co2(model:Model, controller:Controller){            _model = model;            _controller = controller;            co2PosX = _model.ResPosX;            co2PosY = _model.ResPosY;            init();            creation();		}    private function init():void{         _model.addEventListener(Model.START_CO2, startCo2);        _model.addEventListener(Model.OXEGEN_IN_BLOOD, oxegenInBlood);	}        private function creation():void{         for(var i = 0; i<6; i++){            cO2Array[i].x  = co2PosX;            cO2Array[i].y  = co2PosY;            cO2Array[i].visible = false;            cO2Array[i].addEventListener("end", co2end);            addChild(cO2Array[i]);            cO2inLungArray[i].x  = co2PosX;            cO2inLungArray[i].y  = co2PosY;            cO2inLungArray[i].visible = false;            cO2inLungArray[i].addEventListener("end", cO2_2inLungEnd);            addChild(cO2inLungArray[i]);            cO2LeavingLungArray[i].x = co2PosX;            cO2LeavingLungArray[i].y = co2PosY;            cO2LeavingLungArray[i].visible = false;            cO2LeavingLungArray[i].addEventListener("end", cO2_2LeavingEnd);            addChild(cO2LeavingLungArray[i]);            }          cO2Array[0].addEventListener("end", co2leavingBlood);        }        function oxegenInBlood(e:Event){             _co2Amount = _model.oxegenAmout;            // trace(_co2Amount);        }         function startCo2(e:Event){            _controller.co2InBlood(_co2Amount);            for(var i = 0; i<6; i++){            cO2Array[i].gotoAndPlay("one");            cO2Array[i].visible = true;             switch(_co2Amount){              case 0:                 co2InBloodAmount = 3;                for(var j = 0; j<3; j++){                cO2Array[j].alpha = 0;                cO2inLungArray[j].alpha = 0;                cO2LeavingLungArray[j].alpha = 0;                }                for(var h = 3; h<6; h++){                cO2Array[h].alpha = 1;                cO2inLungArray[h].alpha = 1;                cO2LeavingLungArray[h].alpha = 1;                }             break;             case 1:                  co2InBloodAmount = 3;                for(var k = 0; k<3; k++){                cO2Array[k].alpha = 0;                cO2inLungArray[k].alpha = 0;                cO2LeavingLungArray[k].alpha = 0;                }                for(var l = 3; l<6; l++){                cO2Array[l].alpha = 1;                cO2inLungArray[l].alpha = 1;                cO2LeavingLungArray[l].alpha = 1;                }             break;             case 2:                    co2InBloodAmount = 2;                for(var m = 0; m<2; m++){                cO2Array[m].alpha = 0;                cO2inLungArray[m].alpha = 0;                cO2LeavingLungArray[m].alpha = 0;                }                for(var n = 2; n<6; n++){                cO2Array[n].alpha = 1;                cO2inLungArray[n].alpha = 1;                cO2LeavingLungArray[n].alpha = 1;                }            break;            case 3:                    co2InBloodAmount = 2;                for(var o = 0; o<2; o++){                cO2Array[o].alpha = 0;                cO2inLungArray[o].alpha = 0;                cO2LeavingLungArray[o].alpha = 0;                }                for(var p = 2; p<6; p++){                cO2Array[p].alpha = 1;                cO2inLungArray[p].alpha = 1;                cO2LeavingLungArray[p].alpha = 1;                }            break;            case 4:                    co2InBloodAmount = 1;                for(var q = 0; q<1; q++){                cO2Array[q].alpha = 0;                cO2inLungArray[q].alpha = 0;                cO2LeavingLungArray[q].alpha = 0;                }                for(var r = 1; r<6; r++){                cO2Array[r].alpha = 1;                cO2inLungArray[r].alpha = 1;                cO2LeavingLungArray[r].alpha = 1;                }            break;            case 5:                co2InBloodAmount = 0;                for(var s = 0; s<6; s++){                cO2Array[s].alpha = 1;                cO2inLungArray[s].alpha = 1;                cO2LeavingLungArray[s].alpha = 1;                }            break;            default:               co2InBloodAmount = 0;               for(var t = 0; t<6; t++){               cO2Array[t].alpha = 1;               cO2inLungArray[t].alpha = 1;               cO2LeavingLungArray[t].alpha = 1;             }           }             // _controller.setTotalCo2(co2InBlood);         }        }          function co2leavingBlood(e:Event){            _controller.co2OutBlood(_co2Amount)          }         function co2end(e:Event){            for(var j = 0; j<6; j++){            cO2Array[j].visible = false;            cO2inLungArray[j].visible = true;            cO2inLungArray[j].play();            }           }         function cO2_2inLungEnd(e:Event){            if(_model.breathInLungs == true){               for(var j = 0; j<6; j++){               cO2inLungArray[j].visible = false;               cO2LeavingLungArray[j].visible = true;               cO2inLungArray[j].gotoAndStop("first");               cO2LeavingLungArray[j].play();               }            }        }         function cO2_2LeavingEnd(e:Event){            for(var j = 0; j<6; j++){               cO2inLungArray[j].visible = false;               cO2LeavingLungArray[j].visible = false;            }         }        function ariIn(e:Event){        }	}	}