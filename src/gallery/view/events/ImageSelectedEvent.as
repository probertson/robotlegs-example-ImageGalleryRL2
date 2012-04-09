package gallery.view.events
{
    import flash.events.Event;

    import gallery.model.vo.GalleryImage;

    public class ImageSelectedEvent extends Event
    {
        public static const IMAGE_SELECTED:String = "imageSelected";

        private var _image:GalleryImage;

        public function get image():GalleryImage
        {
            return _image;
        }

        public function ImageSelectedEvent(image:GalleryImage)
        {
            super(IMAGE_SELECTED);

            _image = image;
        }

        override public function clone():Event
        {
            return new ImageSelectedEvent(image);
        }
    }
}