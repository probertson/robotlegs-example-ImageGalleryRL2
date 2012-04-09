package gallery.model
{
	import flash.events.IEventDispatcher;
	
	import gallery.model.events.GalleryImagesUpdatedEvent;
	
	import mx.collections.IList;
	
	public class GalleryImageListModel
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		
		private var _images:IList;
		
		public function get images():IList
		{
			return _images;
		}
		
		public function set images(value:IList):void
		{
			_images = value;
			
			eventDispatcher.dispatchEvent(new GalleryImagesUpdatedEvent(value));
		}
	}
}