package gallery.controller.events
{
    import flash.events.Event;

    public class GetImagesEvent extends Event
    {
        public static const GET_IMAGES:String = "GetImagesEvent";

        public function GetImagesEvent()
        {
            super(GET_IMAGES);
        }

        override public function clone():Event
        {
            return new GetImagesEvent()
        }
    }
}