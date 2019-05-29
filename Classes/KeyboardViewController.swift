//
//  KeyboardViewController.swift
//  KeyboardExtension
//
//  Created by Dinesh Sharma on 03/05/19.
//  Copyright © 2019 Ranosys. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    //outlets
    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var allButtons: [UIButton]!
    @IBOutlet var alphabetButtons: [UIButton]!

    //update constraints here
    override func updateViewConstraints() {
        super.updateViewConstraints()
    // Add custom view sizing constraints here
    }

    // MARK: view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

//        let nib = UINib(nibName: "AlphabetKeyboardView", bundle: nil)
//        let objects = nib.instantiate(withOwner: self, options: nil)
//        view = objects[0] as? UIView
//        view.frame.size.height = 320
        let nib = UINib(nibName: "AlphabetKeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        view = objects[0] as? UIView

    }

    //orientation check
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       self.view.setNeedsLayout()
//        if UIDevice.current.orientation.isLandscape {
//
//        } else {
//
//        }
    }
    //add background to view
    //Shadow for buttons
    func setBottomShadowToViews() {
        self.allButtons!.reduce(into: ()) { (_, btn) in
            btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            btn.layer.shadowOpacity = 1.0
            btn.layer.shadowRadius = 0.0
            btn.layer.masksToBounds = false
            btn.layer.cornerRadius = 4.0
        }
    }

    ///it is mendatory function it will change custom keyboard to next keyboard(default or any other)
    @IBAction func nextKeyboardPressed(button: UIButton) {
        advanceToNextInputMode()
    }

    @IBAction func capsLockPressed(button: UIButton) {
        //caps lock work will done here
        self.alphabetButtons?.reduce(into: ()) { ( _, btn) in
            let strButton = btn.titleLabel?.text?.first
            if strButton?.isUppercase ?? false {
                btn.setTitle(strButton?.lowercased(), for: .normal)
            } else {
                btn.setTitle(strButton?.uppercased(), for: .normal)
            }
        }
    }

    ///characters will added to input view
    @IBAction func keyPressed(button: UIButton) {
        let string = button.titleLabel?.text ?? ""
        (textDocumentProxy as UIKeyInput).insertText("\(string )")

//        button.transform = CGAffineTransform.identity
//        UIView.animate(withDuration: 0.10, animations: {
//            button.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//        }, completion: {(_) -> Void in
//            button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        })
    }

    // back space button work
    @IBAction func backSpacePressed(button: UIButton) {
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }

    ///It will add one space in input view
    @IBAction func spacePressed(button: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText(" ")
    }

    /// This function will use to return keyboard
    @IBAction func returnPressed(button: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText("\n")
    }

    // load custom keyboard view
    @IBAction func symbolSetPressed(button: UIButton) {
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        view = objects[0] as? UIView
    }

    //change character set keyboard
    @IBAction func charSetPressed(button: UIButton) {
        let nib = UINib(nibName: "AlphabetKeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        view = objects[0] as? UIView
       // view.frame.size.height = 320
    }
    @IBAction func numSetPressed(button: UIButton) {
        let nib = UINib(nibName: "NumberKeyboard", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        view = objects[0] as? UIView
    }
}
