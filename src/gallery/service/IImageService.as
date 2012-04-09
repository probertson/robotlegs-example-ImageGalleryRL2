package gallery.service
{
    public interface IImageService
    {
        function getImages():void;
        function search(forTerm:String):void;
    }
}