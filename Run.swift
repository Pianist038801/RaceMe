//
//  Run.swift
//  RaceMe
//
//  Created by Enoch Ng on 2016-06-15.
//  Copyright © 2016 Enoch Ng. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import RealmSwift

class Run : Object {
    
    //admin specific
    dynamic var trackName = ""
    dynamic var dateRan : NSDate?
    dynamic var areaLocation = ""
    //dynamic var trackImageURL: String?
    //dynamic var trackCreator : String?
    
    //run specifics
    dynamic var totalAveragePace = 0.0
    dynamic var totalTimeSeconds = 0.0
    let footPrints = List<TrackPoint>()
    dynamic var distanceRanInMetres = 0.0
    
    //isRace
    dynamic var isRace = false
    dynamic var ghostName = ""
    
    dynamic var endDistanceDifference = 0.0
    dynamic var endTimeDifference = 0.0
    
    
    func distanceRanInKilometres () -> Double {
        return distanceRanInMetres * 1000
    }

    func distanceRanInKilometresToString() -> String {
        return String(format: "%0.2f KM", self.distanceRanInKilometres())
    }
    
    //time functions
    func formattedTime() -> String{
        let hours = (totalTimeSeconds - totalTimeSeconds % 3600) / 3600
        let minutes = ((totalTimeSeconds - hours * 3600) - (totalTimeSeconds  - hours * 3600) % 60) / 60
        let seconds = (totalTimeSeconds  - hours * 3600 - minutes * 60)
        return zeroAdder(hours)+" : "+zeroAdder(minutes) + " : "+zeroAdder(seconds)
    }

    //formatting for time translation
    func zeroAdder(timeToString : Double) -> String{
        if(timeToString > 9){
            return String(format: "%0.0f", timeToString)
        } else {
            return String(format: "0%0.0f", timeToString)
        }
    }
}