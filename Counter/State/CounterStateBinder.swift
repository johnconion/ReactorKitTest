//
//  CounterReactor.swift
//  Counter
//
//  Created by Ryosuke Tamura on 2019/10/31.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import RxCocoa
import RxSwift

final class CounterStateBinder {
    static func bind(reactor:CounterViewReactor,disposeBag:DisposeBag,vc:CounterViewController){
        // State
        reactor.state.map { $0.value }   // 10
          .distinctUntilChanged()
          .map { "\($0)" }               // "10"
            .bind(to: vc.valueLabel.rx.text)  // Bind to valueLabel
          .disposed(by: disposeBag)

        reactor.state.map { $0.isLoading }
          .distinctUntilChanged()
            .bind(to: vc.activityIndicatorView.rx.isAnimating)
          .disposed(by: disposeBag)
    }
}
