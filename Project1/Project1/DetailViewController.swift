//
//  DetailViewController.swift
//  Project1
//
//  Created by Brandon Johns on 4/19/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selected_Image: String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selected_Image
        navigationItem.largeTitleDisplayMode = .never
        
        if let image_to_load = selected_Image
        {
            imageView.image = UIImage(named: image_to_load)
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
