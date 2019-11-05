//
//  ViewController.swift
//  searchBar_Practice
//
//  Created by Javier Porras jr on 11/5/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var groceries = [
        "pizza",
        "bananas",
        "apples",
        "milk",
        "cheese",
        "bread"
    ]
    var filteredGroceries = [String]()
    
    var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        navigationController?.navigationBar.barTintColor = .darkGray
        configureSearchBarButton()
    }
    @objc func showSearchBar(){
        print("Configuring Search Bar")
        configureSearchBar(shouldShow: true)
    }
    func configureSearchBar(shouldShow: Bool) {
        if shouldShow{
            searchBar = UISearchBar()
            searchBar.delegate = self
            searchBar.sizeToFit()
            searchBar.showsCancelButton = true
            searchBar.becomeFirstResponder()
            searchBar.tintColor = .white
            
            navigationItem.rightBarButtonItem = nil
            navigationItem.titleView = searchBar
        }else{
            navigationItem.titleView = nil
            configureSearchBarButton()
        }
    }
    func configureSearchBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
}


// MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        configureSearchBar(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" || searchBar.text == nil {
            view.endEditing(true)
        } else {
            filteredGroceries = groceries.filter({ $0.range(of: searchText.lowercased()) != nil })
            print(filteredGroceries)
        }
    }
}
