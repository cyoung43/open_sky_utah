//
//  OpenSkyStatus.swift
//  OpenSkyUtah
//
//  Created by Chris Young on 11/20/21.
//

import Foundation


class OpenSkyService: ObservableObject {
    @Published var aircraftStates: [AircraftState] = []
    
    func refreshStatus() {
        let session = URLSession.shared
        
        if let url = URL(string: Utah.urlString) {
            let task = session.dataTask(with: url) { data, response, error in
                if let dataObject = data, error == nil {
                    if let json = try? JSONSerialization.jsonObject(with: dataObject, options: []) as? [String: Any] {
                        if let states = json["states"] as? [[Any]] {
                            print(states)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
