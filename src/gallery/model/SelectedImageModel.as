package gallery.model
{
	import gallery.base.BaseActor;
	import gallery.model.events.SelectedImageUpdatedEvent;
	import gallery.model.vo.GalleryImage;
	
	public class SelectedImageModel extends BaseActor
	{
		private var _selectedImage:GalleryImage;
		
		public function get selectedImage():GalleryImage
		{
			return _selectedImage;
		}
		
		public function set selectedImage(value:GalleryImage):void
		{
			_selectedImage = value;
			dispatch(new SelectedImageUpdatedEvent());
		}
	}
}