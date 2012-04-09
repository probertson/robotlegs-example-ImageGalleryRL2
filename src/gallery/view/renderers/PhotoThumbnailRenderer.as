package gallery.view.renderers
{
    import spark.components.Image;
    import spark.components.supportClasses.ItemRenderer;
    import spark.layouts.HorizontalAlign;
    import spark.layouts.VerticalAlign;

    public class PhotoThumbnailRenderer extends ItemRenderer
    {
        private var image:Image;

        public function PhotoThumbnailRenderer()
        {
            autoDrawBackground = false;
            width = 75;
            height = 75;
        }

        override protected function createChildren():void
        {
            super.createChildren();

            image = new Image();
            image.percentHeight = 100;
            image.percentWidth = 100;
            image.verticalAlign = VerticalAlign.MIDDLE;
            image.horizontalAlign = HorizontalAlign.CENTER;
            addElement(image);
        }

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
        {
            super.updateDisplayList(unscaledWidth, unscaledHeight);

            if(data)
                image.source = data.thumbnailURL;

            selected ? alpha = 1 : alpha = .5;
        }


        override public function set selected(value:Boolean):void
        {
            super.selected = value;

            invalidateDisplayList();
        }
    }
}