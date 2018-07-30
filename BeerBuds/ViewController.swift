//
//  ViewController.swift
//  BeerBuds
//
//  Created by Alex Saltstein on 7/29/18.
//  Copyright © 2018 Alex Saltstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var loadingView: UIView!
    @IBOutlet weak var beerView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLoadingScreen()
        
        //area where data is loaded into app
        
        
    }

    func showLoadingScreen(){
        loadingView.bounds.size.width = view.bounds.width
        loadingView.bounds.size.height = view.bounds.height
        loadingView.center = view.center
        loadingView.alpha = 0
        beerView.frame = CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(loadingView)
        UIView.animate(withDuration: 0.3, delay: 0.5, options: [], animations: {
            self.loadingView.alpha = 1
        }) { (success) in
            self.animateBeerMovement()
        }
    }
    
    func animateBeerMovement(){
        let height = view.bounds.height * -1
        UIView.animate(withDuration: 3, delay: 0.2, options: [], animations: {
            self.beerView.transform = CGAffineTransform(translationX: 0, y: height)
        }, completion: { (success) in
            self.hideLoadingScreen()
        })
    }
    
    func hideLoadingScreen(){
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: { 
            self.loadingView.alpha = 0
        })
    }
    
    func getData(){
        //temporary function to just represent a delay of getting data
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
