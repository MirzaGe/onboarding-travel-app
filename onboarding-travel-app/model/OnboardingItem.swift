//
//  OnboardingItem.swift
//  onboarding-travel-app
//
//  Created by sherry on 18/05/2021.
//

import UIKit

struct OnboardingItem {
    
    let title: String
    let detail: String
    let bgImage : UIImage?
    
    static let placholderItems: [OnboardingItem] = [
        .init(title: "Travel Your Way",
              detail: "Travel the world by air, rail or sea at the most competitive prices",
              bgImage: UIImage(named: "imTravel2")),
        .init(title: "Stay Your Way",
              detail: "With Over Millions Of Hotels worldwide, find the perfect accomodation in the most amazing places!",
              bgImage: UIImage(named: "imTravel6")),
        .init(title: "Discover Your Way With New Features",
              detail: "Explore exotic destinations with our new features that link you to like-minded travellers!",
              bgImage: UIImage(named: "imTravel3")),
        .init(title: "Feast Your Way",
              detail: "We recommend you local cuisines that are safe and highly recommended by the locals!",
              bgImage: UIImage(named: "imTravel7"))
        
    ]
}
