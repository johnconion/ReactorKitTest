//
//  LabelViewReactor.swift
//  Counter
//
//  Created by Ryosuke Tamura on 2019/11/01.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

class LabelViewReactor: Reactor {
   
    let initialState: LabelViewState

    init() {
        self.initialState = LabelViewState(
            labelIsHidden: false,
            closeFlag: false
        )
    }
}

extension LabelViewReactor{
    // Action -> Mutation
    func mutate(action: LabelViewAction) -> Observable<LabelViewMutation> {
        switch action {
        case .change:
            return Observable.concat([
                Observable.just(Mutation.changeIsHidden)
            ])

        case .close:
            return Observable.concat([
                Observable.just(Mutation.closeWindow)
            ])
        }
    }
}

extension LabelViewReactor{
    // Mutation -> State
    func reduce(state: LabelViewState, mutation: LabelViewMutation) -> LabelViewState {
        var state = state
        switch mutation {
        case .changeIsHidden:
            state.labelIsHidden = !state.labelIsHidden
        case .closeWindow:
            state.closeFlag = true
        }
        return state
    }
}
