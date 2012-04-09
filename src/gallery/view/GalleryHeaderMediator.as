package gallery.view
{
    import flash.events.Event;
    
    import gallery.model.CurrentSearchTermModel;
    import gallery.model.events.CurrentSearchTermUpdatedEvent;
    
    import robotlegs.bender.bundles.mvcs.impl.Mediator;

    public class GalleryHeaderMediator extends Mediator
    {
        [Inject]
        public var view:GalleryHeader;

        [Inject]
        public var currentTermModel:CurrentSearchTermModel;

        override public function initialize():void
        {
            addContextListener(CurrentSearchTermUpdatedEvent.UPDATED, handleSearchTermUpdated, CurrentSearchTermUpdatedEvent)
        }

        private function handleSearchTermUpdated(event:Event):void
        {
            view.searchTerm = currentTermModel.term;
        }
    }
}