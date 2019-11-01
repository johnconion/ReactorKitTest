//
//  LabelViewStateBinder.swift
//  Counter
//
//  Created by Ryosuke Tamura on 2019/11/01.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LabelViewStateBinder: NSObject {
    static func bind(reactor:LabelViewReactor,disposeBag:DisposeBag,vc:LabelViewController){
        // State
        
        reactor.state
            .map{$0.labelIsHidden}
            .distinctUntilChanged()
            .bind(to: vc.label.rx.isHidden)  // Bind to valueLabel
            .disposed(by: disposeBag)
        
        
        reactor.state.map{$0.closeFlag}
        .distinctUntilChanged()
        .subscribe(onNext: { _ in
            vc.dismiss(animated: true, completion: nil)
        })
        .disposed(by: disposeBag)
    }
}
