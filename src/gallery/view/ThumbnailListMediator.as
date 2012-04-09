package gallery.view
{
    import flash.events.Event;

    import gallery.model.SelectedImageModel;

    import gallery.model.events.GalleryImagesUpdatedEvent;
    import gallery.model.events.SelectedImageUpdatedEvent;
    import gallery.view.events.ImageSelectedEvent;

    import org.robotlegs.mvcs.Mediator;

    public class ThumbnailListMediator extends Mediator
    {
        [Inject]
        public var view:ThumbnailList;

        [Inject]
        public var model:SelectedImageModel;

        override public function onRegister():void
        {
            addContextListener(GalleryImagesUpdatedEvent.UPDATED, handleImageServiceResults);
            addContextListener(SelectedImageUpdatedEvent.UPDATED, handleSelectedImageUpdated);

            addViewListener(ImageSelectedEvent.IMAGE_SELECTED, dispatch);
        }

        private function handleImageServiceResults(event:GalleryImagesUpdatedEvent):void
        {
            view.dataProvider = event.images;
        }

        private function handleSelectedImageUpdated(event:Event):void
        {
            view.selectedItem = model.selectedImage;
            view.scrollToSelected();
        }
    }
}