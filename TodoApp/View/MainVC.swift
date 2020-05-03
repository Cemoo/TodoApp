//
//  MainVC.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/3/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var todoTableView: UITableView!
    
    private var todos: [TodoItem] = []
    
    var viewModel: TodosViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TodosViewModel() //This can move in a AppRouter class
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
        case .showData:
            break
        default:
            break
        }
    }
    
    func navigate(_ route: TodoRoutes) {
        switch route {
        case .addnew:
            let destVC = DetailPageBuilder.make()
            self.navigationController?.pushViewController(destVC, animated: true)
        case .detail(let item):
            let destVC = DetailPageBuilder.make(item)
            self.navigationController?.pushViewController(destVC, animated: true)
        }
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoitemcell", for: indexPath)
        cell.textLabel?.text = "Test"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _ = todoTableView.cellForRow(at: indexPath) else {
            return
        }
        
        viewModel.editItem(with: TodoItem())
    }
}
