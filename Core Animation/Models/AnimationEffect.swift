//
//  AnimationEffect.swift
//  Core Animation
//
//  Created by Самир Джафари on 08.11.2023.
//

import Foundation

struct AnimationEffect {
    let preset: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
}

//MARK: - Data
extension AnimationEffect {
    static func getAnimationEffect(preset: String?) -> AnimationEffect {
        let dataStore = DataStore.shared
        
        let preset = preset ?? dataStore.animations.shuffled().first
        
        return AnimationEffect(
            preset: preset ?? "",
            curve: dataStore.curves.shuffled().first ?? "",
            force: CGFloat.random(in: 0...1),
            duration: CGFloat.random(in: 0...1),
            delay: 1
        )
    }
}
