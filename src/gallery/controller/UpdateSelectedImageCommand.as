package gallery.controller
{
    import gallery.model.SelectedImageModel;
    import gallery.view.events.ImageSelectedEvent;

    import org.robotlegs.mvcs.Command

    public class UpdateSelectedImageCommand extends Command
    {
        [Inject]
        public var event:ImageSelectedEvent;

        [Inject]
        public var selectedImageModel:SelectedImageModel;

        override public function execute():void
        {
            selectedImageModel.selectedImage = event.image;
        }
    }
}