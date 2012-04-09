package gallery.model.events
{
    import flash.events.Event;

    public class CurrentSearchTermUpdatedEvent extends Event
    {
        public static const UPDATED:String = "CurrentSearchTermUpdatedEvent";

        public function CurrentSearchTermUpdatedEvent()
        {
            super(UPDATED);
        }

        override public function clone():Event
        {
            return new CurrentSearchTermUpdatedEvent()
        }
    }
}