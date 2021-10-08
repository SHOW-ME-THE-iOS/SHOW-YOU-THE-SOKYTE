//
//  PresentationType.swift
//  CustomTransition
//
//  Created by soyeon on 2021/10/08.
//

import Foundation

// 14
enum PresentationType {

    case present
    case dismiss

    var isPresenting: Bool {
        return self == .present
    }
}
