//
//  Persistance.swift
//  1_14 homework
//
//  Created by Павел Замулин on 28.02.2022.
//

import Foundation

class PersistanceUD {
    
    static let shared = PersistanceUD()
    
    private let kUserNameKey = "PersistanceUD.kUserNameKey"
    private let kUserLastNameKey = "PersistanceUD.kUserLastNameKey"
    
    var userName: String{
        set { UserDefaults.standard.set(newValue, forKey: kUserNameKey) }
        get { return UserDefaults.standard.string(forKey: kUserNameKey) ?? "" }
    }
    
    var userLastName: String{
        set { UserDefaults.standard.set(newValue, forKey: kUserLastNameKey) }
        get { return UserDefaults.standard.string(forKey: kUserLastNameKey) ?? "" }
    }
}

