//
//  ZCControl.swift
//  WeatherDemo
//
//  Created by 赵晓东 on 16/5/12.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

//创建View
func createView (frame:CGRect) -> (UIView) {
    let view = UIView(frame: frame)
    return view;
}

//创建Label
func createLabel (frame:CGRect, Font:CGFloat, Text:String) -> (UILabel) {
    let label = UILabel(frame: frame)
    label.text = Text
    label.font = UIFont.systemFontOfSize(Font)
    return label
}

//创建button
func createButton (frame:CGRect, Text:String, ImageName:String, bgImageName:String, Target:AnyObject, Method:Selector) -> (UIButton) {
    let button = UIButton(type:.Custom)
    button.frame = frame
    button.setTitle(Text, forState: UIControlState.Normal)
    if ImageName.isEmpty {
        
    } else {
        button.setImage(UIImage(named:ImageName), forState: UIControlState.Normal)
    }
    
    if bgImageName.isEmpty {
        
    } else {
        button.setBackgroundImage(UIImage(named:bgImageName), forState: UIControlState.Normal)
    }
    button.addTarget(Target, action: Method, forControlEvents:UIControlEvents.TouchUpInside)
    return button
}


//创建imageView
func createImageView (frame:CGRect, ImageName:String) -> (UIImageView) {
    let imageView = UIImageView(frame: frame)
    imageView.image = UIImage(named:ImageName)
    imageView.userInteractionEnabled = true
    return imageView
}


//创建UITextField
func createTextField (frame:CGRect, placeholder:String, passWord:Bool, Font:CGFloat) -> (UITextField) {
    let textField = UITextField(frame: frame)
    //灰色提示框
    textField.placeholder = placeholder
    //文字对齐方式
    textField.textAlignment = NSTextAlignment.Left
    //是否加密
    textField.secureTextEntry = passWord
    //边框
    textField.borderStyle = UITextBorderStyle.RoundedRect
    //键盘类型
    textField.keyboardType = UIKeyboardType.EmailAddress
    //关闭首字母大写
    
    //清除按钮
    
    //字体
    textField.font = UIFont.systemFontOfSize(Font)
    
    return textField
}