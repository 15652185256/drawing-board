//
//  DashLineBrush.swift
//  全功能的绘图板
//
//  Created by 赵晓东 on 16/5/16.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit
//虚线
class DashLineBrush: BaseBrush {
    override func drawInContext(context: CGContextRef) {
        let lengths: [CGFloat] = [self.strokeWidth * 3, self.strokeWidth * 3]
        CGContextSetLineDash(context, 0, lengths, 2);
        CGContextMoveToPoint(context, beginPoint.x, beginPoint.y)
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
    }
}
