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
	
	import org.robotlegs.core.ICommandMap;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IMediatorMap;
	import org.robotlegs.mvcs.Context;
	
	public class ImageGalleryConfig
	{
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:ICommandMap;
		
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[PostConstruct]
		public function startup():void
		{
			injector.mapSingletonOf(IImageService, FlickrImageService);
			
			injector.mapSingleton(GalleryImageListModel);
			injector.mapSingleton(SelectedImageModel);
			injector.mapSingleton(CurrentSearchTermModel);
			
			mediatorMap.mapView(ThumbnailList, ThumbnailListMediator);
			mediatorMap.mapView(GalleryImageView, GalleryImageViewMediator);
			mediatorMap.mapView(GallerySearchView, GallerySearchViewMediator);
			mediatorMap.mapView(GalleryHeader, GalleryHeaderMediator);
			mediatorMap.mapView(ImageListView, ImageListViewMediator);
			
			commandMap.mapEvent(GetImagesEvent.GET_IMAGES, GetImagesCommand);
			commandMap.mapEvent(ImageSelectedEvent.IMAGE_SELECTED, UpdateSelectedImageCommand);
			commandMap.mapEvent(SearchForTermEvent.SEARCH, SearchForTermCommand);
			
			eventDispatcher.dispatchEvent(new GetImagesEvent());
		}
	}
}