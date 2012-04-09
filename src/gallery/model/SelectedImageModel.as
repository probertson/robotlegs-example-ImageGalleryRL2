package gallery.model
{
    import gallery.model.events.SelectedImageUpdatedEvent;
    import gallery.model.vo.GalleryImage;

    import org.robotlegs.mvcs.Actor;

    public class SelectedImageModel extends Actor
    {
        private var _selectedImage:GalleryImage;

        public function get selectedImage():GalleryImage
        {
            return _selectedImage;
        }

        public function set selectedImage(value:GalleryImage):void
        {
            _selectedImage = value;
            dispatch(new SelectedImageUpdatedEvent());
        }
    }
}