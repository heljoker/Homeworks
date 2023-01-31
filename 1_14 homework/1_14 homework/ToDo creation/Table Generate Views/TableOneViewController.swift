//
//  TableOneViewController.swift
//  1_14 homework
//
//  Created by Павел Замулин on 28.02.2022.
//

import UIKit

class TableOneViewController: UIViewController {
    
    @IBOutlet var tableViewOne: UITableView!
    
    @IBAction func addNewNoteButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Создание заметки", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Введите заметку"
        }
        let alertAction1 = UIAlertAction(title: "Создать", style: .cancel) { (alert) in
            guard let textOfNewNote = alertController.textFields![0].text else {return}
            addNote(database: &toDoDataRealm, note: textOfNewNote)
            saveInRealm()
            self.tableViewOne.reloadData()
        }
        let alertAction2 = UIAlertAction(title: "Отмена", style: .default) { (alert) in }
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromRealm()
        tableViewOne.reloadData()
    }

}

extension TableOneViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoDataRealm.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath) as! TableViewCell
        cell.textLabel?.text = toDoDataRealm[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableCell(withIdentifier: "footerCellOne") as! TableViewCell
        return footer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if  editingStyle == .delete {
            deleteNote(database: &toDoDataRealm, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
            saveInRealm()
            tableView.reloadData()
        }
    }
}
