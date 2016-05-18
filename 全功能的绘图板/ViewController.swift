//
//  ViewController.swift
//  全功能的绘图板
//
//  Created by 赵晓东 on 16/5/16.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var board:BoardView!//画板
    
    var appsArray:[String] = ["铅笔","直尺","虚线","矩形","圆形","橡皮擦"]
    
    var brushes = [PencilBrush(), LineBrush(), DashLineBrush(), RectangleBrush(), EllipseBrush(), EraserBrush()]
    
    //创建分段控件
    var segment:UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createNav()
        self.createView()
    }
    
    //设置导航
    func createNav () {
    
        //设置导航不透明
        self.navigationController?.navigationBar.translucent = false
        
        //设置导航背景图
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        self.segment = UISegmentedControl(items: self.appsArray)
        self.segment.selectedSegmentIndex = 0
        self.segment.tintColor = UIColor.blueColor()
        self.segment.addTarget(self, action: Selector("segmentAction:"), forControlEvents: UIControlEvents.ValueChanged)
        self.navigationItem.titleView = self.segment
    }
    //创建页面
    func createView () {
    
        self.board = BoardView(frame: CGRectMake(0, 0, WIDTH, HEIGHT-64))
        self.board.backgroundColor = UIColor.lightGrayColor()
        self.board.userInteractionEnabled = true
        self.view.addSubview(self.board)
        
        self.board.brush = brushes[0]
    }
    
    func segmentAction (sender: UISegmentedControl) {
        assert(sender.tag < self.brushes.count, "!!!")
        self.board.brush = self.brushes[sender.selectedSegmentIndex]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

