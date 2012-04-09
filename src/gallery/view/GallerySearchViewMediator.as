package gallery.view
{
    import gallery.view.events.SearchForTermEvent;

    import org.robotlegs.mvcs.Mediator;

    public class GallerySearchViewMediator extends Mediator
    {
        [Inject]
        public var view:GallerySearchView;

        override public function onRegister():void
        {
            addViewListener(SearchForTermEvent.SEARCH, dispatch);
        }
    }
}