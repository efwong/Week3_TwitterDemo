//
//  Tweet.swift
//  TwitterDemo
//
//  Created by Edwin Wong on 10/29/16.
//  Copyright © 2016 edwin. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: String?
    var timeStamp: Date?
    var retweetCount: Int = 0
    var favoriteCount: Int = 0
    var user: User?
    var idStr: String
    var isRetweeted: Bool
    var isFavorited: Bool
    
    init(dictionary: NSDictionary){
        text = dictionary["text"] as? String
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoriteCount = (dictionary["favorite_count"] as? Int) ?? 0
        idStr = (dictionary["id_str"] as? String)!
        
        isRetweeted = (dictionary["retweeted"] as? Bool) ?? false
        isFavorited = (dictionary["favorited"] as? Bool) ?? false
        
        if let timeStampString = dictionary["created_at"] as? String{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E MMM d HH:mm:ss Z yyyy"
            timeStamp = dateFormatter.date(from: timeStampString)
        }
        
        if let userDict = (dictionary["user"] as? NSDictionary){
            self.user = User(dictionary: userDict)
        }
    }
    
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]();
        
        for dictionary in dictionaries{
            let curTweet = Tweet(dictionary: dictionary)
            tweets.append(curTweet)
        }
        
        return tweets
    }
    
}
