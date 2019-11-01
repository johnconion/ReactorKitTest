//
//  LabelViewController.swift
//  Counter
//
//  Created by Ryosuke Tamura on 2019/11/01.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift

class LabelViewController: UIViewController,StoryboardView {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var changeLabelButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        self.reactor = LabelViewReactor()
    }
    
    // Called when the new value is assigned to `self.reactor`
    func bind(reactor: LabelViewReactor) {
        LabelViewActionBinder.bind(reactor: reactor, disposeBag: disposeBag, vc: self)
        LabelViewStateBinder.bind(reactor: reactor, disposeBag: disposeBag, vc: self)
    }
}
