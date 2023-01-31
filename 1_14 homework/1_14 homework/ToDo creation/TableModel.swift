//
//  TableModel.swift
//  1_14 homework
//
//  Created by Павел Замулин on 01.03.2022.
//

import Foundation

var toDoDataRealm: [String] = []
var toDoDataCD: [String] = []


func addNote(database: inout [String], note: String) {
    database.append(note)
}

func deleteNote(database: inout [String], at index: Int){
    database.remove(at: index)
}

func saveInRealm(){
    PersistanceRealm.shared.saveData(data: toDoDataRealm)
}

func loadFromRealm(){
    PersistanceRealm.shared.loadData(data: &toDoDataRealm)
}

func saveInCD(){
    PersistanceCoreData.shared.saveInData(data: toDoDataCD)
}

func loadFromCD(){
    PersistanceCoreData.shared.loadFromData(data: &toDoDataCD)
}
