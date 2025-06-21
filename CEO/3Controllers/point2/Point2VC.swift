//
//  Point2VC.swift
//  CEO
//
//  Created by iStart17 on 1/21/21.
//

import UIKit

class Point2VC: BaseViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        /**
         E: Did (--) generate her/his being?
         A:  هل قام/قامت (--) بالتوليد وجوده/وجودها؟
         H: היוכלו (--) לייצר את עצמם?
         C: (--)是否自行生成了她/他的存在？
         */
        getQuestion("Did (--) generate her/his being?".localized),
        
        /**
         E: Did (--) self-produce without any parents?
         A: هل أنتج (--) نفسه بدون والدان؟
         H: האם (--) יצרו את עצמם לבד ללא הורים?
         C: (--)是否在没有父母的情况下自我生成？
         */
        getQuestion("Did (--) self-produce without any parents?".localized),
        
        /**
         E: Did (--) self-generate without any artificial laboratory procedure, or other processes?
         A:  هل قام (--) بتوليد نفسه بدون أية عملية مخبرية اصطناعية، أو أية عمليات أخرى؟
         H: האם (--) יצר/ה את עצמו/עצמה לבד ללא תהליך מעבדתי מלאכותי (הזרעה מלאכותית) או על ידי תהליכים אחרים?
         */
        getQuestion("Did (--) self-generate without any artificial laboratory procedure, or other processes?".localized)
    ]
    
    let alertMsg: [String] = [
        /**
         E: Congratulations! Step 2 has revealed that (--) did not self-produce because (--) lacks individual nature of any kind that could; instead (--) is a manifestation of the universal nature and its countless and ever-changing physical and non-physical elements.\nThus, (--) is not different from you or anybody, and vice versa, as everyone is a product of the same universal nature and not their own.\nThis understanding challenges the notion of individual existence and highlights the universal origin and essence we all share.\nBy grasping this fact, you’ve paved the way for deeper insights into the nature of existence most people remain unaware of.\n\nCongratulations. You have completed Step #2.
         A: :\n\nتهانينا! بينت الخطوة 2 أن (--) لم يقم بإنتاج نفسه لأن (--) يفتقر لأي نوع من أنواع الطبيعة الفردية القادرة على ذلك؛ (--) بدل ذلك هو ظاهرة من مظاهر الطبيعة الكونية و من عناصرها المادية منها و الغير المادية، والمتغيرة و التي لا تحصى.\nلذلك، (--) ليس مختلف منك أنت أو أية شخص اخر، و العكس صحيح، لأن الجميع منتوج من نفس الطبيعة الكونية وليسوا منتوج طبيعتهم هم.\nهذا المفهوم يتحدى فكرة الوجود الفردي و يسلط الضوء على أصل الكون و الجوهر الذي نشاركه كلنا.\nمع استيعابك لهته الحقيقة، لقد مهدت الطريق من أجل استيعاب أعمق لطبيعة الوجود التي يجهلها أغلب الناس.
         H: שלב 2 גילה כי (--) לא ייצר בעצמו שכן (--) חסר אופי קבוע אינדיבידואלי מכל סוג שיכול ליצור אותו; במקום זאת (--) הוא ביטוי של הטבע האוניברסלי ושל אינספור היסודות הפיזיים והלא-פיזיים המשתנים ללא הרף.\nלפיכך, (--) אינו שונה ממך או מאף אחד, ולהיפך, שכן כולם הם תוצר של אותו טבע אוניברסלי ולא משלהם.\nהבנה זו מאתגרת את הרעיון של קיום אינדיבידואלי ומדגישה את המקור והמהות האוניברסליים שכולנו חולקים.\nעל ידי תפיסת העובדה הזו, סללת את הדרך לתובנות עמוקות יותר על טבע הקיום שרוב האנשים לא מודעים אליו.\nמזל טוב! סיימת נקודה.
         C: 恭喜你！第2步揭示了(--)并不是自我产生的，因为(--)缺乏任何可能自我产生的个体特性；相反，(--)是普遍性质及其无数不断变化的物理和非物理元素的体现。\n因此，(--)与你或任何人并无不同，反之亦然，因为每个人都是同一普遍性质的产物，而不是他们自己的产物。\n这种理解挑战了个体存在的概念，并强调了我们共有的普遍起源和本质。\n通过掌握这一事实，你为深入了解大多数人仍未意识到的存在本质铺平了道路。\n\n恭喜你。你完成了步骤 #2！
         */
        "Congratulations! Step 2 has revealed that (--) did not self-produce because (--) lacks individual nature of any kind that could; instead (--) is a manifestation of the universal nature and its countless and ever-changing physical and non-physical elements.\nThus, (--) is not different from you or anybody, and vice versa, as everyone is a product of the same universal nature and not their own.\nThis understanding challenges the notion of individual existence and highlights the universal origin and essence we all share.\nBy grasping this fact, you’ve paved the way for deeper insights into the nature of existence most people remain unaware of.\n\nCongratulations. You have completed Step #2.",
        
        /**
         E: We understand this is challenging. Please try again.
         A: احنا عارفين إنه الاشي مش بسيط. عشان هيك، خلينا نوضح بطريقة تانية
         H:  אנחנו מבינים שזה לא קל. ננסה להבין בדרך אחרת
         C: 我們知道這不容易。 讓我們換個方式試試。
         */
        "We understand this is challenging. Please try again.",
        
        /**
         E: We understand this is not easy; however, your answer is incorrect.
         A:  نحن نفهم بأن هذا صعب، ولكن إجابتك غير صحيحة.
         H:  אנו מבינים שזה לא קל. אבל, תשובתך אינה נכונה
         C: 我们理解这很有挑战性；但是，您的答案是错误的。
         */
        "We understand this is not easy; however, your answer is incorrect."
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .white
        
        /**
         E: Is (--) able to self-produce?
         A: (--) قادر على توليد نفسه؟
         H: האם (--) מסוגל לייצור עצמי?
         C: (--)能够自行生成吗？
         */
        label.text = "2. \(getQuestion("Is (--) able to self-produce?".localized))"
        self.navigationItem.titleView = label
        
        questionLabel.text = getQuestion(questions[indexOfQuestions])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onShareAction))
    }
    
    @IBAction func rephrase(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PopupOpenAiVC") as? PopupOpenAiVC else { return }
        vc.rephraseQuestion = questions[indexOfQuestions]
        vc.isRephrase = true
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }

    @IBAction func onNo(_ sender: Any) {
        showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[0].localized), positive: R.btnPoint3.localized, negative: nil, positiveAction: { (_) in
            self.gotoNext()
        }, negativeAction: nil, completion: nil)
    }

    @IBAction func onYes(_ sender: Any) {
        switch indexOfQuestions {
        case 0:
            showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[1].localized), positive: R.btnOK.localized, negative: nil, positiveAction: { (_) in
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
            break
        case 1:
            showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[1].localized), positive: R.btnOK.localized, negative: nil, positiveAction: { (_) in
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
            break
        case 2:
            showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[2].localized), positive: R.btnOK.localized, negative: nil, positiveAction: { (_) in
                self.indexOfQuestions = -1
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
            break
        default:
            break
        }
    }
    
    private func updateQuestion() {
        indexOfQuestions += 1
        questionLabel.text = questions[indexOfQuestions].localized
    }

    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "Point3VC") as! Point3VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sideMenu(_ sender: Any) {
        IntroVC.showSideMenuVC(self)
    }
}
