//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
//goal- identify the optionals and unwrap all of them using guard let

//this is where all the calls to the API are done
//And always a good idea to break them up, for organization
class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completion:(NSArray)-> ())
    {
        
//        let tempArray = []
        
        //creating a session
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let githubURL = NSURL(string:"https://api.github.com/repositories?client_id=\(clientID)&client_secret=\(secret)")
        guard let url = githubURL else { print("error getting the URL"); return }
        
        
        
        
        //NSURL is an optional hence you should not proceed without unwrapping it properly
        //you can use the guard let to always unwrap anywhere!
        
        
        //data = the actual data in the form of all the html stuff 
        //response = whether you recieved the data or not
        //error = an error
        //data task = can be resumed, paused, or suspended..and starts off as suspend hence we have to resume
        //"in's" in a closure 
        //its a separater between parameters, and the rest of what you are doing, basically a divider
        let githubTask = session.dataTaskWithURL(url, completionHandler: {(data, response, error) in
            if let data = data {
                do {
                    let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSArray
                    //you are casting as array because thats what you will be getting back an array from the top function signature line 
                    completion(responseData)
                }
                    
                //if an error is thrown and this will take care of the error, and you can use guard
                catch
                {
                    print("This failed")
                }
            }
            
        })
        
        githubTask.resume()
        
        
        
    }
    
}

