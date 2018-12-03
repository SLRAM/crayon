//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var crayons = Crayon.allTheCrayons
    
    override func viewDidLoad() {
    super.viewDidLoad()
        tableView.dataSource = self
  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexpath = tableView.indexPathForSelectedRow,
            let crayonDetailController = segue.destination as? CrayonDetailViewController else {fatalError("missing indexPath, CrayonDetailViewController")}
        let crayon = crayons[indexpath.row]
        crayonDetailController.crayon = crayon
    }
}

extension CrayonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CrayonCell", for: indexPath)
        let crayon = crayons[indexPath.row]
        if crayon.name == "Black" {
            
            cell.textLabel?.text = crayon.name
            cell.detailTextLabel?.text = crayon.hex
        }
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = crayon.color()
        return cell
    }
    
    
}
