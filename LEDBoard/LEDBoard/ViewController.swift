//
//  ViewController.swift
//  LEDBoard
//
//  Created by 전현정 on 2021/10/31.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {

    @IBOutlet weak var contentsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let SettingViewController = segue.destination as? SettingViewController {
            SettingViewController.delegate = self
            SettingViewController.ledText = self.contentsLabel.text
            SettingViewController.textColor = self.contentsLabel.textColor
            SettingViewController.backgroundColor = self.contentsLabel.backgroundColor ?? .black
        }
    }
    
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contentsLabel.text = text
        }
        self.contentsLabel.textColor = textColor
        self.contentsLabel.backgroundColor = backgroundColor
    }
}

