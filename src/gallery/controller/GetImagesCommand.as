package gallery.controller
{
    import gallery.service.IImageService;
    
    import robotlegs.bender.bundles.mvcs.Command;

    public class GetImagesCommand extends Command
    {
        [Inject]
        public var service:IImageService;

        override public function execute():void
        {
            service.getImages();
        }
    }
}