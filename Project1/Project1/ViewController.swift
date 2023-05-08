//
//  ViewController.swift
//  Project1
//
//  Created by Brandon Johns on 4/19/23.
//

import UIKit

class ViewController: UITableViewController
{

    var pictures: [String] = []                                                             // array is created when the ViewController screen is created
                                                                                            // array exists as long as the screen exists
    
    override func viewDidLoad() {                                                           // override = chagne apples default behavior
        super.viewDidLoad()                                                                 // super means run Apples code before mine

        title = "Ellie Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let file_manger = FileManager.default                                               // file_manger = the value returned by Filemanger.default
        
        let path_image = Bundle.main.resourcePath!                                          //path_image = the resource path of the apps bundle
                                                                                            // bundle =  directory containing all the compiled progam and the assets
                                                                                            // where  can i find all the images added to my app
                                                                                            // force unwrapping is ok because if it fails the app isnt reading from its own files
                                                                        
        
        let images = try! file_manger.contentsOfDirectory(atPath: path_image)               // images = the contents of the directory from path_image
                                                                                            // images = array of strings that the names of the files
        
        for image in images.sorted()
        {
            
            if image.hasPrefix("Ellie")
            {
                
                pictures.append(image)
            }
        }
        
    }
                                                                                           
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {                                                                                        // returns Int of how many rows in the table
                                                                                             // _ tableView: UITableView
                                                                                                // _  = first paramter not being passed uintg a name
                                                                                                    // can be the name of the table being worked with if multiple tables
                                                                                               //tableView = name of the table view in the method
                                                                                                //UITableView = the data type
        
                                                                                            // numberOfRowsInSection section: Int
                                                                                                //numberOfRowsInSection = Action (how many rows)
                                                                                                // section: = how many ways to split up (how Contacts split up by names)
        return pictures.count
    }// how many rows
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {                                                                                       // returns UITableViewCell
                                                                                                // the return type is Picture created in Interface Builder
                                                                                            //cellForRowAt indexPath: IndexPath
                                                                                                //cellForRowAt provide a specific row
                                                                                                    // the row is indexPath
                                                                                                //IndexPath == Type which is section and row number
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
                                                                                            // rows move on and off the screen using dequeueResuableCell to save data
                                                                                            // cell == whats being dequeued
                                                                                            //      == whats being displayed
                                                                                            //"Picture" == the Cell name in Interface Builder
        
        cell.textLabel?.text = pictures[indexPath.row]
                                                                                            // cell is a textLabel Optional
                                                                                            // only show the cell if it exists
                                                                                            // pictures[indexPath.row]
                                                                                                // textlabel to be of the picture in the pictures array
                                                                                                // indexPath.row == row number being asked to load
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                                                                                            //loading "Detail" view controller and typecasting to DetailViewController
        if let view_controller = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController
        {                                                                                   // if let protects just incase of failure
                                                                                            //      stoyboard could not exist
                                                                                            //      "Detail" could be wrong name
                                                                                            //      DetailViewController oculd be the wrong viewcontroller)
                                                                                            
                                                                                            //"Detail" is the storyboard ID for the DetailViewController
            
            view_controller.selected_Image = pictures[indexPath.row]                        // sets selected_Image and its row
            view_controller.totalPictures = pictures.count                                  // passes picture count
            view_controller.selectedPictureNumber = indexPath.row + 1                           // passes the picture in place
                                                                                            
            navigationController?.pushViewController(view_controller, animated: true)       // put it on the nativation cotnroller
        }
    }
}

//["Ellie0", "Ellie1", "Ellie2", "Ellie3","Ellie4", "Ellie5", "Ellie6", "Ellie7","Ellie8", "Ellie9", "Ellie10", "Ellie11","Ellie12", "Ellie13", "Ellie14", "Ellie15","Ellie16", "Ellie17", "Ellie18", "Ellie19","Ellie20", "Ellie21", "Ellie22", "Ellie23","Ellie24", "Ellie25", "Ellie26", "Ellie27","Ellie28", "Ellie29", "Ellie30", "Ellie31","Ellie32", "Ellie33", "Ellie34", "Ellie35"]
