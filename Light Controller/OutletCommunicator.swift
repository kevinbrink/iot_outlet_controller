//
//  OutletCommunicator.swift
//  Light Controller
//
//  Created by Kevin Brink on 2017-05-04.
//  Copyright © 2017 Kevin Brink. All rights reserved.
//

import Foundation

class OutletCommunicator {
    static func sendSignal(_ serverUrl: String, _ outletNum: Int, _ action: ActionType, _ success: @escaping((String, String) -> ()), _ failure: @escaping((String, String) -> ())) {
        let url: URL = URL(string: "\(serverUrl)/outlets/\(outletNum)/\(action.rawValue)")!
        var request:URLRequest = URLRequest(url:url as URL)
        request.httpMethod = "POST"
        // Create the class, using the "trailing closure" technique; the closure
        // IS STILL AN ARGUMENT!
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            // Do we have an error?
            if (error != nil) {
                do {
//                    let urlError = error as! URLError
//                    let urlString = urlError.failureURLString!
//
//                    let nsUrlString = (urlString as NSString)
//                    let range = NSMakeRange(0, nsUrlString.length)
//
//                    let regex = try NSRegularExpression(pattern: "([^/]+)/([^/]+)$", options: [])
//
//                    let matches = regex.matches(in: urlString, range: range)
//
//                    let outletNumber = nsUrlString.substring(with: matches[0].rangeAt(1))
//                    let action = nsUrlString.substring(with: matches[1].rangeAt(1))

                    failure("", "")
                }
                catch {
                    failure("", "")
                }
            } else {
                // Successful request
                print ("Successfully performed request!")
                success("","")
            }
        }

        // Alternative method of passing the closure, without the trailing
        // closure magic
//        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
//            print(data ?? "No Data")
//            print(response ?? "No response")
//            print(error ?? "No Error")
//            // Do we have an error?
//            if (error != nil) {
//
//            }
//        })
        task.resume()
        failure("", "")
    }
}
