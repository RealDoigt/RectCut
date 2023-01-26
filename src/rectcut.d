module rectcut;
import std.algorithm;
import std.traits;

struct RectCut(T) if (isNumeric!(T))
{
    T minX, minY, maxX, maxY;
    
    auto cutLeft(T a)
    {
        T originalX = minX;
        minX = min(maxX, minX + a);
        return RectCut(originalX, minY, minX, maxY);
    }
}
