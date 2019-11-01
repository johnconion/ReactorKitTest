//
//  Router.swift
//  Counter
//
//  Created by Ryosuke Tamura on 2019/11/01.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import UIKit

class Router: NSObject {
    static func presentNextView(vc:CounterViewController){
        if let newVC = (UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "label_view")) as? LabelViewController {
            vc.present(newVC, animated: true, completion: nil)
        }
    }
}
