//
//  ViewController.swift
//  tableViewPractice
//
//  Created by shillestad on 1/13/16.
//  Copyright © 2016 shillestad. All rights reserved.
//

import UIKit
//Bring in data source and delegate protocols for tableview
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var myTableView: UITableView!
    
    var superHeros = ["batman", "Superman", "Aquaman", "Wonderwomen","The Flash", "Spiderman"]
    var realName = ["Brue wanye","Clark kent","Arthur Curry","Diana","Barry Allen","Peter Paker"]
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Set table view datasource and delegate to view controller
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    
    @IBAction func addButtonTap(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Super Hero", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler{ (nameTextField) -> Void in
            nameTextField.placeholder = "Add Super Hero Name!"
        }
        myAlert.addTextFieldWithConfigurationHandler{ (nameAilasField) -> Void in
            nameAilasField.placeholder = "Add Ailas Hero Name!"
        }
        var cancelAction = UIAlertAction(title: "Canel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
         var addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superHeroTF = myAlert.textFields![0] as UITextField
            let ailasTF = myAlert.textFields![1] as UITextField
            self.superHeros.append(superHeroTF.text!)
            self.realName.append(ailasTF.text!)
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        

        //presents alertview
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    //required for tableView protocol- Sends data to cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //create a cell var for tableView
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        //Sets properties of cell text
        myCell.textLabel?.text = superHeros[indexPath.row]
        myCell.detailTextLabel?.text = realName[indexPath.row]
        
        return myCell
    }
    
    //Required for tableview protocol- sets # of rows in the tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superHeros.count
    }
    
    //allows you to delete a row from tableview
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superHeros.removeAtIndex(indexPath.row)
            realName.removeAtIndex(indexPath.row)
            //reload tableview data
            myTableView.reloadData()
        }
    }
    
    
    
    
    
    
    
    
    
    

}

