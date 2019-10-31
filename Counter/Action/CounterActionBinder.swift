//
//  CounterActionBinder.swift
//  Counter
//
//  Created by Ryosuke Tamura on 2019/10/31.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

final class CounterActionBinder {
    static func bind(reactor:CounterViewReactor,disposeBag:DisposeBag,vc:CounterViewController){
        // Action
        vc.increaseButton.rx.tap               // Tap event
            .map { CounterViewReactor.Action.increase }  // Convert to Action.increase
          .bind(to: reactor.action)         // Bind to reactor.action
          .disposed(by: disposeBag)

        vc.decreaseButton.rx.tap
            .map { CounterViewReactor.Action.decrease }
          .bind(to: reactor.action)
          .disposed(by: disposeBag)
    }
}
