package gallery.controller
{
    import gallery.service.IImageService;

    public class GetImagesCommand
    {
        [Inject]
        public var service:IImageService;

        public function execute():void
        {
            service.getImages();
        }
    }
}