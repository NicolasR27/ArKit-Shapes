//
//  ViewController.swift
//  shape
//
//  Created by Nicolas Rios on 3/25/20.
//  Copyright © 2020 Nicolas Rios. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        let scene = SCNScene()
        sceneView.scene = scene
        
        createShapes()
    }
    
    func createShapes(){
        
        let pyramid = SCNPyramid(width: 0.2, height: 0.2, length: 0.2)
       pyramid.firstMaterial?.diffuse.contents = UIColor.green
        let pyramidNode = SCNNode(geometry: pyramid)
        pyramidNode.position.z = -0.8
        sceneView.scene.rootNode.addChildNode(pyramidNode)
        
        
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.yellow
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3Make(-0.5,0,-0.8)
        sceneView.scene.rootNode.addChildNode(boxNode)
            
        let sphere = SCNSphere(radius:0.15)
        sphere.firstMaterial?.diffuse.contents = UIColor.red
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3Make(0.5,0,-0.8)
        sceneView.scene.rootNode.addChildNode(sphereNode)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let configuration = ARWorldTrackingConfiguration()

        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
      
        sceneView.session.pause()
    }

  
}
