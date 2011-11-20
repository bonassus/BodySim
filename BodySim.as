
package {

	import flash.display.MovieClip;
	//import flash.display.Sprite;
	import mvc.Model;
	import mvc.View;
	import mvc.Controller;
	
	


	public class BodySim extends MovieClip{
		private var _model:Model;
		private var _view:View;
		private var _controller:Controller;
		
		public function BodySim()
		{
			init();
		}
		
	
		private function init():void{
	
			_model = new Model();

			_controller = new Controller(_model);
			
			_view = new View(_model, _controller);
			
			this.addChild(_view);
			

		}
	}
}
