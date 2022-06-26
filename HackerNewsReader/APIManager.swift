//
//  APIManager.swift
//  HackerNewsReader
//
//  Created by Rashad Philizaire on 6/25/22.
//

import Foundation
import FirebaseCore
import FirebaseDatabase
import SwiftyJSON

class APIManager : NSObject {
    static let sharedManager = APIManager()
    static let apiURL = "https://hacker-news.firebaseio.com"
    static let baseURL = "https://news.ycombinator.com"
    
    static let getItemByIdEndpoint = "/v0/item/"
    static let getUserByNameEndpoint = "/v0/user/"
    static let getTopStoriesEndpoint = "/v0/topstories/"
    static let getBestStoriesEndpoint = "/v0/beststories/"
    
    let ref = Database.database(url: apiURL).reference()
    
    // returns list of story ids
    func getTopStories(onSuccess: @escaping([Int]) -> Void, onFailure: @escaping(Error) -> Void){
        
        self.ref.child(APIManager.getTopStoriesEndpoint).getData(completion: { error, snapshot in
          guard error == nil else {
              onFailure(error!)
              return
          }
            let result = snapshot?.value ?? "Unknown"
            let storyIdArray = result as? [Int] ?? []
            onSuccess(storyIdArray)
            
//            let storyArray = Story.storiesWithIdArray(idArray: storyIdArray)
//            onSuccess(storyArray)
        });
    }
    
    func getItemById(itemId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        
        self.ref.child(APIManager.getItemByIdEndpoint + String(itemId)).getData(completion: { error, snapshot in
          guard error == nil else {
              onFailure(error!)
              return
          }
            let result = snapshot?.value ?? "Unknown"
            onSuccess(JSON(result as? NSDictionary ?? NSDictionary()))
        });
    }
    
}
