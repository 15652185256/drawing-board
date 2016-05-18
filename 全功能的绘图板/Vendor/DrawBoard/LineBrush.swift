//
//  LineBrush.swift
//  全功能的绘图板
//
//  Created by 赵晓东 on 16/5/16.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit
//直尺
class LineBrush: BaseBrush {
    override func drawInContext(context: CGContextRef) {
        CGContextMoveToPoint(context, beginPoint.x, beginPoint.y)
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
    }
}
