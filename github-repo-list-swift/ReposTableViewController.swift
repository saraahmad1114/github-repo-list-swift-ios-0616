//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    var store = ReposDataStore.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"
        store.getRepositoriesWithCompletion {
            NSOperationQueue.mainQueue().addOperationWithBlock(){
                self.tableView.reloadData()
                //because we are changing stuff in the UI, we have to make sure to put it on the main thread, UI stuff always should be on the main thread hence we are doing that here!
            }
        }
    }

    // MARK: - Table view data source
    
    

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
    }
        
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.count
    }
    
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexpath: NSIndexPath) -> UITableViewCell
    {
       let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexpath)
        
        
        //guard let url = githubURL else { print("error getting the URL"); return }
        
        let repos = store.repositories
        let singleRepo = repos[indexpath.row]
        let name = singleRepo.fullName
        
        if let unwrappedName = name{
            
        cell.textLabel!.text = unwrappedName as String
            
        }
        //guard let newName = store.repositories[indexpath.row].fullName else { print("Finally"); return}
        
        return cell
    }
 

    
}
