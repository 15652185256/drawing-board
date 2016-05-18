//
//  PencilBrush.swift
//  全功能的绘图板
//
//  Created by 赵晓东 on 16/5/16.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit
//铅笔工具
class PencilBrush: BaseBrush {
    //如果lastPoint为nil，则基于beginPoint画线，反之则基于lastPoint画线。
    override func drawInContext(context: CGContextRef) {
        if let lastPoint = self.lastPoint {
            CGContextMoveToPoint(context, lastPoint.x, lastPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
        } else {
            CGContextMoveToPoint(context, beginPoint.x, beginPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
        }
    }
    override func supportedContinuousDrawing() -> Bool {
        return true
    }
}
