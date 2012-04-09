package gallery.view
{
    import gallery.model.SelectedImageModel;
    import gallery.model.events.SelectedImageUpdatedEvent;
    import gallery.model.vo.GalleryImage;

    import org.robotlegs.mvcs.Mediator;

    public class GalleryImageViewMediator extends Mediator
    {
        [Inject]
        public var view:GalleryImageView;

        [Inject]
        public var selectedImageModel:SelectedImageModel;

        override public function onRegister():void
        {
            addContextListener(SelectedImageUpdatedEvent.UPDATED, handleSelectedImageUpdated);
        }

        private function handleSelectedImageUpdated(event:SelectedImageUpdatedEvent):void
        {
            var selectedImage:GalleryImage = selectedImageModel.selectedImage;
            view.source = selectedImage.fullSizeURL;
        }
    }
}