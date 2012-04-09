package gallery.view.events
{
    import flash.events.Event;

    public class SearchForTermEvent extends Event
    {
        public static const SEARCH:String = "SearchForTermEvent";

        private var _term:String;

        public function get term():String
        {
            return _term;
        }

        public function SearchForTermEvent(term:String)
        {
            super(SEARCH);

            _term = term;
        }

        override public function clone():Event
        {
            return new SearchForTermEvent(term);
        }
    }
}