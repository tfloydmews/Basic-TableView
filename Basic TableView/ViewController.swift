//
//  ViewController.swift
//  Basic TableView
//
//  Created by Taylor on 2/21/17.
//  Copyright © 2017 Taylor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var cars: [String] = ["HONDA", "TOYOTA", "AUDI", "BMW", "SUBARU"]
    var cars2: [String] = ["DODGE", "FORD", "CHEVROLET", "BUICK", "CADILLAC"]
    @IBAction func updateTable(_ sender: UIButton) {
        if let txt = textField.text{
            let split = txt.components(separatedBy: ",")
            let sect = split [0]
            let data = split [1]
            switch (Int(sect)) {
            case 1?:
                cars.append(data)
                tableView.beginUpdates()
                tableView.insertRows(at: [IndexPath(row: cars.count-1, section: 0)], with: . automatic)
                tableView.endUpdates()
            case 2?:
                cars2.append(data)
                tableView.beginUpdates()
                tableView.insertRows(at: [IndexPath(row: cars2.count-1, section: 1)], with: . automatic)
                tableView.endUpdates()
            default: break
            }
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        switch(section) {
        case 0: return "Foreign"
        case 1: return "American"
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var size = 0
        if section == 0 {
            size = cars.count
        }
        if section == 1 {
            size = cars2.count
        }
        return size
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "UICell")
        if indexPath.section == 0 {
            cell.textLabel?.text = cars[indexPath.row]
        }
        if indexPath.section == 1 {
            cell.textLabel?.text = cars2[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            switch (indexPath.section) {
            case 0:
                cars.remove(at: indexPath.row)
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
                tableView.endUpdates()
            case 1:
                cars2.remove(at: indexPath.row)
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
                tableView.endUpdates()
            default: break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

