package gallery.view
{
    import flash.events.Event;
    
    import gallery.model.SelectedImageModel;
    import gallery.model.events.GalleryImagesUpdatedEvent;
    import gallery.model.events.SelectedImageUpdatedEvent;
    import gallery.view.events.ImageSelectedEvent;
    
    import robotlegs.bender.bundles.mvcs.Mediator;

    public class ImageListViewMediator extends Mediator
    {
        [Inject]
        public var view:ImageListView;

        [Inject]
        public var model:SelectedImageModel;

        override public function initialize():void
        {
            addContextListener(GalleryImagesUpdatedEvent.UPDATED, handleImageServiceResults, GalleryImagesUpdatedEvent);
            addContextListener(SelectedImageUpdatedEvent.UPDATED, handleSelectedImageUpdated, SelectedImageUpdatedEvent);

            addViewListener(ImageSelectedEvent.IMAGE_SELECTED, dispatch, ImageSelectedEvent);
        }

        private function handleImageServiceResults(event:GalleryImagesUpdatedEvent):void
        {
            view.dataProvider = event.images;
        }

        private function handleSelectedImageUpdated(event:Event):void
        {
            view.selectedItem = model.selectedImage;
        }
    }
}