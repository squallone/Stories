//
//  SAMenuGamesViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SAMenuGamesViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties
    
    var flowController: SAMenuGamesFlowController!
    var games = [Game]()
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuView.delegate = self
        
        // Table View
        collectionView.register(UINib(nibName: "GameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GameCollectionViewCell")
        
        // Flow controller
        flowController = SAMenuGamesFlowController(navigationController: self.navigationController)
        
        // Refresh data
        refreshData()
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Refresh data
        refreshData()
    }
    
    // MARK: - Labels
    
    func refreshData(){
        let language = Language.current()!
        self.games = language.games
    }
    
    // MARK: - UICollection DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.games.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let game = games[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as! GameCollectionViewCell
        cell.lblName.text = game.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let game = games[indexPath.row]
        
        if game.scene != "none"{
            let testViewController = SASheetViewController()
            testViewController.game = game
            testViewController.showHomeButton = true
            // Push ViewController
           _ = self.navigationController?.pushViewController(testViewController, animated: true)
        }
    }    
    
    @IBAction func back(_ sender: Any) {
        flowController.back()

    }
}

// MARK: - Flow Layout

extension SAMenuGamesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 260, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: self.view.frame.size.height / 12,
                            left: self.view.frame.size.width / 5,
                            bottom:  self.view.frame.size.height / 12,
                            right: self.view.frame.size.width / 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.view.frame.size.height / 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.view.frame.size.width / 12
        
    }
}

extension SAMenuGamesViewController: MenuViewDelegate{
    
    func didPressSpanish() {
        self.refreshData()
    }
    
    func didPressEnglish() {
        self.refreshData()
    }
    
    func didPressHome() {
        flowController.showHome()
    }
    
    func didPressBack() {
        flowController.back()
    }
}
