package gallery.model.events
{
    import flash.events.Event;

    public class SelectedImageUpdatedEvent extends Event
    {
        public static const UPDATED:String = "SelectedImageUpdatedEvent";

        public function SelectedImageUpdatedEvent()
        {
            super(UPDATED);
        }

        override public function clone():Event
        {
            return new SelectedImageUpdatedEvent()
        }
    }
}