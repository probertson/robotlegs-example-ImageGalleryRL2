package gallery.controller
{
    import gallery.model.CurrentSearchTermModel;
    import gallery.service.IImageService;
    import gallery.view.events.SearchForTermEvent;

    public class SearchForTermCommand
    {
        [Inject]
        public var event:SearchForTermEvent;

        [Inject]
        public var service:IImageService;

        [Inject]
        public var model:CurrentSearchTermModel;

        public function execute():void
        {
            var searchTerm:String = event.term;

            service.search(searchTerm);

            model.term = searchTerm;
        }
    }
}