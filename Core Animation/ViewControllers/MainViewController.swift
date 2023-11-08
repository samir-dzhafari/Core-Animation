//
//  ViewController.swift
//  Core Animation
//
//  Created by Самир Джафари on 08.11.2023.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var springAnimationView: SpringView!
    
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    @IBOutlet weak var performButton: UIButton!
    
    //MARK: - Private properties
    private var nextAnimationEffect: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    @IBAction func performButtonTapped() {
        let animationEffect = AnimationEffect.getAnimationEffect(preset: nextAnimationEffect)
        
        setupLabels(animationEffect)
        runSpringAnimationView(animationEffect)
        
        nextAnimationEffect = DataStore.shared.animations.shuffled().first
        setupButtonTitle(preset: nextAnimationEffect ?? "")
    }
    
}

//MARK: - Setting
extension MainViewController {
    private func setupButton() {
        performButton.layer.cornerRadius = 12
    }
    
    private func setupLabels(_ animationEffect: AnimationEffect) {
        presetLabel.text = "Preset: \(animationEffect.preset)"
        curveLabel.text = "Curve: \(animationEffect.curve)"
        forceLabel.text = "Force: \(animationEffect.force.formatted())"
        durationLabel.text = "Duration: \(animationEffect.duration.formatted())"
        delayLabel.text = "Delay: \(animationEffect.delay.formatted())"
    }
}

//MARK: - Private methods
extension MainViewController {
    private func setupButtonTitle(preset: String) {
        performButton.setTitle("Run \(preset)", for: .normal)
    }
    
    private func runSpringAnimationView(_ animationEffect: AnimationEffect) {
        springAnimationView.animation = animationEffect.preset
        springAnimationView.curve = animationEffect.curve
        springAnimationView.force = animationEffect.force
        springAnimationView.duration = animationEffect.duration
        springAnimationView.delay = animationEffect.delay
        
        springAnimationView.animate()
    }
}
