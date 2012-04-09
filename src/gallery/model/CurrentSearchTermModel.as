package gallery.model
{
	import gallery.base.BaseActor;
	import gallery.model.events.CurrentSearchTermUpdatedEvent;
	
	public class CurrentSearchTermModel extends BaseActor
	{
		private var _term:String;
		
		public function get term():String
		{
			return _term;
		}
		
		public function set term(value:String):void
		{
			_term = value;
			
			dispatch(new CurrentSearchTermUpdatedEvent());
		}
	}
}