//
//  LabelViewActionBinder.swift
//  Counter
//
//  Created by Ryosuke Tamura on 2019/11/01.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift

class LabelViewActionBinder: NSObject {
    static func bind(reactor:LabelViewReactor,disposeBag:DisposeBag,vc:LabelViewController){
        
        vc.changeLabelButton.rx.tap               // Tap event
            .map { LabelViewReactor.Action.change }  // Convert to Action.increase
        .bind(to: reactor.action)         // Bind to reactor.action
        .disposed(by: disposeBag)
        
        vc.closeButton.rx.tap               // Tap event
            .map { LabelViewReactor.Action.close }  // Convert to Action.increase
        .bind(to: reactor.action)         // Bind to reactor.action
        .disposed(by: disposeBag)
    }
}
