package gallery.view
{
    import flash.events.Event;

    import gallery.model.CurrentSearchTermModel;

    import gallery.model.events.CurrentSearchTermUpdatedEvent;

    import org.robotlegs.mvcs.Mediator;

    public class GalleryHeaderMediator extends Mediator
    {
        [Inject]
        public var view:GalleryHeader;

        [Inject]
        public var currentTermModel:CurrentSearchTermModel;

        override public function onRegister():void
        {
            addContextListener(CurrentSearchTermUpdatedEvent.UPDATED, handleSearchTermUpdated)
        }

        private function handleSearchTermUpdated(event:Event):void
        {
            view.searchTerm = currentTermModel.term;
        }
    }
}