//
//  Track.swift
//  RaceMe
//
//  Created by Enoch Ng on 2016-06-17.
//  Copyright © 2016 Enoch Ng. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import RealmSwift

class Track : Object {
    
    //admin specifics
    dynamic var trackCreator = ""
    dynamic var trackLocation = ""

    //track specifics
    let trackPoints = List<TrackPoint>()
    dynamic var totalDistanceMetres = 0.0
    
    //session runs at track
    let runs = List<Run>()

    
    
    //track functions
    func totalDistanceKilometres () -> Double {
        return totalDistanceMetres * 1000
    }
    
    func TotalDistanceKilometresToString() -> String {
        return String(format: "%0.2f KM", self.totalDistanceKilometres())
    }
    
    func TotalDistanceMetresToString() -> String {
        return String(format: "%0.0f Metres ",totalDistanceMetres)
    }
    
    func maxAltitude() -> CLLocationDistance {
        return 0.0
    }
    
    func minAltitude() -> CLLocationDistance {
        return 0.0
    }
    
    
    
    //checkPoint functions
    func startPointAsCLLocation() -> CLLocation{
        return trackPoints.first!.trackPointToCLLocation()
    }
    
    func startPointAsCLLocationCoordinate2D() -> CLLocationCoordinate2D{
        return trackPoints.first!.trackPointToCLLocationCoordinate2D()
    }
    
    func endPointAsCLLocation() -> CLLocation{
        return trackPoints.last!.trackPointToCLLocation()
    }
    
    func endPointAsCLLocationCoordinate2D() -> CLLocationCoordinate2D{
        return trackPoints.last!.trackPointToCLLocationCoordinate2D()
    }
    
    
    
    //run functions
    func fastestRecord(){
    
    }
    
}