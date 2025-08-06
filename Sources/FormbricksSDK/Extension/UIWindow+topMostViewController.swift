import UIKit

extension UIWindow {
  func topMostViewController() -> UIViewController? {
    if let rootViewController: UIViewController = self.rootViewController {
      return UIWindow.topMostViewControllerFrom(rootViewController)
    }
    return nil
  }

  static func topMostViewControllerFrom(_ viewController: UIViewController) -> UIViewController {
    if let navigationController = viewController as? UINavigationController,
       let visibleController = navigationController.visibleViewController {
      return topMostViewControllerFrom(visibleController)
    } else if let tabBarController = viewController as? UITabBarController,
              let selectedTabController = tabBarController.selectedViewController {
      return topMostViewControllerFrom(selectedTabController)
    } else {
      if let presentedViewController = viewController.presentedViewController {
        return topMostViewControllerFrom(presentedViewController)
      } else {
        return viewController
      }
    }
  }
}
