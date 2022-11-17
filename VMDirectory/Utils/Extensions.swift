//
//  Extensions.swift
//  VMDirectory
//
//  Created by Asad on 17/11/22.
//

import Foundation

import UIKit
extension NSObject
{
    func convertModelToData<T:Codable>(_ model:T)->Data?
    {
        do
        {
            let reqData = try JSONEncoder().encode(model)
            return reqData
        }
        catch let error
        {
            print(error)
            return nil
        }
    }
    func convertDataToModel<E:Codable>(_ data:Data , type:E.Type)->E?
    {
        do
        {
            let response = try JSONDecoder().decode(type, from: data)
            return response
        }
        catch let error
        {
            print(error)
            return nil
        }
    }
    
    func isConnectedToInternet(errorMessage:String = "Not connected to internet")->Bool
       {
           let status = Reach().connectionStatus()
           
           switch status
           {
           case .unknown, .offline:
   //            displayActivityAlert(title: errorMessage)
               return false
           case .online(.wwan):
               return true
           case .online(.wiFi):
               return true
           }
           
       }
}


public extension UIViewController
{
    static func topMostViewController() -> UIViewController? {
          
           
        return UIApplication.shared.mainKeyWindow?.rootViewController?.topMostViewController()
       }
       
       func topMostViewController() -> UIViewController? {
           if let navigationController = self as? UINavigationController {
               return navigationController.topViewController?.topMostViewController()
           }
           else if let tabBarController = self as? UITabBarController {
               if let selectedViewController = tabBarController.selectedViewController {
                   return selectedViewController.topMostViewController()
               }
               return tabBarController.topMostViewController()
           }
               
           else if let presentedViewController = self.presentedViewController {
               return presentedViewController.topMostViewController()
           }
           
           else {
               return self
           }
       }
    func hideNavigationBar(flag:Bool)
       {
           self.navigationController?.setNavigationBarHidden(flag, animated: true)
       }
    func showHUD(message:String)
    {
        DispatchQueue.main.async {
            ALLoadingView.manager.resetToDefaults()
            ALLoadingView.manager.showLoadingView(ofType: .messageWithIndicator, windowMode: .fullscreen)
            ALLoadingView.manager.messageText = message
        }
        
    }
    func hideHUD()
    {
        DispatchQueue.main.async {
            ALLoadingView.manager.hideLoadingView(withDelay: 0.0)
        }
    }
    
    func displayActivityAlert(title: String)
    {
        DispatchQueue.main.async
            {
                let pending = UIAlertController(title: title, message: nil, preferredStyle: .alert)
                
                self.present(pending, animated: true, completion: nil)
                let deadlineTime = DispatchTime.now() + .seconds(2)
                DispatchQueue.main.asyncAfter(deadline: deadlineTime)
                {
                    pending.dismiss(animated: true, completion: nil)
                    
                }
        }
        
    }
    
}
extension UIApplication {
    var mainKeyWindow: UIWindow? {
        get {
            if #available(iOS 13, *) {
                return connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }
            } else {
                return keyWindow
            }
        }
    }
}
extension UIView {
    func setRadius(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2;
        self.layer.masksToBounds = true;
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }
}
