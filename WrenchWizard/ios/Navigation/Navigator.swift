//
//  Navigator.swift
//  WrenchWizard
//
//  Created by Paris Makris on 3/3/24.
//

import Foundation
import Combine

class Navigator: ObservableObject {
    
    let directionSubject = PassthroughSubject<NavigationDirection, Never>()
    
    func sendCommand(_ command: NavigationCommand) {
        directionSubject.send(NavigationDirection(command: command))
    }
    
    func goBack(){
        sendCommand(.goBack)
        
    }
    
    func goToRoot(){
        sendCommand(.goToRoot)
    }
}


