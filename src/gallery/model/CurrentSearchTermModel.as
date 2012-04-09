package gallery.model
{
    import gallery.model.events.CurrentSearchTermUpdatedEvent;

    import org.robotlegs.mvcs.Actor;

    public class CurrentSearchTermModel extends Actor
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