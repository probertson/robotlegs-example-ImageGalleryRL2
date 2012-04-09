package gallery.model
{
    import gallery.model.events.GalleryImagesUpdatedEvent;

    import mx.collections.IList;

    import org.robotlegs.mvcs.Actor;

    public class GalleryImageListModel extends Actor
    {
        private var _images:IList;

        public function get images():IList
        {
            return _images;
        }

        public function set images(value:IList):void
        {
            _images = value;

            dispatch(new GalleryImagesUpdatedEvent(value));
        }
    }
}