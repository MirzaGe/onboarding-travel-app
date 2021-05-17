//
//  ViewController.swift
//  onboarding-travel-app
//
//  Created by sherry on 17/05/2021.
//

import UIKit


struct OnboardingItem {
    let title: String
    let detail: String
    let bgImage : UIImage?
}

class ViewController: UIViewController {

    @IBOutlet weak var darkView: UIView!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let items: [OnboardingItem] = [
        .init(title: "Travel Your Way",
              detail: "Travel the world by air, rail or sea at the most competitive prices",
              bgImage: nil),
        .init(title: "Stay Your Way",
              detail: "With Over Millions Of Hotels worldwide, find the perfect accomodation in the most amazing places!",
              bgImage: nil),
        .init(title: "Discover Your Way With New Features",
              detail: "Explore exotic destinations with our new features that link you to like-minded travellers!",
              bgImage: nil),
        .init(title: "Feast Your Way",
              detail: "We recommend you local cuisines that are safe and highly recommended by the locals!",
              bgImage: nil)
        
    ]
    
    private let currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageControl()
        setupScreen(index: currentPage)
        setupGestures()
    }

    private func setupPageControl() {
        pageControl.numberOfPages = items.count
    }

    private func setupScreen(index: Int) {
        titleLabel.text = items[index].title
        detailLabel.text = items[index].detail
        pageControl.currentPage = index
    }
    private func setupGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation))
        view.addGestureRecognizer(tapGesture)
    }
     
    @objc private func handleTapAnimation() {
        print("Tapped!")
    }
    
}
