//
//  LHHttpUtils.swift
//  NoteDemo
//
//  Created by Hao's iMac on 2019/6/14.
//  Copyright © 2019 Hao's iMac. All rights reserved.
//

import Foundation

class LHHttpUtils {
    
    typealias completeHandler = ([String: Any], NSError) -> Void
    
    static let shared = LHHttpUtils()
    private init (){}
    
    func httpGet(_ url: URL, parameter: [String: Any], complete: completeHandler) {
        
        let dataTask: URLSessionDataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
        }
        dataTask.resume()
    }
    
    func httpPost(url: NSURL, parameter: [String: Any], complete: completeHandler) {
        
    }
    
}

