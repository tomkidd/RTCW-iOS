//
//  OptionsViewController.swift
//  Quake3-iOS
//
//  Created by Tom Kidd on 8/8/18.
//  Copyright © 2018 Tom Kidd. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {
    
    let defaults = UserDefaults()
    
    #if os(iOS)
    @IBOutlet weak var tiltAimingSwitch: UISwitch!
    #endif

    override func viewDidLoad() {
        super.viewDidLoad()
                
        #if os(iOS)
        tiltAimingSwitch.isOn = defaults.integer(forKey: "tiltAiming") == 1
        #endif

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    #if os(iOS)
    @IBAction func tiltAimingToggle(_ sender: UISwitch) {
        defaults.set(sender.isOn ? 1 : 0, forKey: "tiltAiming")
    }
    #endif

}
