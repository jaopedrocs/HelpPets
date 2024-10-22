import UIKit

class HomeViewController: UIViewController {

    private lazy var headerComponent: HeaderComponent = {
        let view = HeaderComponent(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstContainer: FirstContainer = {
        let view = FirstContainer()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondContainer: SecondContainer = {
        let view = SecondContainer()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var thirdContainer: ThirdContainer = {
        let view = ThirdContainer()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        subViewsConstraintsConfiguration()
    }
    
    private func viewConfiguration() {
        view.backgroundColor = UIColor(named: "ScreenBackgroundColor")
        view.addSubview(headerComponent)
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        scrollStackViewContainer.addArrangedSubview(firstContainer)
        scrollStackViewContainer.addArrangedSubview(secondContainer)
        scrollStackViewContainer.addArrangedSubview(thirdContainer)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func subViewsConstraintsConfiguration() {
        
        NSLayoutConstraint.activate([
            headerComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerComponent.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            headerComponent.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            scrollView.topAnchor.constraint(equalTo: headerComponent.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
}
