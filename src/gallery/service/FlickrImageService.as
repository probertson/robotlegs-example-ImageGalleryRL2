package gallery.service
{
    import com.adobe.webapis.flickr.FlickrService;
    import com.adobe.webapis.flickr.Photo;
    import com.adobe.webapis.flickr.events.FlickrResultEvent;
    import com.adobe.webapis.flickr.methodgroups.Photos;
    import com.adobe.webapis.flickr.methodgroups.helpers.PhotoSearchParams;
    
    import gallery.model.GalleryImageListModel;
    import gallery.model.vo.GalleryImage;
    
    import mx.collections.ArrayCollection;

    public class FlickrImageService implements IImageService
    {
        [Inject]
        public var imageListModel:GalleryImageListModel;

        private var service:FlickrService= new FlickrService("516ab798392cb79523691e6dd79005c2");

        private var photos:Photos;

        public function getImages():void
        {
            service.addEventListener(FlickrResultEvent.INTERESTINGNESS_GET_LIST, handleSearchResult);
            service.interestingness.getList(null, "", 20)
        }

		public function search(forTerm:String):void
		{
			if(!photos)
				photos = new Photos(service);

			service.addEventListener(FlickrResultEvent.PHOTOS_SEARCH, handleSearchResult);

            var p:PhotoSearchParams = new PhotoSearchParams();
			p.text = forTerm;
			p.per_page = 20;
			p.content_type = 1;
			p.media = "photo";
			p.sort = "date-posted-desc";

			photos.searchWithParamHelper(p);
		}

        protected function handleSearchResult(event:FlickrResultEvent):void
        {
            processFlickrPhotoResults(event.data.photos.photos);
        }

        protected function processFlickrPhotoResults(results:Array):void
        {
            var images:ArrayCollection = new ArrayCollection();

            for each(var flickrPhoto:Photo in results)
            {
                var baseURL:String = 'http://farm' + flickrPhoto.farmId + '.static.flickr.com/' + flickrPhoto.server + '/' + flickrPhoto.id + '_' + flickrPhoto.secret;
                var photoImage:GalleryImage = new GalleryImage();

                photoImage.fullSizeURL = baseURL + ".jpg";
                photoImage.thumbnailURL = baseURL + "_s.jpg";

                photoImage.name = flickrPhoto.title;

                images.addItem(photoImage);
            }

            imageListModel.images = images;
        }
    }
}