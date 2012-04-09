package gallery.controller
{
    import gallery.model.SelectedImageModel;
    import gallery.view.events.ImageSelectedEvent;

    public class UpdateSelectedImageCommand
    {
        [Inject]
        public var event:ImageSelectedEvent;

        [Inject]
        public var selectedImageModel:SelectedImageModel;

        public function execute():void
        {
            selectedImageModel.selectedImage = event.image;
        }
    }
}