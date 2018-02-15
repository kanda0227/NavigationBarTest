//
//  CustomButtonView.swift
//  NavigationBarTest
//
//  Created by Kanda Sena on 2018/02/15.
//  Copyright © 2018 sena.kanda. All rights reserved.
//

import UIKit

final class CustomButtonView: UIView {
    @IBOutlet weak var shobonButton: UIButton!
    @IBOutlet weak var shakinButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        makeView()
    }
    
    func makeView() {
        let nib = UINib(nibName: "CustomButtonView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.frame
        addSubview(view)
    }
    
    /// AutoLayout利用時のviewの理想サイズで上書き
//    override var intrinsicContentSize: CGSize {
//        return bounds.size
//    }
}
