//
//  Point1VC.swift
//  CEO
//
//  Created by iStart17 on 1/20/21.
//

import UIKit

class ToNumber1VC: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var step1Label: UILabel!
    @IBOutlet weak var step2Label: UILabel!
    @IBOutlet weak var step3Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /**
         E: Examine each of the three points below to discover if (--) and you are two different existences.
         A:  تصفح كل واحدة من النقط أعلاه من أجل اكتشاف إذا (--) و أنت تمتلكان وجود منفرد أم لا.
         H: אנא בחנ/י את 3 הנקודות למטה כדי לגלות אם (--) בעל קיום עצמאי או לא
         C: 逐一检查以上三点，看看(--)和你是否拥有个体存在。
         */
        titleLabel.text = getQuestion("Examine each of the three points below to discover if (--) and you are two different existences.".localized)
        
        /**
         E: 1. Is (--) one entity?
         A: 1. هل (--) كيان واحد؟
         H: 1 האם (--) הינו יישות יחידנית?
         C: (--)是一個單一的存在體嗎？
         */
        step1Label.text = getQuestion("1. Is (--) one entity?".localized)
        
        /**
         E: 2. Is (--) able to self-produce?
         A: 2. هل (--) قادر على الإنتاج الذاتي؟
         H: 2 האם (--) מסוגל/ת ליצור באופן עצמאי?
         C: (--) 能够自行产生吗？
         */
        step2Label.text = getQuestion("2. Is (--) able to self-produce?".localized)
        
        /**
         E: 3. Does (--) need your mind\'s labels to exist as different entity?
         A: 3. هل أنت و (--) تحتجان إلى تسيمات عقلكما الباطنيين من أجل الوجود ككائنين مختلفين؟
         H: 3 האם אתה ו-(--) צריכים שתוויות המוח שלכם יתקיימו כישויות שונות?
         C: 你和(--)需要你的思想标签才能作为不同的实体存在吗？
         */
        step3Label.text = getQuestion("3. Does (--) need your mind's labels to exist as different entity?".localized)
        
        // addNameOfPicture()
    }
    
    @IBAction func sideMenu(_ sender: Any) {
        ToNumber1VC.showSideMenuVC(self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
