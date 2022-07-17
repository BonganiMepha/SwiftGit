//
//  Utilities.swift
//  StudentPortal
//
//  Created by IACD-02 on 2022/07/14.
//


import Foundation
import UIKit
// This class holds  alerts

class Utilities {
    
    func ShowAlert (title: String, message: String, vc: UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    func GetDate () -> String {
        
        let today: Date = Date()
        let dataFormatter: DateFormatter = DateFormatter()
        
        dataFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        return dataFormatter.string(from: today)
    }
}

