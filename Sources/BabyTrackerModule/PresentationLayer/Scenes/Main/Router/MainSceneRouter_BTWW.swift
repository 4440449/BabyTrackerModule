//
//  MainSceneRouter_BTWW.swift
//  Baby tracker
//
//  Created by Max on 13.07.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit


protocol MainSceneRouterProtocol_BTWW {
    func prepare<S,D,V>(for segue: S, interactor: D, sourceVC: V?)
    func perform<V>(type: LifeCycle, vc: V)
}

//MARK: - Implementation -

final class MainSceneRouter_BTWW: MainSceneRouterProtocol_BTWW {
    
    private var selectedIndex: Int?
    private let customTransition = PopCustomTransitioningDelegate()
    
    func prepare<S,D,V>(for segue: S, interactor: D, sourceVC: V?) {
        guard let segue = segue as? UIStoryboardSegue else { return }
        
        if let detailDreamVC = segue.destination as? DetailDreamSceneViewController_BTWW {
            detailDreamVC.configurator.configureScene(view: detailDreamVC,
                                                      interactor: interactor,
                                                      selectedIndex: selectedIndex)
            selectedIndex = nil
            
        } else
            if let detailWakeVC = segue.destination as? DetailWakeSceneViewController_BTWW {
            detailWakeVC.configurator.configureScene(view: detailWakeVC,
                                                     interactor: interactor,
                                                     selectedIndex: selectedIndex)
                selectedIndex = nil
                
            } else
                if let selectVC = segue.destination as? SelectSceneViewController_BTWW,
                    let sourceVC = sourceVC as? MainSceneTableViewController_BTWW {
                    selectVC.modalPresentationStyle = .custom
                    selectVC.transitioningDelegate = customTransition
                    selectVC.setupSegueCallback { identifire in
                        switch identifire {
                        case 0:
                            sourceVC.performSegue(withIdentifier: "addNew" + String.init(describing: Dream.self), sender: nil)
                        case 1:
                            sourceVC.performSegue(withIdentifier: "addNew" + String.init(describing: Wake.self), sender: nil)
                        default:
                            print("Error! Input identifire \(identifire) cannot be recognized")
                        }
                    }
                    
                } else
                    if let calendarVC = segue.destination as? CalendarSceneViewController_BTWW {
                        calendarVC.configurator.configureScene(view: calendarVC,
                                                               interactor: interactor)
        }
    }
    
    
    func perform<V>(type: LifeCycle, vc: V) {
        guard let vc = vc as? MainSceneTableViewController_BTWW else { return }
        selectedIndex = type.index
        switch type {
        case _ where type is Dream:
            vc.performSegue(withIdentifier: "didSelect" + String.init(describing: Dream.self), sender: nil)
        case _ where type is Wake:
            vc.performSegue(withIdentifier: "didSelect" + String.init(describing: Wake.self), sender: nil)
        default:
            print("Error! Input type \(type) cannot be recognized")
        }
    }
    
    //    deinit {
    //        print("MainSceneRouter_BTWW - is Deinit!")
    //    }
}
