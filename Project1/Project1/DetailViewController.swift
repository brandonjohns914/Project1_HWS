//
//  DetailViewController.swift
//  Project1
//
//  Created by Brandon Johns on 4/19/23.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedPictureNumber = 0
    var totalPictures = 0
    
    @IBOutlet var imageView: UIImageView!
                                                                                //@IBOutlet == connection between code and interface builder
                                                                                // imageView: name of the UIImageView from IB
                                                                                // UIImageView! = delcaring property of UIIMageView
                                                                                //                force unwrapped 
    
    var selected_Image: String?                                                 // selected image might exist or might not 
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "this image is \(selectedPictureNumber) of \(totalPictures)"                                // title to be shown
        navigationItem.largeTitleDisplayMode = .never                            // title is smaller than on the main page
        
        if let image_to_load = selected_Image                                   // checks and unwraps selected_Image
        {                                                                       // if nil imageView.Image will never run
            
            imageView.image = UIImage(named: image_to_load)
                                                                                // imageView.image exists then place it into image_to_load then pass it to the UIImage
        }
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
