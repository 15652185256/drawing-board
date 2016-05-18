//
//  BaseBrush.swift
//  全功能的绘图板
//
//  Created by 赵晓东 on 16/5/16.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import CoreGraphics

protocol PaintBrush {
    func supportedContinuousDrawing() -> Bool;
    func drawInContext(context: CGContextRef)
}
//绘图的基类
class BaseBrush: NSObject, PaintBrush {
    var beginPoint: CGPoint!  //开始点的位置
    var endPoint: CGPoint!    //结束点的位置
    var lastPoint: CGPoint?   //最后一个点的位置（也可以称作是上一个点的位置）
    var strokeWidth: CGFloat! //画笔的宽度
    
    //表示是否是连续不断的绘图
    func supportedContinuousDrawing() -> Bool {
        return false
    }
    
    //基于Context的绘图方法，子类必须实现具体的绘图
    func drawInContext(context: CGContextRef) {
        assert(false, "must implements in subclass.")
    }
}
