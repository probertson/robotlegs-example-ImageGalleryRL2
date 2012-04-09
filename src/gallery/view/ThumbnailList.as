package gallery.view
{
    import gallery.model.vo.GalleryImage;
    import gallery.view.events.ImageSelectedEvent;
    import gallery.view.renderers.PhotoThumbnailRenderer;

    import mx.collections.IList;

    import mx.core.ClassFactory;

    import spark.components.List;
    import spark.layouts.HorizontalLayout;

    [Event(name="photoSelected", type="gallery.view.events.PhotoSelectedEvent")]
    public class ThumbnailList extends List
    {
        public function ThumbnailList()
        {
            itemRenderer = new ClassFactory(PhotoThumbnailRenderer);
            layout = new HorizontalLayout();
            percentWidth = 100;
            height = 95;
        }

        override public function set dataProvider(value:IList):void
        {
            super.dataProvider = value;

            selectedIndex = 0;
        }

        override protected function itemSelected(index:int, selected:Boolean):void
        {
            super.itemSelected(index, selected);

            var galleryImage:GalleryImage = dataProvider.getItemAt(index) as GalleryImage;

            if(selected)
                dispatchEvent(new ImageSelectedEvent(galleryImage));

        }

        public function scrollToSelected():void
        {
            ensureIndexIsVisible(dataProvider.getItemIndex(selectedItem));
        }
    }
}