import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var darkView: UIView!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var items: [OnboardingItem] = []
    
    private var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlaceholderitems()
        setupPageControl()
        setupScreen(index: currentPage)
        updateBackgroundImage(index: currentPage)
        setupGestures()
        setupViews()
    }
    
    private func setupPlaceholderitems() {
        items = OnboardingItem.placholderItems
    }
    
    private func setupViews() {
        darkView.backgroundColor = UIColor.init(white: 0.1, alpha: 0.5)
    }
    
    private func updateBackgroundImage(index: Int) {
        let image = items[index].bgImage
        UIView.transition(with: bgImageView,
                          duration: 0.5, options: .transitionCrossDissolve,
                          animations:{ self.bgImageView.image = image },
                          completion: nil)
        
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
        // 1st animation = detail label
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations : {
            self.titleLabel.alpha = 0.8
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y:0)
        }) { _  in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -5500)
            }, completion: nil)
        }
        
     // second animation detail label
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:
                        {
                            self.detailLabel.alpha = 0.8
                            self.detailLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                        }) { _ in
            
            
            if self.currentPage < self.items.count - 1 {
                self.updateBackgroundImage(index: self.currentPage + 1)
            }
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.detailLabel.alpha = 0
                self.detailLabel.transform = CGAffineTransform(translationX: 0, y: -5500)
            }) { _ in
                
                self.currentPage += 1
                
                
                if self.isOverLastItems(){
                    // show the main part of the app
                    
                    self.showMainapp()
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
    
    private func showMainapp() {
        
        // MainAppViewController
        
        let mainAppViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainAppViewController")
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = mainAppViewController
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
        
    }
    
    
}
