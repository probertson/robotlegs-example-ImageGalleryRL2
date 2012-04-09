package gallery.service
{
    import gallery.model.GalleryImageListModel;
    import gallery.model.vo.GalleryImage;

    import mx.collections.ArrayCollection;

    import mx.rpc.events.ResultEvent;
    import mx.rpc.http.HTTPService;

    import org.robotlegs.mvcs.Actor;

	public class XMLImageService extends Actor implements IImageService
	{
		protected static const BASE_URL:String = "assets/gallery/";

        [Inject]
        public var imagesListModel:GalleryImageListModel;

		public function getImages():void
		{
            loadXMLForImages();
        }

        private function loadXMLForImages():void
        {
            var service:HTTPService = new HTTPService();
            service.resultFormat = HTTPService.RESULT_FORMAT_E4X;
            service.url = BASE_URL + "gallery.xml";
            service.addEventListener(ResultEvent.RESULT, handleServiceResult);
            service.send();
        }

        public function search(forTerm:String):void
        {
            loadXMLForImages();
        }

        protected function handleServiceResult(event:Object):void
		{
			var images:ArrayCollection = new ArrayCollection();

			for each(var image:XML in event.result.image)
            {
                var baseURL:String = BASE_URL + "images/" + image.@name;
				var photo:GalleryImage = new GalleryImage();

				photo.fullSizeURL = baseURL + '.jpg';
                photo.thumbnailURL = baseURL  + '_s.jpg';
                photo.name = image.@name;

                images.addItem( photo );
			}

			imagesListModel.images = images;
		}

	}
}