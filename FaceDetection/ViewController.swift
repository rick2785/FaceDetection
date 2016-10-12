//
//  ViewController.swift
//  FaceDetection
//
//  Created by Rickey Hrabowskie on 10/11/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = UIImage(named: "faceDetection3")
        self.findFace()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func findFace() {
        
        guard let faceImage = CIImage(image: self.imageView.image!) else { return }
        
        let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)
        let faces = faceDetector?.features(in: faceImage, options: [CIDetectorSmile: true, CIDetectorEyeBlink: true])
        
        for face in faces as! [CIFaceFeature] {
            
            if face.hasSmile {
                print("😀") // control + command + space brings up symbols
            }
            
            if face.leftEyeClosed {
                print("Left: 😉")
            }
            
            if face.rightEyeClosed {
                print("Right: 😉")
            }
        }
        
        if faces!.count != 0 {
            print("Number of Faces: \(faces!.count)")
        } else {
            print("No Faces 😢")
        }
    }

}

