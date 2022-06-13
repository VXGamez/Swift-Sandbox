//
//  ViewController.swift
//  I Am Rich
//
//  Created by Victor Xirau on 8/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moreInfo: UIImageView!
    @IBOutlet weak var centerImage: UIImageView!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    var index=1;

    
    override func viewDidLoad() {
        super.viewDidLoad()
        index = 1;
    }
    
    @IBAction func onTap(_ sender: Any) {
        centerImage.image = UIImage(named: "img-\(index)");
        index+=1;
        if index == 8 {
            index = 1;
        }
    }

    @IBAction func onTapInfo(_ sender: UITapGestureRecognizer) {
        guard let vc = storyboard?.instantiateViewController(identifier: "segona") as? SecondaryViewController else{
            print("error")
            return;
        }
        
        present(vc, animated: true)
        
        
    }
    
    
}

