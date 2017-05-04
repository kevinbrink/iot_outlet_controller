//
//  OutletCommunicator.swift
//  Light Controller
//
//  Created by Kevin Brink on 2017-05-04.
//  Copyright © 2017 Kevin Brink. All rights reserved.
//

import Foundation

class OutletCommunicator {
    static func sendSignal(_ serverUrl: String, _ outletNum: Int, _ action: ActionType) {
        let url: URL = URL(string: "\(serverUrl)/outlets/\(outletNum)/\(action.rawValue)")!
        var request:URLRequest = URLRequest(url:url as URL)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            print(data ?? "No Data")
            print(response ?? "No response")
            print(error ?? "No Error")
        }
        task.resume()
    }
}
