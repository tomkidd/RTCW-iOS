//
//  MainMenuViewController.swift
//  Quake3-iOS
//
//  Created by Tom Kidd on 8/8/18.
//  Copyright © 2018 Tom Kidd. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    let defaults = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.string(forKey: "playerName") == nil {
            defaults.set("unnamedPlayer", forKey: "playerName")
        }
        
        let documentsDir = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).path
        
        print(documentsDir)
        
        // Get the document directory url
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path + "/Main/save"
        print(documentsUrl)

        do {
            // Get the directory contents urls (including subfolders urls)
            //            let directoryContents = FileManager.default.contents(atPath: documentsDir)
            let directoryContents = try FileManager.default.contentsOfDirectory(atPath: documentsUrl)
            print(directoryContents)
//
//            // if you want to filter the directory contents you can do like this:
//            let mp3Files = directoryContents.filter{ $0.pathExtension == "mp3" }
//            print("mp3 urls:",mp3Files)
//            let mp3FileNames = mp3Files.map{ $0.deletingPathExtension().lastPathComponent }
//            print("mp3 list:", mp3FileNames)
            
        } catch {
            print(error.localizedDescription)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitToMainMenu(segue: UIStoryboardSegue) {
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
