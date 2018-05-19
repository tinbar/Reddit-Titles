//
//  RedditTitlesViewControllerViewModel.swift
//  Reddit-Titles
//
//  Created by Atindra Ganeshen on 2018-05-16.
//  Copyright © 2018 Atindra Ganeshen. All rights reserved.
//

import UIKit
import Foundation

class RedditTitlesViewControllerViewModel {
    
    private var redditTitlesTableViewModel: RedditTitlesTableViewModel!
    
    init() {
        // Set up any initialization code
    }
    
    func setRedditTitlesTableView(redditTitlesTableView: UITableView!) {
        redditTitlesTableViewModel = RedditTitlesTableViewModel(tableView: redditTitlesTableView)
    }
}
