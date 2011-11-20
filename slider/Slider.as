

package slider
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Slider extends MovieClip{
	
	private var _thumb:MovieClip;
	private var _track:MovieClip;
	private	var currentX:Number;
	private	var lastX:Number;
	private	var vx:Number = 0;
	private	var isDragging:Boolean = false;
	private	var offset:Number;
    private var  _svalue:Number = 0;
	private var _boundsLeft:Number;
	private var _boundsRight:Number;

		public function Slider(thumb,track,left,right){
			super();
			_thumb = thumb;
			_track = track;
            _boundsLeft = left;
            _boundsRight = right;
			currentX = _thumb.x;
			lastX = _thumb.x;
			init();
		}
		
		private function init():void{
          addChild(_track);
          addChild(_thumb);
		  _thumb.buttonMode = true;
		  addEventListener(Event.ENTER_FRAME, loop);
		  _thumb.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
		  addEventListener(MouseEvent.MOUSE_UP, onUp);

		function onDown(e:MouseEvent):void
		{
			isDragging = true;
			offset = _thumb.mouseX;
			addEventListener(MouseEvent.MOUSE_MOVE, onMove);
		}


		function onUp(e:MouseEvent):void
		{
			isDragging = false;
			removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
		}

		function onMove(e:MouseEvent):void
		{
			_thumb.x = mouseX - offset;
			if(_thumb.x <= _boundsLeft)
				_thumb.x = _boundsLeft;
			else if(_thumb.x >= _boundsRight)
				_thumb.x = _boundsRight;
			e.updateAfterEvent();
		}

		function loop(e:Event):void
		{
			if(isDragging)
			{
				lastX = currentX;
				currentX = mouseX;
				vx = currentX - lastX;
			}	
			else
			{
				_thumb.x += vx;
			}
			
			if(_thumb.x <= _boundsLeft)
			{
				_thumb.x  = _boundsLeft;
				vx *= -1;
			}
			else if(_thumb.x >= _boundsRight)
			{
				_thumb.x = _boundsRight;
				vx *= -1;
			}
			
			vx *= 0.95;
			if(Math.abs(vx) < 0.5) vx = 0;

             //trace(_boundsLeft);

			_svalue = Math.round((_thumb.x-_boundsLeft)/(_boundsRight-_boundsLeft)*100);

          //  trace(_svalue);
		}


		}

        public function get svalue():Number {
            return _svalue;
        }
    }
}