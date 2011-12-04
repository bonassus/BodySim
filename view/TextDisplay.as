

package view
{
    import com.greensock.loading.*;
    import com.greensock.events.*;
    import flash.display.MovieClip;
    import flash.text.Font;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.AntiAliasType
    import flash.text.TextFieldAutoSize;


	public class TextDisplay extends MovieClip{

   // public static const SLIDER_CHANGE:String = 'Slider Change';
     //   e.updateAfterEvent();
      //   dispatchEvent(new Event(SLIDER_CHANGE));

	private var textFormat:TextFormat = new TextFormat();
    private var theTextField:TextField = new TextField();
    private var _theText:String = "100";
    private var loader:SWFLoader;
    private var fontClass:Class;
    private var _theColor:String;
    private var _ifBold:Boolean;
    private var _textSize:uint;

		public function TextDisplay(theColor,bold,textSize){
            _ifBold = bold
            _theColor = theColor;
            _textSize = textSize;

            loader = new SWFLoader("view/font/fonts.swf", {onComplete:completeHandler});
		    loader.load();
		}

        function completeHandler(event:LoaderEvent):void {
		 fontClass = loader.getClass("TheHelvetica");
		Font.registerFont(fontClass);
                 setText(_theText);

        }

         private function setText(_theText){
             textFormat.font = "Helvetica";
			textFormat.size = _textSize;
			textFormat.bold = _ifBold;
            textFormat.color =_theColor;

			theTextField.text = _theText;
			theTextField.setTextFormat(textFormat);
			theTextField.selectable = false;
			theTextField.mouseEnabled = false;
             theTextField.antiAliasType = AntiAliasType.ADVANCED;
            theTextField.autoSize = TextFieldAutoSize.LEFT;
			addChild(theTextField);
      //  theTextField.text = _theText;
    }

        public function set theText(value:String):void {
            _theText = value;
           setText(_theText);
        }
    }
}





