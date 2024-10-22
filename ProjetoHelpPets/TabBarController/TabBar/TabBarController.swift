import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarSetup()
    }
    
    private func tabBarSetup() {
        let firstView = UINavigationController(rootViewController: HomeViewController())
        let secondView = UINavigationController(rootViewController: FindYourPetViewController())
        let thirdView = UINavigationController(rootViewController: ChatsViewController())
        let fourthView = UINavigationController(rootViewController: FavoritesViewController())
        let fifthView = UINavigationController(rootViewController: SettingsViewController())
        
        setViewControllers([
            firstView,
            secondView,
            thirdView,
            fourthView,
            fifthView
        ], animated: false)
        
        tabBar.isTranslucent = false
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Inicio"
        items[0].image = UIImage(systemName: "house.fill")
        
        items[1].title = "Pets"
        items[1].image = UIImage(systemName: "pawprint.fill")
        
        items[2].title = "Chats"
        items[2].image = UIImage(systemName: "message.fill")
        
        items[3].title = "Favs"
        items[3].image = UIImage(systemName: "heart.fill")
        
        items[4].title = "Perfil"
        items[4].image = UIImage(systemName: "gearshape.fill")
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor(named: "ComponentsBackgroundColor")
        
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "TabBarColor")
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "TabBarColor") ?? UIColor.black]
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.orange
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        
        tabBar.standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = tabBarAppearance
        }
    }
}
