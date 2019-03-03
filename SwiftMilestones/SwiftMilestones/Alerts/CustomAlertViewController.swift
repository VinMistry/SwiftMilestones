//
//  CustomAlertViewController.swift
//  SwiftMilestones
//
//  Created by Vinesh Mistry on 24/10/2018.
//  Copyright © 2018 Vinesh Mistry. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertImageView: UIImageView!
    @IBOutlet weak var alertTitleTextLabel: UILabel!
    @IBOutlet weak var alertBodyTextLabel: UILabel!
    @IBOutlet weak var alertOkButton: UIButton!
    
    let alertTitle: String
    let alertText: String
    let alertImageName: String
    init(imageName: String, alertTitle: String, alertText: String) {
        self.alertTitle = alertTitle
        self.alertText = alertText
        self.alertImageName = imageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alertImageView.loadGif(name: alertImageName)
        alertTitleTextLabel.text = alertTitle
        alertBodyTextLabel.text = alertText
        
    }

    override func viewWillAppear(_ animated: Bool) {
        setupView()
        animateView()
    }
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        alertView.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func animateView() {
        alertView.alpha = 0;
        self.alertView.frame.origin.y = self.alertView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.alertView.alpha = 1.0;
            self.alertView.frame.origin.y = self.alertView.frame.origin.y - 50
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

