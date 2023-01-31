//
//  PersistanceRealm.swift
//  1_14 homework
//
//  Created by Павел Замулин on 01.03.2022.
//

import Foundation
import RealmSwift

class Notes: Object {
    @objc dynamic var text = ""
}

class PersistanceRealm {
    
    static let shared = PersistanceRealm()
    private let realm = try! Realm()
    
    func saveData(data: [String]) {
        try! realm.write {
            realm.deleteAll()
        }
        for (_,item) in data.enumerated() {
            let note = Notes()
            note.text = item
            try! realm.write {
                realm.add(note)
            }
        }
    }
    func loadData(data: inout [String]) {
        let notes = realm.objects(Notes.self)
        for note in notes{
            data.append(note.text)
        }
    }
}

