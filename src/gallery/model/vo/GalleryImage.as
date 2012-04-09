package gallery.model.vo
{
    [Bindable]
    public class GalleryImage
    {
        public var fullSizeURL:String;
        public var thumbnailURL:String;
        public var name:String;

        public function toString():String
        {
            return fullSizeURL;
        }
    }
}