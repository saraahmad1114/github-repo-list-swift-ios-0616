//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

let info = GithubAPIClient()

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories: [GithubRepository] = []
    //you created an array that contains objects of the GithubRepository
    
    //what are closures? -- Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.
    //completion() is a closure!!! Read the apple explanation on closures 
    
    func getRepositoriesWithCompletion(completion:() -> ())
    {
        GithubAPIClient.getRepositoriesWithCompletion {(tempArray) in
                self.repositories.removeAll()
            //you are removing all items in the array
            
            
            //then iterate over all the items in that array that contain objects of the type GithubRepository
                for git in tempArray
                {
                    let gitrepo = GithubRepository(dictionary: git as! NSDictionary)
                    self.repositories.append(gitrepo)
                }
            
            if self.repositories.count > 0
            {
                completion()
            }
            //if the repositories has items in it, you can go ahead and call the closure 
                
//                print(tempArray)
        }
        //empty because empty from the top 
        //you should call it here, because you want to check if you got anything back
        
        
        
    }

}
