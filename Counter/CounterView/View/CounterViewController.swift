//
//  CounterViewController.swift
//  Counter
//
//  Created by Suyeol Jeon on 02/05/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift

// Conform to the protocol `View` then the property `self.reactor` will be available.
final class CounterViewController: UIViewController, StoryboardView {
    @IBOutlet var decreaseButton: UIButton!
    @IBOutlet var increaseButton: UIButton!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet weak var goNextViewButton: UIButton!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        self.reactor = CounterViewReactor()
    }
    
    // Called when the new value is assigned to `self.reactor`
    func bind(reactor: CounterViewReactor) {
        CounterActionBinder.bind(reactor: reactor, disposeBag: disposeBag, vc: self)
        CounterStateBinder.bind(reactor: reactor, disposeBag: disposeBag, vc: self)
    }
}
