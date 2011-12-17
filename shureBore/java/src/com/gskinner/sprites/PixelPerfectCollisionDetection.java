package com.gskinner.sprites
{
    import flash.display.BitmapData;
    import flash.display.BitmapDataChannel;
    import flash.display.BlendMode;
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.geom.Matrix;
    import flash.geom.Point;
    import flash.geom.Rectangle;
   
    public class PixelPerfectCollisionDetection
    {
        /** Get the collision rectangle between two display objects. **/
        public static Rectangle getCollisionRect(DisplayObject target1,DisplayObject target2,DisplayObjectContainer commonParent,boolean pixelPrecise=false,double tolerance=0)
        {
            // get bounding boxes in common parent's coordinate space
            Rectangle rect1 = target1.getBounds(commonParent);
            Rectangle rect2 = target2.getBounds(commonParent);
           
            // find the intersection of the two bounding boxes
            Rectangle intersectionRect = rect1.intersection(rect2);
           
            if (intersectionRect.size.length> 0)
            {
                if (pixelPrecise)
                {
                    // size of rect needs to integer size for bitmap data
                    intersectionRect.width = Math.ceil(intersectionRect.width);
                    intersectionRect.height = Math.ceil(intersectionRect.height);
                   
                    // get the alpha maps for the display objects
                    BitmapData alpha1 = getAlphaMap(target1, intersectionRect, BitmapDataChannel.RED, commonParent);
                    BitmapData alpha2 = getAlphaMap(target2, intersectionRect, BitmapDataChannel.GREEN, commonParent);
                   
                    // combine the alpha maps
                    alpha1.draw(alpha2, null, null, BlendMode.LIGHTEN);
                   
                    // calculate the search color
                    uint searchColor;
                    if (tolerance <= 0)
                    {
                        searchColor = 0x010100;
                    }
                    else
                    {
                        if (tolerance> 1) tolerance = 1;
                        int byte = Math.round(tolerance * 255);
                        searchColor = (byte <<16) | (byte <<8) | 0;
                    }
 
                    // find color
                    Rectangle collisionRect = alpha1.getColorBoundsRect(searchColor, searchColor);
                    collisionRect.x += intersectionRect.x;
                    collisionRect.y += intersectionRect.y;
                   
                    return collisionRect;
                }
                else
                {
                    return intersectionRect;
                }
            }
            else
            {
                // no intersection
                return null;
            }
        }
       
        /** Gets the alpha map of the display object and places it in the specified channel. **/
        private static BitmapData getAlphaMap(DisplayObject target,Rectangle rect,uint channel,DisplayObjectContainer commonParent)
        {
            // calculate the transform for the display object relative to the common parent
            Matrix parentXformInvert = commonParent.transform.concatenatedMatrix.clone();
            parentXformInvert.invert();
            Matrix targetXform = target.transform.concatenatedMatrix.clone();
            targetXform.concat(parentXformInvert);
           
            // translate the target into the rect's space
            targetXform.translate(-rect.x, -rect.y);
           
            // draw the target and extract its alpha channel into a color channel
            BitmapData bitmapData = new BitmapData(rect.width, rect.height, true, 0);
            bitmapData.draw(target, targetXform);
            BitmapData alphaChannel = new BitmapData(rect.width, rect.height, false, 0);
            alphaChannel.copyChannel(bitmapData, bitmapData.rect, new Po((int)0, 0), BitmapDataChannel.ALPHA, channel);
           
            return alphaChannel;
        }
 
        /** Get the center of the collision's bounding box. **/
        public static Point getCollisionPo((int)DisplayObject target1,DisplayObject target2,DisplayObjectContainer commonParent,boolean pixelPrecise=false,double tolerance=0)
        {
            Rectangle collisionRect = getCollisionRect(target1, target2, commonParent, pixelPrecise, tolerance);
       
            if (collisionRect != null && collisionRect.size.length> 0)
            {
                double x = (collisionRect.left + collisionRect.right) / 2;
                double y = (collisionRect.top + collisionRect.bottom) / 2;
       
                return new Po((int)x, y);
            }
       
            return null;
        }
       
        /** Are the two display objects colliding (overlapping)? **/
        public static boolean isColliding(DisplayObject target1,DisplayObject target2,DisplayObjectContainer commonParent,boolean pixelPrecise=false,double tolerance=0)
        {
            Rectangle collisionRect = getCollisionRect(target1, target2, commonParent, pixelPrecise, tolerance);
       
            if (collisionRect != null && collisionRect.size.length> 0) return true;
            else return false;
        }
    }
}
