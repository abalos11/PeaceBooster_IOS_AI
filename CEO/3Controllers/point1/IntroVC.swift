//
//  IntroVC.swift
//  CEO
//
//  Created by iStart17 on 1/20/21.
//

import UIKit

class IntroVC: BaseViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        /*
         E: Do you experience (--)’s existence and yours as two different existences?
         A: هل أنت تختبر وجود (--) و وجودك كوجودين مختلفين؟
         H: האם אתה חווה את קיומו של (--) ושלך כשני קיומים שונים?
         C: 你是否体验到你和(--)的存在是两种不同的存在？
        */
        "Do you experience (--)’s existence and yours as two different existences?",
        
        /*
         E: Do you experience this person as someone different from you?
         A: هل ترى هذا الشخص كشخص مختلف عنك؟
         H: האם אתה חווה את האדם הזה כמישהו שונה ממך?
         C: 你是否觉得这个人与你不同？
        */
        "Do you experience this person as someone different from you?",
    ]
    
    /*
     E: Your senses are functioning correctly, indicating a deep understanding and uncorrupted senses.\n\nConsider that all beings, including (--), are manifestations of the same universal physical and non-physical elements, without individual ability to generate themselves; thus, everyone is identical and shares a common origin.\n\nThere are no differences between people, except for relative ones, like \"you\", \"me\", \"short\" or \"tall\" which arise through concepts invented and projected by our minds.\nThis realization is the path to true peace and happiness.\n\nSince you and (--) are without individual existence, any action against (--) is an action against yourself and vice versa.\n\nYou may not need this app but feel free to use for further understanding.
     
     A: حواسك تعمل بشكل صحيح، هذا يدل على الفهم العميق و الحواس غير فاسدة على الفهم العميق و الحواس غير فاسدة.\n\nاعتبر أن كل الكائنات، يشمل ذلك (--)، هي مظاهر لعناصر الكون المادية و الغير المادية، بدون القدرة الفردية على توليد نفسها. لذلك الجميع متماثل و يتشاركون أصل مشترك.\n\nلا توجد فروقات بين الناس، إلا الأقارب، مثل \"أنت\"، \"أنا\"، \"قصير\" أو \"طويل\" وهته تولد من خلال مفاهيم اخترعت و عُرضت من قبل عقلنا الباطني.\nهذا الإدراك هو الطريق إلى السعادة و السلام الحقيقي.\n\nبما أنك و (--) بدون وجود منفرد، يعني أي فعل ضد (--) هو فعل ضد نفسك و العكس صحيح.\n\nربما لا تحتاج إلى هذا التطبيق ولكن لا تتردد في استعماله من أجل المزيد من الفهم.
     
     H: הערה: החושים שלך פועלים כהלכה, מה שמצביע על הבנה עמוקה. קחו בחשבון שכל היצורים, כולל (--), הם ביטויים של אותם יסודות פיזיים ולא-פיסיים אוניברסליים, ללא יכולת ליצור את עצמם; לפיכך, אנו חולקים מוצא משותף. הבדלים מתעוררים רק דרך מושגים שמוקרנים על ידי המוח שלנו. הבנה זו היא הדרך לשלום ואושר אמיתיים. מכיוון שאתה ו-(--) הינכם ללא קיום משלכם, כל פעולה נגד (--) היא פעולה נגד עצמכם ולהיפך. יתכן שאינכם צריכים את  האפליקציה הזו אבל אתם מוזמנים להשתמש בה להעמקת ההבנה.
     
     C: 你的感官功能正常，说明你有深刻的理解力，感觉未受破坏。\n\n考虑到包括(--)在内的所有生命体都是相同的普遍物质和非物质元素的表现，没有自我生成的能力；因此，每个人都是相同的，共享同一个起源。\n\n除了相对的差异，如“你”、“我”、“矮”或“高”这些通过我们的大脑发明和投射的概念以外，人与人之间没有差异。\n这种认识是通向真正的和平与幸福的道路。\n\n由于你和(--)都没有个体存在，任何针对(--)的行动都是针对你自己的行动，反之亦然。\n\n您可能不需要这个应用程序，但为了进一步理解，请随意使用。
    */
    let alertMsg = "Your senses are functioning correctly, indicating a deep understanding and uncorrupted senses.\n\nConsider that all beings, including (--), are manifestations of the same universal physical and non-physical elements, without individual ability to generate themselves; thus, everyone is identical and shares a common origin.\n\nThere are no differences between people, except for relative ones, like \"you\", \"me\", \"short\" or \"tall\" which arise through concepts invented and projected by our minds.\nThis realization is the path to true peace and happiness.\n\nSince you and (--) are without individual existence, any action against (--) is an action against yourself and vice versa.\n\nYou may not need this app but feel free to use for further understanding."
    ///let alertMsg = "Your senses are functioning correctly, indicating a deep understanding and uncorrupted senses.\n Consider that all beings are manifestations of the same universal physical and non-physical elements, without individual ability to generate themselves; thus, everyone is identical and shares a common origin.\n There are no differences between people, except for relative ones, like you, me, short or tall which arise through concepts invented and projected by our minds. This realization is the path to true peace and happiness.\n Since you and this person are without individual existence, any action against this person is equivalent to action against yourself and vice versa.\n You may not need this app, but feel free to use it to understand the situation further."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if g_personName.isEmpty, g_userName.isEmpty {
            addNameOfPicture()
        }
        
        print(Locale.preferredLanguages.first ?? "no language")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        indexOfQuestions = 0
        questionLabel.text = getQuestion(questions[indexOfQuestions].localized)
    }

    @IBAction func onNo(_ sender: Any) {
        switch indexOfQuestions {
        case 0:
            updateQuestion()
//            yesButton.setTitle("Correct".localized, for: .normal)
            break
        case 1:
            showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg.localized), positive: R.btnOK, negative: nil, positiveAction: { [weak self] (_) in
                guard let self else { return }
                self.navigationController?.popViewController(animated: true)
            }, negativeAction: { (_) in
                self.onGotoWCWC()
            }, completion: nil)
            break
        case 2:
            indexOfQuestions = -1
            updateQuestion()
            break
        default:
            break
        }
    }
    
    @IBAction func onYes(_ sender: Any) {
        gotoNext()
        /*
        switch indexOfQuestions {
        case 0:
            indexOfQuestions = 1
            updateQuestion()
            break
        case 1:
            updateQuestion()
            break
        case 2:
            gotoNext()
            break
        default:
            break
        }
        */
    }
    
    @IBAction func rephrase(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PopupOpenAiVC") as? PopupOpenAiVC else { return }
        vc.rephraseQuestion = getQuestion(questions[indexOfQuestions]).localized
        vc.isRephrase = true
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @IBAction func sideMenu(_ sender: Any) {
        IntroVC.showSideMenuVC(self)
    }
    
    private func updateQuestion() {
//        yesButton.setTitle("Yes".localized, for: .normal)
        indexOfQuestions += 1
        questionLabel.text = getQuestion(questions[indexOfQuestions].localized)
    }
    
    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "OrderVC") as! OrderVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func onGotoWCWC() {
        if let url = URL(string: "https://apps.apple.com/us/app/id1529050773") {
            UIApplication.shared.open(url)
        }
    }
    
    func addNameOfPicture() {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "PopUpIntroVC") as? PopUpIntroVC else { return }
        controller.delegate = self
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
    
    /*
    fileprivate func addNameOfPicture() {
        /*
         E: To keep going and get the best experience, just make up a name for the person in the photo.
         A: للاستمرار والحصول على أفضل تجربة، ما عليك سوى إنشاء اسم للشخص الموجود في الصورة.
         H: כדי להמשיך ולקבל את החוויה הטובה ביותר, פשוט המציאו שם לאדם שבתמונה.
         C: 为了继续并获得最佳体验，只需为照片中的人起一个名字。
         */
        let alert = UIAlertController(title: "To keep going and get the best experience, just make up a name for the person in the photo.".localized, message: nil, preferredStyle: .alert)
        
        /*
         E: Name the Person in the Photo
         A: قم بتسمية الشخص الموجود في الصورة.
         H: ציינו את שם האדם שבתמונה.
         C: 说出照片中人物的名字。
         */
        
        alert.addTextField { field in
            field.placeholder = "Name the Person in the Photo".localized
        }
        
        /*
         E: What is your name?
         A: ما اسمك؟
         H: מה שמך?
         C: 你叫什么名字？
         */
        
        alert.addTextField { field in
            field.placeholder = "What is your name?".localized
        }
        
        let addAction = UIAlertAction(title: "OK".localized, style: .default) { [unowned alert] _ in
            guard let personName = alert.textFields?[0].text?.trim(), !personName.isEmpty,
                  let yourName = alert.textFields?[1].text?.trim(), !yourName.isEmpty else {
                
                /*
                 E: Please fill in both fields
                 A: يرجى ملء كلا الحقلين.
                 H: אנא מלאו את שני השדות.
                 C: 请填写两个字段。
                 */
                self.showToast("Please fill in both fields".localized)
                self.addNameOfPicture()
                return
            }
            
            g_personName = personName
            g_userName = yourName
            
            self.viewWillAppear(false)
        }
        
        alert.addAction(addAction)
        alert.view.tintColor = .link
        present(alert, animated: true)
    }
    */
}

extension IntroVC: PopUpIntroVCDelegate {
    func popUpIntroVC(_ controller: PopUpIntroVC, personName: String, yourName: String) {
        controller.dismiss()
        g_personName = personName
        g_userName = yourName
        viewWillAppear(false)
    }
}
