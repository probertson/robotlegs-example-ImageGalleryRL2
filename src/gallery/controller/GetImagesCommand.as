package gallery.controller
{
    import gallery.controller.events.GetImagesEvent;
    import gallery.service.IImageService;

    import org.robotlegs.mvcs.Command

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