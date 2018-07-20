//
//  ServerRequest.swift
//  COCChats
//
//  Created by Mohit Kumar on 20/07/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import Foundation

class ServerRequest{
    
    class func performGetRequest(url:String,accessToken:String,params:[String:String]){
        let urlComp = NSURLComponents(string: url)!
        
        var items = [URLQueryItem]()
        
        for (key,value) in params {
            items.append(URLQueryItem(name: key, value: value))
        }
        
        items = items.filter{!$0.name.isEmpty}
        
        if !items.isEmpty {
            urlComp.queryItems = items
        }
      
        let access_token = accessToken
        
        var urlRequest = URLRequest(url: urlComp.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest) {data, response, err in
            do{
                let JSON = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                print(JSON)
            }
            catch {
                print("json error: \(error)")
            }
        }
        
        task.resume();
    }
}
