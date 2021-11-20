//
//  OpenSkyStatus.swift
//  OpenSkyUtah
//
//  Created by Chris Young on 11/20/21.
//

import Foundation


class OpenSkyService: ObservableObject {
    @Published var aircraftStates: [AircraftState] = []
    
    func changeCallSignVisibility(visibility: Bool, aircraftState: AircraftState) {
        if let index = aircraftStates.firstIndex { $0.id == aircraftState.id } {
            aircraftStates[index].callsignIsVisible = visibility
        }
    }
    
    func refreshStatus() {
        let session = URLSession.shared
        
        if let url = URL(string: Utah.urlString) {
            let task = session.dataTask(with: url) { [self] data, response, error in
                if let dataObject = data, error == nil {
                    update(from: dataObject)
                }
            }
            task.resume()
        }
    }
    
    private func update(from data: Data) {
        DispatchQueue.main.async { [self] in
            aircraftStates = []
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let states = json["states"] as? [[Any]] {
                    states.forEach { state in
                        aircraftStates.append(AircraftState(from: state))
                    }
                }
            }
        }
    }
}
