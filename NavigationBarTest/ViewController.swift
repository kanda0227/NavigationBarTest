//
//  ViewController.swift
//  NavigationBarTest
//
//  Created by Kanda Sena on 2018/02/14.
//  Copyright © 2018 sena.kanda. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageView2: UIImageView!
    private var customView: CustomButtonView = CustomButtonView(frame: CGRect(x: 0, y: 0, width: 131, height: 30))
    private var toolBar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 50, width: UIScreen.main.bounds.width, height: 50))
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(toolBar)
        
        /// レイアウト制約を追加する
        customView.widthAnchor.constraint(equalToConstant: customView.bounds.width).isActive = true
        customView.heightAnchor.constraint(equalToConstant: customView.bounds.height).isActive = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customView)
        
        let switchButton = UIButton(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        switchButton.setImage(#imageLiteral(resourceName: "pad"), for: .normal)
        
        /// addSubview 前に layoutIfNeededを呼び出す
        toolBar.layoutIfNeeded()
        toolBar.addSubview(switchButton)
        
        switchButton.rx.tap.subscribe { [weak self] _ in
            guard let _self = self else { return }
            _self.imageView.isHighlighted = !_self.imageView.isHighlighted
            _self.imageView2.isHighlighted = !_self.imageView2.isHighlighted
        }.disposed(by: bag)
        
        customView.shakinButton.rx.tap.subscribe { [weak self] _ in
            self?.imageView.alpha = 1
            self?.imageView2.alpha = 0
            }.disposed(by: bag)
        customView.shobonButton.rx.tap.subscribe { [weak self] _ in
            self?.imageView.alpha = 0
            self?.imageView2.alpha = 1
        }.disposed(by: bag)
    }
}
