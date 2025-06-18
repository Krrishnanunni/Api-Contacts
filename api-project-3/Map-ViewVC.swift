//
//  Map-ViewVC.swift
//  api-project-3
//
//  Created by iroid on 18/06/25.
//

import UIKit
import MapKit

class Map_ViewVC: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var segmentctrl: UISegmentedControl!
    
    let mapCamera = MKMapCamera()
    var location:CLLocationCoordinate2D!
    var region:MKCoordinateRegion!
    var span:MKCoordinateSpan!
    var zlong = 0.005
    var zlat = 0.005
    
    var passedLat       = ""
    var passedLong      = ""
    var passedStreet    = ""
    var passedCity      = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = passedCity
        map.camera = mapCamera
        map.mapType = .standard
        location = CLLocationCoordinate2D(latitude: Double(passedLat)!, longitude:  Double(passedLong)!)
        
        span = MKCoordinateSpan(latitudeDelta: zlat, longitudeDelta: zlong)
        
        region = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = passedStreet
        annotation.subtitle = passedCity
        map.addAnnotation(annotation)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func zoomDown(_ sender: Any) {
        
        zlat += 0.002
        zlong += 0.002
        
        span = MKCoordinateSpan(latitudeDelta: zlat, longitudeDelta: zlong)
        region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        
        
    }
    
    
    @IBAction func ZoomIn(_ sender: Any) {
        
        zlat -= 0.002
        zlong -= 0.002
        
        span = MKCoordinateSpan(latitudeDelta: zlat, longitudeDelta: zlong)
        region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
    }
    
    
    
    @IBAction func changemapType(_ sender: Any) {
        switch segmentctrl.selectedSegmentIndex{
        case 0:
            map.mapType = .standard
        case 1:
            map.mapType = .satellite
        default:
            break
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
