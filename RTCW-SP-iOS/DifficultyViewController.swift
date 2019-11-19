//
//  DifficultyViewController.swift
//  Quake3-iOS
//
//  Created by Tom Kidd on 7/28/18.
//  Copyright © 2018 Tom Kidd. All rights reserved.
//

import UIKit

class DifficultyViewController: UIViewController {
    
    var selectedDifficulty = 0
    
    @IBAction func difficulty1(_ sender: UIButton) {
        selectedDifficulty = 1
        performSegue(withIdentifier: "GameSegue", sender: self)
    }
    
    @IBAction func difficulty2(_ sender: UIButton) {
        selectedDifficulty = 2
        performSegue(withIdentifier: "GameSegue", sender: self)
    }

    @IBAction func difficulty3(_ sender: UIButton) {
        selectedDifficulty = 3
        performSegue(withIdentifier: "GameSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! GameViewController).selectedDifficulty = selectedDifficulty
        (segue.destination as! GameViewController).selectedMap = "cutscene1"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
