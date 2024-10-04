import UIKit

class HomeViewController: UIViewController {

    private lazy var headerComponent: HeaderComponent = {
        let view = HeaderComponent(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        subViewsConstraintsConfiguration()
    }
    
    func viewConfiguration() {
        view.backgroundColor = UIColor(named: "ScreenBackgroundColor")
        view.addSubview(headerComponent)
        navigationController?.isNavigationBarHidden = true
    }
    
    func subViewsConstraintsConfiguration() {
        
        let screen = UIScreen.main.bounds
        
        NSLayoutConstraint.activate([
            headerComponent.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerComponent.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            headerComponent.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            headerComponent.heightAnchor.constraint(equalToConstant: screen.height / 8 )
        ])
    }
}
