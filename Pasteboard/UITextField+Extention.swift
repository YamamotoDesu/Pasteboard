//
//  UITextField+Extention.swift
//  Pasteboard
//
//  Created by 山本響 on 2023/02/12.
//  Copyright © 2023 Nyisztor, Karoly. All rights reserved.
//


import Foundation
import UIKit

extension UITextField {
    override open func copy(_ sender: Any?) {
        AppDelegate.customPasteboard?.string = self.text
    }
    
    override open func cut(_ sender: Any?) {
        AppDelegate.customPasteboard?.string = self.text
        self.text = nil
    }
    
    override open func paste(_ sender: Any?) {
        if let text = AppDelegate.customPasteboard?.string {
            self.text = text
        }
    }
    
}
