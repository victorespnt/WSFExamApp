//
//  File.swift
//  ExamApp
//
//  Created by Victor Espinet on 10/06/16.
//  Copyright © 2016 Web School Factory. All rights reserved.
//

import Foundation
import Alamofire

struct Character {
    
    //name, height, hair color,
    let name: String
    let height: Int
    let hairColor: String
    let skinColor: String
    let gender: String
}

////Constructeur prenant en entrée un Dictionary
init(dict: Dictionary<String, AnyObject>) {
    
    //Les infos de base
    name = dict["name"] as! String
    height = dict["height"] as! Int
    hairColor = dict["hairColor"] as! String
    skinColor = dict["skinColor"] as! String
}

//MARK: Remote functions
extension Comic {
    static func getRemoteComics(offset: Int, completionHandler: Response<AnyObject, NSError> -> Void) {
        let apiKey = ""
        let ts = "testtest"
        let hash = ""
        
        let param: [String : AnyObject] = ["apikey" : apiKey, "hash" : hash, "ts" : ts, "offset" : offset]
        
        Alamofire.request(.GET, "http://swapi.co/api/people/", parameters: param).responseJSON { response in
            
            //map [JSON] -> [Character]
            //crée un nouveau Result<[Character], Error>
            
            completionHandler(response)
        }
    }
}