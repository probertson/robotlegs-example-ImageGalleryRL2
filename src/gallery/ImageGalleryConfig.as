package gallery
{
	import flash.events.IEventDispatcher;
	
	import gallery.controller.GetImagesCommand;
	import gallery.controller.SearchForTermCommand;
	import gallery.controller.UpdateSelectedImageCommand;
	import gallery.controller.events.GetImagesEvent;
	import gallery.model.CurrentSearchTermModel;
	import gallery.model.GalleryImageListModel;
	import gallery.model.SelectedImageModel;
	import gallery.service.FlickrImageService;
	import gallery.service.IImageService;
	import gallery.view.GalleryHeader;
	import gallery.view.GalleryHeaderMediator;
	import gallery.view.GalleryImageView;
	import gallery.view.GalleryImageViewMediator;
	import gallery.view.GallerySearchView;
	import gallery.view.GallerySearchViewMediator;
	import gallery.view.ImageListView;
	import gallery.view.ImageListViewMediator;
	import gallery.view.ThumbnailList;
	import gallery.view.ThumbnailListMediator;
	import gallery.view.events.ImageSelectedEvent;
	import gallery.view.events.SearchForTermEvent;
	
	import org.robotlegs.core.IMediatorMap;
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	
	public class ImageGalleryConfig
	{
		[Inject]
		public var injector:Injector;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:IEventCommandMap;
		
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[PostConstruct]
		public function startup():void
		{
			injector.map(IImageService).toSingleton(FlickrImageService);
			
			injector.map(GalleryImageListModel).asSingleton();
			injector.map(SelectedImageModel).asSingleton();
			injector.map(CurrentSearchTermModel).asSingleton();
			
			mediatorMap.mapView(ThumbnailList, ThumbnailListMediator);
			mediatorMap.mapView(GalleryImageView, GalleryImageViewMediator);
			mediatorMap.mapView(GallerySearchView, GallerySearchViewMediator);
			mediatorMap.mapView(GalleryHeader, GalleryHeaderMediator);
			mediatorMap.mapView(ImageListView, ImageListViewMediator);
			
			commandMap.map(GetImagesEvent.GET_IMAGES, GetImagesEvent).toCommand(GetImagesCommand);
			commandMap.map(ImageSelectedEvent.IMAGE_SELECTED, ImageSelectedEvent).toCommand(UpdateSelectedImageCommand);
			commandMap.map(SearchForTermEvent.SEARCH, SearchForTermEvent).toCommand(SearchForTermCommand);
			
			eventDispatcher.dispatchEvent(new GetImagesEvent());
		}
	}
}