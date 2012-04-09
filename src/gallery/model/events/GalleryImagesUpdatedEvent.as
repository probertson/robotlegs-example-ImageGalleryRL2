package gallery.model.events
{
    import flash.events.Event;

    import mx.collections.IList;

    public class GalleryImagesUpdatedEvent extends Event
    {
        public static const UPDATED:String = "GalleryImagesUpdatedEvent";

        private var _images:IList;

        public function get images():IList
        {
            return _images;
        }

        public function GalleryImagesUpdatedEvent(images:IList)
        {
            super(UPDATED);

            _images = images;
        }

        override public function clone():Event
        {
            return new GalleryImagesUpdatedEvent(images)
        }
    }
}