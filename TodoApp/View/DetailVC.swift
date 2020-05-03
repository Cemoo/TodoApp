//
//  DetailVC.swift
//  TodoApp
//
//  Created by Cemal BAYRI on 5/3/20.
//  Copyright © 2020 Cemal BAYRI. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var viewModel: DetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setInitials()
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        nameTextField.becomeFirstResponder()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let item = Todo(name: nameTextField.text ?? "", id: UUID().uuidString, state: false)
        viewModel.save(item)
    }
    
    fileprivate func setUI() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

extension DetailVC: DetailViewModelDelegate {
    func handle(_ output: DetailOutput) {
        switch output {
        case .showError(let text):
            let alert = UIAlertController(title: "", message: text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        case .updateButtonTitle(let text):
            self.saveButton.setTitle(text, for: .normal)
        case .fillName(let text):
            self.nameTextField.text = text
        case .setPageTitle(let text):
            self.title = text
        }
    }
    
    func navigate(_ route: DetailRoutes) {
        switch route {
        case .backtomain:
            self.navigationController?.popViewController(animated: true)
        }
    }
}
