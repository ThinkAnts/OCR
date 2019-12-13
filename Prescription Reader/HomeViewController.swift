//
//  ViewController.swift
//  test
//
//  Created by Ravi kishore on 10/25/19.
//  Copyright © 2019 Ravi kishore. All rights reserved.
//

import UIKit
import Vision
import Photos


class HomeViewController: UIViewController {
    
    @IBOutlet weak var cameraButton : UIButton!
    
    /*
    // Code by ravi
     
     
     private let inputImage: UIImageView = {
         let image = UIImageView(image: UIImage())
         image.translatesAutoresizingMaskIntoConstraints = false
         image.contentMode = .scaleAspectFit
         return image
     }()
    
    let result: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.font = UIFont(name: "Avenir", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let dissmissButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(buttonToDissmiss(_:)), for: .touchUpInside)
        button.setTitle("Done", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.borderColor = UIColor.systemRed.cgColor
        return button
    }()
    
    func addSubviews() {
        
        cameraButton.addTarget(self, action: #selector(self.openCamera), for: .touchUpInside)
        view.addSubview(dissmissButton)
        view.addSubview(inputImage)
        view.addSubview(result)
    }
        
    func setupLayout() {
        
        dissmissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dissmissButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        dissmissButton.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        dissmissButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true

        inputImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        inputImage.widthAnchor.constraint(equalToConstant: view.frame.width - 50).isActive = true

        result.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        result.bottomAnchor.constraint(equalTo: dissmissButton.topAnchor, constant: -40).isActive = true
        result.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        result.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadUI()
    }

 

    private func loadUI() {
        
        self.cameraButton.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
    }

    
     @objc private func openCamera() {
       
        let actionSheet: UIAlertController = UIAlertController(title: "Please Choose", message: nil, preferredStyle: .actionSheet)

        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            
        }
        

        let camera = UIAlertAction(title: "Camera", style: .default)
            { _ in
                self.pickFromCamera()
        }
        

        let Gallery = UIAlertAction(title: "Gallery", style: .default)
            { _ in
                self.pickFromGallery()
        }
        actionSheet.addAction(cancelActionButton)
        actionSheet.addAction(camera)
        actionSheet.addAction(Gallery)
        actionSheet.popoverPresentationController?.sourceView = cameraButton
        actionSheet.popoverPresentationController?.sourceRect = cameraButton.bounds
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    private func pickFromGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    private func pickFromCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
   private func doOCR(image: UIImage) {
        let requestHandler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
              let request = VNRecognizeTextRequest { (request, error) in
              guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
              for currentObservation in observations {
                  let topCandidate = currentObservation.topCandidates(1)
                      if let recognizedText = topCandidate.first {
                        print(recognizedText.string)
                        print(recognizedText.confidence)
                      }

                  }
              }

        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        try? requestHandler.perform([request])
    }
}



//MArk:- UIImagePickerControllerDelegate

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          if let image = info[.originalImage] as? UIImage {
                      doOCR(image: image)
          }
          // Set photoImageView to display the selected image.

          // Dismiss the picker.
          dismiss(animated: true, completion: nil)
      }
      
}
