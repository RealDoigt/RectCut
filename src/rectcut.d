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
    
    auto cutRight(T a)
    {
        T originalX = maxX;
        maxX = max(minX, maxX - a);
        return RectCut(maxX, minY, originalX, maxY);
    }
    
    auto cutTop(T a)
    {
        T originalY = minY;
        minY = min(maxX, minY + a);
        return RectCut(minX, originalY, maxX, minY);
    }
    
    auto cutBottom(T a)
    {
        T originalY = maxY;
        maxY = max(minY, maxY - a);
        return RectCut(minX, maxY, maxX, originalY);
    }
}
