//
//  MainVC.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/3/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController {

    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var todoTableView: UITableView!
    
    private var todos: [NSManagedObject] = [] {
        didSet {
            self.todoTableView.reloadData()
        }
    }
    
    var viewModel: TodosViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
       viewModel.getItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    fileprivate func setUI() {
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
    
    @IBAction func addAction(_ sender: Any) {
        viewModel.addNewItem()
    }
}

extension MainVC: TodosViewModelDelegate {
    func handle(_ output: TodosOutput) {
        switch output {
        case .showData(let items):
            self.todos = items
        default:
            break
        }
    }
    
    func navigate(_ route: TodoRoutes) {
        switch route {
        case .addnew:
            let destVC = DetailPageBuilder.make()
            destVC.viewModel.type = .save
            self.navigationController?.pushViewController(destVC, animated: true)
        case .detail(let item):
            let destVC = DetailPageBuilder.make(item)
            destVC.viewModel.type = .update
            self.navigationController?.pushViewController(destVC, animated: true)
        }
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoitemcell", for: indexPath)
        let todoItem = self.todos[indexPath.row]
        if let name = todoItem.value(forKey: "name") as? String {
            cell.textLabel?.text = name
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: title,
                                        handler: { (action, view, completionHandler) in
             let id = self.todos[indexPath.row].value(forKey: "id") as! String
             self.viewModel.delete(for: id)
             completionHandler(true)
        })

        action.title = "Delete"
        action.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.todos[indexPath.row]
        
        viewModel.editItem(with: item)
    }
}
