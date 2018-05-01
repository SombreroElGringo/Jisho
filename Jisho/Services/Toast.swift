//
//  Toast.swift
//  Jisho
//
//  Created by Florent on 01/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import Foundation
import UIKit

open class Toast: UILabel {
    
    var overlayView = UIView()
    var backView = UIView()
    var lbl = UILabel()
    
    class var shared: Toast {
        struct Static {
            static let instance: Toast = Toast()
        }
        return Static.instance
    }
    
    func setup(_ view: UIView, message: String) {
        let white = UIColor( r: 1, g: 0, b: 0, alpha: 0)
        
        backView.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height)
        backView.center = view.center
        backView.backgroundColor = white
        view.addSubview(backView)
        
        overlayView.frame = CGRect(x: 0, y: 0, width: view.frame.width - 60  , height: 50)
        overlayView.center = CGPoint(x: view.bounds.width / 2, y: view.frame.origin.y + 200)
        overlayView.backgroundColor = UIColor(r: 196, g: 196, b: 196)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        overlayView.alpha = 0
        
        lbl.frame = CGRect(x: 0, y: 0, width: overlayView.frame.width, height: 50)
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.white
        lbl.center = overlayView.center
        lbl.text = message
        lbl.textAlignment = .center
        lbl.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        overlayView.addSubview(lbl)
        
        view.addSubview(overlayView)
    }
    
    open func long(_ view: UIView, message:String) {
        self.setup(view, message: message)
        //Animation
        UIView.animate(withDuration: 2, animations: {
            self.overlayView.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 2, animations: {
                self.overlayView.alpha = 0
            }) { (true) in
                UIView.animate(withDuration: 2, animations: {
                    DispatchQueue.main.async(execute: {
                        self.overlayView.alpha = 0
                        self.lbl.removeFromSuperview()
                        self.overlayView.removeFromSuperview()
                        self.backView.removeFromSuperview()
                    })
                })
            }
        }
    }
}
