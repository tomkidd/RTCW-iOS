//
//  SavedGameViewController.swift
//  RTCW-SP-iOS
//
//  Created by Tom Kidd on 12/3/18.
//  Copyright © 2018 Tom Kidd. All rights reserved.
//

import UIKit

class SavedGameViewController: UIViewController {
    
    @IBOutlet weak var savesList: UITableView!
    @IBOutlet weak var showAutosavesButton: UIButton!
    @IBOutlet weak var loadGameButton: UIButton!

    var selectedSavedGame = ""
    
    var saves = [String]()
    var autoSaves = [String]()
    
    var showAutoSaves = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        savesList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let savesPath =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path + "/Main/save"
        
        let autoSavesPath =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path + "/Main/save/autosave"
        
        do {
            saves = try FileManager.default.contentsOfDirectory(atPath: savesPath).filter{ $0.suffix(4) == ".svg" }
            autoSaves = try FileManager.default.contentsOfDirectory(atPath: autoSavesPath)
            savesList.reloadData()
        } catch {
            print(error.localizedDescription)
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func showAutosaves(_ sender: UIButton) {
        showAutoSaves = !showAutoSaves
        sender.setTitle(showAutoSaves ? "Show Saved Games..." : "Show Autosaves...", for: .normal)
        selectedSavedGame = ""
        loadGameButton.isHidden = true
        savesList.reloadData()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoadGameSegue" {
            (segue.destination as! GameViewController).selectedSavedGame = selectedSavedGame
        }
    }

}

extension SavedGameViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if showAutoSaves {
            selectedSavedGame = autoSaves[indexPath.row]
        } else {
            selectedSavedGame = saves[indexPath.row]
        }
        loadGameButton.isHidden = false
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        #if os(iOS)
//        return 100
//        #endif
//        #if os(tvOS)
//        return 200
//        #endif
//    }
}

extension SavedGameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        if showAutoSaves {
            cell.textLabel?.text = autoSaves[indexPath.row].replacingOccurrences(of: ".svg", with: "")
        } else {
            cell.textLabel?.text = saves[indexPath.row].replacingOccurrences(of: ".svg", with: "")
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showAutoSaves {
            return autoSaves.count
        } else {
            return saves.count
        }
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ServerListViewCell
//        let server = filteredServers[indexPath.row]
//
//        cell.serverName.text = server.name
//        cell.ping.text = server.ping
//        if let ping = Int(server.ping) {
//            if ping <= 60 {
//                cell.ping.textColor = UIColor.green
//            } else if ping <= 100 {
//                cell.ping.textColor = UIColor.orange
//            } else {
//                cell.ping.textColor = UIColor.red
//            }
//        }
//        cell.gameType.text = server.gametype
//        cell.ipAddress.text = "\(server.ip):\(server.port)"
//        cell.mapName.text = server.map
//        cell.modName.text = server.mod
//        cell.playerCount.text = "(\(server.currentPlayers)/\(server.maxPlayers))"
//
//        return cell
//    }
    
    
}
