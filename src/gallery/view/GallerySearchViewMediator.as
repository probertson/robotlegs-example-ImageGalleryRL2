package gallery.view
{
    import gallery.view.events.SearchForTermEvent;
    
    import robotlegs.bender.bundles.mvcs.Mediator;

    public class GallerySearchViewMediator extends Mediator
    {
        [Inject]
        public var view:GallerySearchView;

        override public function initialize():void
        {
            addViewListener(SearchForTermEvent.SEARCH, dispatch, SearchForTermEvent);
        }
    }
}