//
//  UIView+Extension.swift
//

import Foundation
import UIKit

extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last! as String
    }
}

extension UIView {
    // on ios10 or lower
    func round(corners: UIRectCorner, cornerRadius: Double) {
        
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
    
    // on ios11 or higher
    /*
     layerMinXMinYCorner – top left corner
     layerMaxXMinYCorner – top right corner
     
     layerMinXMaxYCorner – lower left corner
     layerMaxXMaxYCorner – lower right corner
     */
    func bottomRoundCornerWithShadow(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.masksToBounds = false
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.backgroundColor = .white
        
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.7
        
        self.layer.shadowOffset = CGSize(width: 0, height: -10)
        self.layer.shadowRadius = 10
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func bottomRoundCorner() {
        self.layer.cornerRadius = myCornerRadius
        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    class func NibObject() -> UINib {
        let hasNib: Bool = Bundle.main.path(forResource: self.nameOfClass, ofType: "nib") != nil
        guard hasNib else {
            assert(!hasNib, "Invalid parameter") // assert
            return UINib()
        }
        return UINib(nibName: self.nameOfClass, bundle:nil)
    }
    
    
    class func fromNib<T : UIView>(nibNameOrNil: String? = nil) -> T {
        let v: T? = fromNib(nibNameOrNil: nibNameOrNil)
        return v!
    }
    
    class func fromNib<T : UIView>(nibNameOrNil: String? = nil) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            // Most nibs are demangled by practice, if not, just declare string explicitly
            name = "\(T.self)".components(separatedBy: ".").last!
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews! {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }

    // MARK: Frame of UIView - do not touch
    var width: CGFloat {
        get { return self.frame.size.width }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var height: CGFloat {
        get { return self.frame.size.height }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    var size: CGSize  {
        get { return self.frame.size }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    var origin: CGPoint {
        get { return self.frame.origin }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    var x: CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    var y: CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var centerX: CGFloat {
        get { return self.center.x }
        set {
            self.center = CGPoint(x: newValue, y: self.centerY)
        }
    }
    
    var centerY: CGFloat {
        get { return self.center.y }
        set {
            self.center = CGPoint(x: self.centerX, y: newValue)
        }
    }
    
    var top : CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var bottom : CGFloat {
        get { return frame.origin.y + frame.size.height }
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }
    
    var right : CGFloat {
        get { return self.frame.origin.x + self.frame.size.width }
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
    }
    
    var left : CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x  = newValue
            self.frame = frame
        }
    }
    
    func origin (_ point : CGPoint) {
        frame.origin.x = point.x
        frame.origin.y = point.y
    }
}

let myCornerRadius: CGFloat = 40
// on ios11 or higher
/*
 layerMinXMinYCorner – top left corner
 layerMaxXMinYCorner – top right corner
 
 layerMinXMaxYCorner – lower left corner
 layerMaxXMaxYCorner – lower right corner
 */

// MARK: - customized round Views
class topRoundView: UIView {
    override func didMoveToWindow() {
        self.layer.cornerRadius = myCornerRadius
        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

class leftRoundView: UIView {
    override func didMoveToWindow() {
        self.layer.cornerRadius = myCornerRadius
        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

class rightRoundView: UIView {
    override func didMoveToWindow() {
        self.layer.cornerRadius = myCornerRadius
        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

class bottomRoundView: UIView {
    override func didMoveToWindow() {
        self.layer.cornerRadius = myCornerRadius
        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

class bottomRoundCornerWithShadow: UIView {
    override func didMoveToWindow() {
        self.layer.cornerRadius = myCornerRadius
        self.layer.masksToBounds = false
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.backgroundColor = .white
        
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.7
        
        self.layer.shadowOffset = CGSize(width: 0, height: -10)
        self.layer.shadowRadius = 10
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

class roundShadowView: UIView {
    override func didMoveToWindow() {
        
        //self.backgroundColor = .white
        self.layer.cornerRadius = 4
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray5.cgColor
        
        self.layer.shadowColor = UIColor.systemGray4.cgColor
        self.layer.shadowOpacity = 1
        
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 3
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

extension UICollectionView {
    func registerCell(id: String) {
        self.register(UINib(nibName: id, bundle: nil), forCellWithReuseIdentifier: id)
    }
}

extension UICollectionView {
    func dequeueCVCell<T: UICollectionViewCell>(indexPath:IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not locate view controller with with identifier \(String(describing: T.self)) in storyboard.")
        }
        return cell
    }
}

extension UICollectionReusableView {
    static var identifier: String { "\(Self.self)" }
}

extension UITableView{
    
    func registerCell(id: String) {
        self.register(UINib(nibName: id, bundle: nil), forCellReuseIdentifier: id)
    }
}

extension UITableViewCell {
    static var identifier: String { "\(Self.self)" }
}

extension UITableView {
    func dequeueTVCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Could not locate view controller with with identifier \(String(describing: T.self)) in storyboard.")
        }
        return cell
    }
}


extension UIView {
    func  addTapGesture(action : @escaping ()->Void ){
        let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
    }
    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
}

class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}

// MARK: - UIViewController+Presentation

extension UIViewController: PopupOpenAiVCDelegate {
    func popupOpenAiVC(_ controller: PopupOpenAiVC, message: String) {
        controller.dismiss()
        if let controller = storyboard?.instantiateViewController(identifier: "OpenAiVC") as? OpenAiVC {
            controller.firstMessage = message
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func presentPopupAi() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PopupOpenAiVC") as? PopupOpenAiVC else { return }
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @IBAction func dismiss() {
        if isPresentedModally() {
            dismiss(animated: true, completion: nil)
            
        } else {
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    func isPresentedModally() -> Bool {
        if let navigationController = self.navigationController,
            navigationController.viewControllers.first != self {
            return false
        }
        
        if self.presentingViewController != nil {
            return true
        }
        
        if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController  {
            return true
        }
        
        if self.tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        
        return false;
        
    }
}

extension CACornerMask {
    
    fileprivate static var isLTR: Bool {
        return UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
    }
    
    static var leadingTop: CACornerMask {
        return isLTR ? .layerMinXMinYCorner : .layerMaxXMinYCorner
    }
    static var trailingTop: CACornerMask {
        return isLTR ? .layerMaxXMinYCorner : .layerMinXMinYCorner
    }
    
    static var leadingBottom: CACornerMask {
        return isLTR ? .layerMinXMaxYCorner : .layerMaxXMaxYCorner
    }
    static var trailingBottom: CACornerMask {
        return isLTR ? .layerMaxXMaxYCorner : .layerMinXMaxYCorner
    }
    
}
