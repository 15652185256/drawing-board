//
//  EraserBrush.swift
//  全功能的绘图板
//
//  Created by 赵晓东 on 16/5/16.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit
//橡皮擦
class EraserBrush: PencilBrush {
    override func drawInContext(context: CGContextRef) {
        CGContextSetBlendMode(context, CGBlendMode.Clear);
        super.drawInContext(context)
    }
}
