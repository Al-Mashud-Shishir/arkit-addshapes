//
//  ViewController.swift
//  ArShapes
//
//  Created by Maddi on 29/11/20.
//

import UIKit
import ARKit
class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints , ARSCNDebugOptions.showWorldOrigin ]
        sceneView.session.run(configuration)
        addBox()
        addSphere()
        addCone()
    }

    func addBox(){
        //creating node to attach an item
        let node = SCNNode()
        //adding geometry to that node
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.02)
        //adding color to the geometry
        node.geometry?.firstMaterial?.diffuse.contents = UIColor .green
        //specifying location of the node in the scene
        node.position = SCNVector3Make(0,0,-0.2)
        node.name = "box"
        //finally adding the newly created node to the main root node of the arscene
        sceneView.scene.rootNode.addChildNode(node)
    }
    func addSphere(){
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.1)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor .darkGray
        node.position = SCNVector3Make(0.1,0.2,-0.4)
        node.name = "sphere"
        sceneView.scene.rootNode.addChildNode(node)
    }
    func addCone(){
        let node = SCNNode()
        node.geometry = SCNCone(topRadius: 0.01, bottomRadius: 0.1, height: 0.2)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor .orange
        node.position = SCNVector3Make(0.2,0.3,-0.5)
        node.name = "cone"
        sceneView.scene.rootNode.addChildNode(node)
    }
    @IBAction func lightClicked(_ sender: UIButton) {
        sceneView.autoenablesDefaultLighting = true
    }
}

