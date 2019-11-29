//
//  FieldObservationsViewController.swift
//  Field Survey
//
//  Created by Travis Agne on 11/29/19.
//  Copyright © 2019 Travis Agne. All rights reserved.
//

import UIKit

class FieldObservationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dateFormatter = DateFormatter()
    
    var fieldObservations: FieldObservations?
    
    let jsonFileName = "field_observations"
    
    @IBOutlet weak var fieldObservationsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        fieldObservations = FieldObservationsLoader.load(jsonFileName: jsonFileName)
        
        if fieldObservations == nil {
            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
        }

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldObservations?.observations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fieldObservationsTableView.dequeueReusableCell(withIdentifier: "fieldObservationCell", for: indexPath)
        
        if let cell = cell as? FieldObservationTableViewCell,
            let fieldObservation = fieldObservations?.observations[indexPath.row]{
            
            cell.observationIconImageView.image = UIImage(named: fieldObservation.classification.rawValue)
            
            cell.dateLabel.text = dateFormatter.string(from: fieldObservation.date)
            cell.titleLabel.text = fieldObservation.title
        }
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ObservationDetailsViewController,
            let selectedIndexPath = fieldObservationsTableView.indexPathForSelectedRow {
            destination.fieldObservation = fieldObservations?.observations[selectedIndexPath.row]
        }
    }
    
    func presentMessage(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
