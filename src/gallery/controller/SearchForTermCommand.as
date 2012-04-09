package gallery.controller
{
    import gallery.model.CurrentSearchTermModel;
    import gallery.service.IImageService;
    import gallery.view.events.SearchForTermEvent;

    import org.robotlegs.mvcs.Command

    public class SearchForTermCommand extends Command
    {
        [Inject]
        public var event:SearchForTermEvent;

        [Inject]
        public var service:IImageService;

        [Inject]
        public var model:CurrentSearchTermModel;

        override public function execute():void
        {
            var searchTerm:String = event.term;

            service.search(searchTerm);

            model.term = searchTerm;
        }
    }
}