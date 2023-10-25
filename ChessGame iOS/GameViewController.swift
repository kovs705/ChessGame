//
//  GameViewController.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 19.10.2023.
//

import UIKit
import SpriteKit
import SwiftUI

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene.newGameScene()

        // Present the scene
        let skView = self.view as! SKView
        skView.presentScene(scene)
        
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        // Create the SwiftUI view
        let boardView = BoardView()
        
        // Wrap the SwiftUI view in a UIHostingController
        let hostingController = UIHostingController(rootView: boardView)
        
        // Add the SwiftUI view as a child view controller
        addChild(hostingController)
        
        // Add the SwiftUI view's view to the view hierarchy
        view.addSubview(hostingController.view)
        
        // Set the SwiftUI view's frame to match the SKView's frame
        hostingController.view.frame = skView.frame
        
        // Notify the SwiftUI view that it has been added to the view hierarchy
        hostingController.didMove(toParent: self)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
