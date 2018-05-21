//
//  UILinedTextView.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

@IBDesignable class UILinedTextView: UITextView {
    @IBInspectable var textPadding: CGFloat = 0 {
        didSet {
            textContainer.lineFragmentPadding = textPadding
        }
    }
}
