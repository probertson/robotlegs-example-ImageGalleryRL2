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
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	//public class ImageGalleryConfig
	public class ImageGalleryConfig implements IConfig
	{
		/*[Inject]
		public var injector:Injector;*/
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:IEventCommandMap;
		
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		/*[PostConstruct]
		public function startup():void
		{
			injector.map(IImageService).toSingleton(FlickrImageService);
			
			injector.map(GalleryImageListModel).asSingleton();
			injector.map(SelectedImageModel).asSingleton();
			injector.map(CurrentSearchTermModel).asSingleton();
			
			mediatorMap.mapView(ThumbnailList).toMediator(ThumbnailListMediator);
			mediatorMap.mapView(GalleryImageView).toMediator(GalleryImageViewMediator);
			mediatorMap.mapView(GallerySearchView).toMediator(GallerySearchViewMediator);
			mediatorMap.mapView(GalleryHeader).toMediator(GalleryHeaderMediator);
			mediatorMap.mapView(ImageListView).toMediator(ImageListViewMediator);
			
			commandMap.map(GetImagesEvent.GET_IMAGES, GetImagesEvent).toCommand(GetImagesCommand);
			commandMap.map(ImageSelectedEvent.IMAGE_SELECTED, ImageSelectedEvent).toCommand(UpdateSelectedImageCommand);
			commandMap.map(SearchForTermEvent.SEARCH, SearchForTermEvent).toCommand(SearchForTermCommand);
			
			eventDispatcher.dispatchEvent(new GetImagesEvent());
		}*/
		
		public function configure():void
		{
			injector.map(IImageService).toSingleton(FlickrImageService);
			
			injector.map(GalleryImageListModel).asSingleton();
			injector.map(SelectedImageModel).asSingleton();
			injector.map(CurrentSearchTermModel).asSingleton();
			
			mediatorMap.map(ThumbnailList).toMediator(ThumbnailListMediator);
			mediatorMap.map(GalleryImageView).toMediator(GalleryImageViewMediator);
			mediatorMap.map(GallerySearchView).toMediator(GallerySearchViewMediator);
			mediatorMap.map(GalleryHeader).toMediator(GalleryHeaderMediator);
			mediatorMap.map(ImageListView).toMediator(ImageListViewMediator);
			
			commandMap.map(GetImagesEvent.GET_IMAGES, GetImagesEvent).toCommand(GetImagesCommand);
			commandMap.map(ImageSelectedEvent.IMAGE_SELECTED, ImageSelectedEvent).toCommand(UpdateSelectedImageCommand);
			commandMap.map(SearchForTermEvent.SEARCH, SearchForTermEvent).toCommand(SearchForTermCommand);
			
			eventDispatcher.dispatchEvent(new GetImagesEvent());
		}
	}
}