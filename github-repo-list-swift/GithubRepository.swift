//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var fullName: NSString?
    var htmlURL: NSURL?
    var repositoryID: NSString?
    
    init(dictionary: NSDictionary)
    {
        //ANOTHER WAY!!!!!!
//        let dictName = dictionary["full_name"] as? NSString
//        if let newName = dictName{
//            print(newName)
//            self.fullName = newName
//            print(self.fullName)
//        }
//        else { print("please work"); return}
        
        guard let
        firstName = dictionary["full_name"] as? NSString
        else
        {
            print("Please work")
            fatalError()
        }
        self.fullName = firstName
        
        
        guard let
            valueAsString = dictionary["html_url"] as? String,
            value = NSURL(string: valueAsString)
            else {print("You have an error"); fatalError()}
        
        self.htmlURL = value
        
        
        
//        let repoID = (dictionary["id"]) as? NSString
//        if let repID = repoID
//        {
//        print(repID)
//        self.repositoryID = repID
//        }
//        else { print("please work"); return}
        guard let
        valueAsNumber = dictionary["id"] as? NSNumber
            else {print("Please work"); fatalError()}
        self.repositoryID = valueAsNumber.stringValue
        
        //guard let repoID = dictionary["id"] as? NSString else {print("Please work"); fatalError()}
        //self.repositoryID = repID
    }
    
}
