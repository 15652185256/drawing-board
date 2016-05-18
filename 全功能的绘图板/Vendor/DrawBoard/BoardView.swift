//
//  BoardView.swift
//  全功能的绘图板
//
//  Created by 赵晓东 on 16/5/16.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

enum DrawingState {
    case Began, Moved, Ended
}
//画板
class BoardView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var strokeWidth: CGFloat //笔划宽度
    var strokeColor: UIColor //笔划颜色
    
    var brush: BaseBrush?//对应到具体的画笔类
    private var realImage: UIImage?//保存当前的图形
    
    override init(frame: CGRect) {
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 1
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 1
        super.init(coder: aDecoder)!
    }
    
    
    private var drawingState: DrawingState!
    // 此处省略init方法与另外两个属性
    // MARK: - touches methods
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.lastPoint = nil
            brush.beginPoint = (touches as NSSet).anyObject()?.locationInView(self)//获得当前点击坐标了
            brush.endPoint = brush.beginPoint
            self.drawingState = .Began
            self.drawingImage()
        }
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = (touches as NSSet).anyObject()?.locationInView(self)
            self.drawingState = .Moved
            self.drawingImage()
        }
    }
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = nil
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = (touches as NSSet).anyObject()?.locationInView(self)
            self.drawingState = .Ended
            self.drawingImage()
        }
    }
    // MARK: - drawing
    private func drawingImage() {
        
        if let brush = self.brush {
            // 1.
            UIGraphicsBeginImageContext(self.bounds.size)
            // 2.
            let context = UIGraphicsGetCurrentContext()
            UIColor.clearColor().setFill()
            UIRectFill(self.bounds)
            //CGContextSetLineCap(context, kCGLineCapRound)
            CGContextSetLineCap(context, CGLineCap.Round)
            CGContextSetLineWidth(context, self.strokeWidth)
            CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor)
            // 3.
            if let realImage = self.realImage {
                realImage.drawInRect(self.bounds)
            }
            // 4.
            brush.strokeWidth = self.strokeWidth
            brush.drawInContext(context!)
            CGContextStrokePath(context)
            // 5.
            let previewImage = UIGraphicsGetImageFromCurrentImageContext()
            if self.drawingState == .Ended || brush.supportedContinuousDrawing() {
                self.realImage = previewImage
            }
            UIGraphicsEndImageContext()
            // 6.
            self.image = previewImage;
            brush.lastPoint = brush.endPoint
        }
    }
    
    
}
