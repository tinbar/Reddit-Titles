//
//  RedditTitlesViewController.swift
//  Reddit-Titles
//
//  Created by Atindra Ganeshen on 2018-05-16.
//  Copyright © 2018 Atindra Ganeshen. All rights reserved.
//

import UIKit

class RedditTitlesViewController: UIViewController {

    @IBOutlet weak var redditTitlesTableView: UITableView!
    
    private var viewModel: RedditTitlesViewControllerViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Reddit Titles"
        viewModel = RedditTitlesViewControllerViewModel()
        viewModel.setRedditTitlesTableView(redditTitlesTableView: redditTitlesTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
