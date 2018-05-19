//
//  BaseTableViewModel.swift
//  Reddit-Titles
//
//  Created by Atindra Ganeshen on 2018-05-16.
//  Copyright © 2018 Atindra Ganeshen. All rights reserved.
//

import Foundation
import UIKit

protocol BaseTableViewModelDelegate {
    func didSelectIndexPath(indexPath: IndexPath, with object: Any?)
}

class BaseTableViewModel: NSObject {
    fileprivate var tableView: UITableView!
    
    var viewModelDelegate: BaseTableViewModelDelegate!
    
    init(tableView: UITableView!) {
        self.tableView = tableView
        super.init()
        setTableViewDelegate(delegate: self)
        setTableViewDataSource(dataSource: self)
        registerDefaultCells()
        setDefaultTableFooterView()
        setDefaultRowHeights()
    }
    
    func setTableViewDelegate(delegate: UITableViewDelegate) {
        tableView.delegate = delegate
    }
    
    func setTableViewDataSource(dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
    }
    
    func setDefaultTableFooterView(tableFooterView: UIView? = nil) {
        tableView.tableFooterView = tableFooterView
    }
    
    func setDefaultRowHeights(height: CGFloat = UITableViewAutomaticDimension) {
        tableView.estimatedRowHeight = height
        tableView.rowHeight = height
    }
    
    func registerDefaultCells() {
    }
    
}

// Table View Delegate
extension BaseTableViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModelDelegate?.didSelectIndexPath(indexPath: indexPath, with: nil)
    }
}

// Table View Data Source
extension BaseTableViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

