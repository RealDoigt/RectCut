module rectcut;
import std.algorithm;
import std.traits;

enum RectCutSide
{
    left,
    right,
    top,
    bottom
}

struct Rect(T) if (isNumeric!(T))
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
    
    auto getLeft(T a)
    {
        T newX = min(maxX, minX + a);
        return RectCut(minX, minY, newX, maxY);
    }
    
    auto getRight(T a)
    {
        newX = max(minX, maxX - a);
        return RectCut(newX, minY, maxX, maxY);
    }
    
    auto getTop(T a)
    {
        newY = min(maxX, minY + a);
        return RectCut(minX, minY, maxX, newY);
    }
    
    auto getBottom(T a)
    {
        newY = max(minY, maxY - a);
        return RectCut(minX, newY, maxX, maxY);
    }
    
    auto addLeft(T a)
    {
        return RectCut(minX - a, minY, maxX, maxY);
    }
    
    auto addRight(T a)
    {
        return RectCut(minX, minY, maxX + a, maxY);
    }
    
    auto addTop(T a)
    {
        return RectCut(minX, minY - a, maxX, maxY);
    }
    
    auto addBottom(T a)
    {
        return RectCut(minX, minY, maxX, maxY + a);
    }
}
