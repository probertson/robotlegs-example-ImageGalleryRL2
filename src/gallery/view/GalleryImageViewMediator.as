package gallery.view
{
    import gallery.model.SelectedImageModel;
    import gallery.model.events.SelectedImageUpdatedEvent;
    import gallery.model.vo.GalleryImage;
    
    import robotlegs.bender.bundles.mvcs.Mediator;

    public class GalleryImageViewMediator extends Mediator
    {
        [Inject]
        public var view:GalleryImageView;

        [Inject]
        public var selectedImageModel:SelectedImageModel;

        override public function initialize():void
        {
            addContextListener(SelectedImageUpdatedEvent.UPDATED, handleSelectedImageUpdated, SelectedImageUpdatedEvent);
        }

        private function handleSelectedImageUpdated(event:SelectedImageUpdatedEvent):void
        {
            var selectedImage:GalleryImage = selectedImageModel.selectedImage;
            view.source = selectedImage.fullSizeURL;
        }
    }
}