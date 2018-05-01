//
//  Color.swift
//  Jisho
//
//  Created by Florent on 01/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r:CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
