//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Erkan Emir on 12.12.22.
//

import UIKit

class ListView: UITableViewController {
    
    var textfield = UITextField()
    
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updating()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell")
        cell?.textLabel?.text = viewModel.array[indexPath.row].message
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteData(index: indexPath.row)
            updating()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        showAlert(title: "Enter ", message: "", actionButtonTitle: "OK", cancelButtonTitle: "CANCEL", placeholder: "ALMA") { text in
            
            self.viewModel.changeData(index: indexPath.row, message: text)
            self.updating()
        }
    }
    
    fileprivate func updating() {
        viewModel.fetchData()
        tableView.reloadData()
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        showAlert(title: "Daxil edin", message: "", actionButtonTitle: "OK", cancelButtonTitle: "CANCEL", placeholder: "Enter the text") { text in
                        
            if !text.isEmpty {
                self.viewModel.saveData(message: text)
                self.updating()
                
            }
        }
    }
}
