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
    
    private var currentPage: Int = 0
    
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
        titleLabel.alpha = 1.0
        detailLabel.alpha = 1.0
        titleLabel.transform = .identity
        detailLabel.transform = .identity
    }
    private func setupGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTapAnimation() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations : {
            self.titleLabel.alpha = 0.8
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y:0)
        }) { _  in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -5500)
            }, completion: nil)
        }
        
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:
                        {
                            self.detailLabel.alpha = 0.8
                            self.detailLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                        }) { _ in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.detailLabel.alpha = 0
                self.detailLabel.transform = CGAffineTransform(translationX: 0, y: -5500)
            }) { _ in
                
                self.currentPage += 1
                
                
                if self.isOverLastItems(){
                    // show the main part of the app
                    print ("Show the main app")
                } else {
                    self.setupScreen(index: self.currentPage)
                }
                
            }
                        }
    }
    
    private func isOverLastItems() -> Bool {
        // 0,1,2,3 // index
        // count => 4
        return currentPage == self.items.count
    }
    
    
}
