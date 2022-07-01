//
//  File.swift
//  
//
//  Created by Maxim on 01.07.2022.
//

//#if canImport(Foundation)
import Foundation
import UIKit


public extension Bundle {
    static func getBTWWModuleBundle() -> Bundle {
        return Bundle.module
    }
    //    static var bundle_BTWW = Bundle.module
}



public func getBTWWStoryboardVC(stbName: String) -> UIViewController {
    let storyboard = UIStoryboard(name: stbName, bundle: Bundle.module)
    return storyboard.instantiateInitialViewController()!
}

//#endif
