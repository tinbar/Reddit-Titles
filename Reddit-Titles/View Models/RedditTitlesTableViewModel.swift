//
//  RedditTitlesTableViewModel.swift
//  Reddit-Titles
//
//  Created by Atindra Ganeshen on 2018-05-16.
//  Copyright © 2018 Atindra Ganeshen. All rights reserved.
//

import UIKit
import Foundation

class RedditTitlesTableViewModel: BaseTableViewModel {
    
    private let networkManager = NetworkManager.shared()
    fileprivate var redditTitles: [String] = [] // TODO: Make this a model
    
    fileprivate let tableRowHeight: CGFloat = 22.0
    
    override init(tableView: UITableView!) {
        super.init(tableView: tableView)

        let redditTitleTableViewCellIdentifier = RedditTitleTableViewCell.stringIdentifier
        let nib = UINib(nibName: redditTitleTableViewCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: redditTitleTableViewCellIdentifier)

        tableView.separatorStyle = .none
        
        // Make a request and get a reference to it incase we want to cancel or do anything else
        // with the request
        // Replace `_` with `request` or desired variable name
        let _ = NetworkManager.shared().requestRedditTitles { (titles, error) in
            guard error == nil, titles != nil else { return }
            self.redditTitles = titles!
            tableView.reloadData()
        }
    }
}

// Table View Data Source
extension RedditTitlesTableViewModel {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return redditTitles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RedditTitleTableViewCell.stringIdentifier, for: indexPath) as? RedditTitleTableViewCell else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
        configureRedditTitlesTableViewCell(cell: cell, at: indexPath)
        return cell
    }
}

// Table View Delegate
extension RedditTitlesTableViewModel {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableRowHeight
    }
}

// Cell Configuration
extension RedditTitlesTableViewModel {

    fileprivate func configureRedditTitlesTableViewCell(cell: RedditTitleTableViewCell, at indexPath: IndexPath) {
        cell.redditTitleLabel.text = titleForLabelAtIndexPath(indexPath: indexPath)
    }
    
    // Not marked as private since this is a method that should be accessible for testing
    func titleForLabelAtIndexPath(indexPath: IndexPath) -> String? {
        guard indexPath.row >= 0 && indexPath.row < redditTitles.count else { return nil }
        return redditTitles[indexPath.row]
    }
    
}
