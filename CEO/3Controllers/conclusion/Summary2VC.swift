//
//  Summary2VC.swift
//  CEO
//
//  Created by iStart17 on 1/28/21.
//

import UIKit

class Summary2VC: BaseViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var btnPoint1: UIButton!
    @IBOutlet weak var btnPoint2: UIButton!
    @IBOutlet weak var btnPoint3: UIButton!
    @IBOutlet weak var btnStartOver: UIButton!
    @IBOutlet weak var yesNoStackView: UIStackView!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        /**
         E: Most people—about 99%—do not realize that no one exists as an individual, separate self. On top of that, our minds invent labels such as \"(--)\", \"(==)\", \"you\", \"I\", \"person\", \"they\", \"Black\", \"White\", \"Asian\". These labels are projected onto people by the mind and then mistakenly believed to be factual. This belief in mental labels distorts the truth, making others appear to have a different kind of existence—when in reality, everyone is identical, sharing the same universal nature.\n\n All perceivable differences between people do not belong to them. They belong to the totality of existence that gave rise to everyone. Therefore, these differences are not absolute, but relative—existing only as mental concepts, just as you discovered in Step 3.\n\nThese are the observable and irrefutable facts of how everyone exists, without exception.\n\n Do you see and understand this?
         A: ب99 بالمئة من البشر ليسوا واعين بأن الناس توجد بدون وجود فردي. أي أن عقلنا الباطني اخترع التسميات كـ \"(--)\"، \"(==)\"، \"(أنت)\"، \"أنا\"، \"هم\"، \"أمريكي\"، \"أوروبي\"، \"آسيوي\"، \"إفريقي\"، أو \"أي شيء\".\nيعرضهم العقل الباطني على الناس ويعتقد بشكل خاطئ بأنهم حقائق عن الجميع. إيماننا في التسميات المختلفة يغير الحقيقة عن الناس ويؤدي ذلك إلى ظهور الناس على أنهم يمتلكون وجودًا مختلفًا عنا، بالرغم من أن الجميع يفتقر إلى وجود فردي.\n\nكل الاختلافات بين الناس هي أقارب وتوجد فقط في مفاهيم التي اكتشفتها في الخطوة #3.\n\nهذه حقائق غير قابلة للإنكار عن وجود الناس بدون استثناءات.
         H: 99 אחוז מבני האדם אינם מודעים לכך שכל האנשים קיימים ללא קיום אינדיבידואלי.\nאז המוח שלנו ממציא תוויות כגון \"(--)\", \"(==)\", \"אתה\", \"אני\", \"הם\", \"אמריקאי\", \"אירופאי\", \"אסייתי\", \"אפריקאי\", או \"מה שלא יהיה\". המוח משליך אותם על אנשים ומאמין בהם בטעות כעובדות על כולם. האמונה שלנו בתיוגים שונים משנה את האמת על אנשים וגורמת להם להיראות כבעלי קיום שונה משלנו, למרות שלכולם אין קיום אינדיבידואלי.\n\nכל ההבחנות בין אנשים הן יחסיות וקיימות רק במושגים, כפי שגילית בשלב מספר 3.\n\nאלה העובדות הבלתי ניתנות לעירעור על איך כולם קיימים ללא חריגים.\nאתה רואה ומבין את זה?
         C: 99普罗森特 的人类都没意识到所有人都在没有个体存在的情况下存在，而没有个体存在。然后我们的大脑发明了一些标签，比如\\\"(-- )\\\"、\\\"(==)\\\"、\\\"你\\\"、\\\"我\\\"、\\\"他们\\\"、\\\"美国人\\\"、\\\"欧洲人\\\"、\\\"亚洲人\\\"、\\\"非洲人\\\"或\\\"无论什么\\\"。\n大脑将这些标签投射到人们身上，并错误地认为它们是关于每个人的事实。我们对各种标签的信仰改变了人们的真相，使他们看起来拥有与我们不同的存在，尽管每个人都缺乏个体存在。\n\n人与人之间的所有差异都是相对的，只存在于概念中，正如你在步骤 #3中发现的那样。\n\n这些都是无可辩驳的事实，说明每个人都毫无例外地存在着。\n你明白了吗？
         */
        "Most people—about 99%—do not realize that no one exists as an individual, separate self. On top of that, our minds invent labels such as \"(--)\", \"(==)\", \"you\", \"I\", \"person\", \"they\", \"Black\", \"White\", \"Asian\". These labels are projected onto people by the mind and then mistakenly believed to be factual. This belief in mental labels distorts the truth, making others appear to have a different kind of existence—when in reality, everyone is identical, sharing the same universal nature.\n\n All perceivable differences between people do not belong to them. They belong to the totality of existence that gave rise to everyone. Therefore, these differences are not absolute, but relative—existing only as mental concepts, just as you discovered in Step 3.\n\nThese are the observable and irrefutable facts of how everyone exists, without exception.\n\n Do you see and understand this?",
        
        /**
         E: Singular entities capable of self-production, a characteristic needed for possessing one’s own existence, do not exist, as you learned from completing Step #1 and Step #2.\n\nRecognizing that (--) and you lack individual existence, it becomes illogical to perceive and treat you and (--) as two distinct entities.
         A: كائنات فردية قادرة على الإنتاج الذاتي، هي خاصية مطلوبة من أجل الوجود الفردي، لا توجد، كما تعلمت من إكمال الخطوة #1 و الخطوة #2.\n\nبالتعرف على أنك و (--) تفتقران إلى الوجود الفردي، يصبح من غير المنطقي إدراك و معاملتك أنت و (--) ككائنين مستقلين.
         H: ישויות יחיד המסוגלות לייצור עצמי, מאפיין הדרוש להחזקת קיומו של עצמו, אינן קיימות, כפי שלמדת מהשלמת שלב 1 ושלב מס 2.\n\nמתוך הכרה בכך (--) ואתה חסרים קיום אינדיבידואלי, זה נעשה לא הגיוני לתפוס אותך ולהתייחס אליך ואל (--) כאל שתי ישויות נפרדות.
         C: 正如你在完成步骤 #1和步骤 #2时所学到的，能够自我生产（个体存在所需的特征）的单个实体是不存在的。认识到(--)和你缺乏个体存在，把你和(--)视为两个不同的实体就变得不合逻辑了。 
         */
        "Singular entities capable of self-production, a characteristic needed for possessing one’s own existence, do not exist, as you learned from completing Step #1 and Step #2.\n\nRecognizing that (--) and you lack individual existence, it becomes illogical to perceive and treat you and (--) as two distinct entities.",
        
        /**
         E: Correct. You and (--) lack individual existence as you’re not singular entities with the capacity for self-production. Instead, both of you are compositions of the same universal nature, comprising of countless physical and non-physical elements, rather than originating autonomously.\nYour origin and essence are identical, and any perceived distinctions do not belong to any individual; they are relative and arise from your mind's conceptualizations. Recognizing this, any action against (--) is essentially an action against yourself, and vice versa.\n\nDo you now recognize that any conflict between you two, or anyone else, is essentially a conflict against oneself?
         A: صحيح. أنت و (--) تفتقران إلى الوجود الفردي لأنكما لستما كائنين مستقلين قادرين على التوليد الذاتي. بدل ذلك، كلاكما مُركبان من نفس الطبيعة الكونية، المتشكلة من العديد من العناصر المادية و الغير المادية، وليس العناصر الخاصة بكما.\nأصلك و جوهرك متطابقان، وأية تميزات مُعتقدة لا تنتمي إلى أي فرد، بل تنتمي إلى الوجود بأكمله. وبالتالي هي أقارب و توجد فقط في تسميات عقلك الباطني.\nبالتعرف على هذا، أي فعل ضد (--) هو فعل ضد نفسك، و العكس صحيح.
         H: נכון. אתה ו-(--) חסרים קיום אינדיבידואלי מכיוון שאינכם ישויות יחידניות ואתם ללא יכולת ייצור עצמי. במקום זאת, שניכם הינכם קומפוזיציות של אותם אינספור אלמנטים פיזיים ולא-פיזיים אוניברסליים. המקור והמהות שלכם זהים, וכל ההבחנות הנתפסות הן יחסיות, הנובעות מההמשגות של המוח שלך.\n\nמתוך הכרה בכך, כל פעולה נגד (--) היא למעשה פעולה נגד עצמך ולהיפך.\n\nהאם אתה מכיר כעת כי כל קונפליקט בין שניכם, או מישהו אחר, הוא למעשה קונפליקט נגד עצמך?
         C: "正确。你和(--)都缺乏个体存在，因为你们不是具有自我生成能力的单一实体。 相反，你们两个都是由无数物质和非物质元素组成的同一普遍本质的组成部分，而不是自主起源的。\n\n你们的起源和本质是相同的，任何感知到的区别都不属于任何个体；它们都是相对的，来自于你们心灵的概念化。\n\n认识到这一点，任何针对(--)的行动本质上都是针对你自己的行动，反之亦然。\n\n你现在是否认识到，你们之间或其他人之间的任何冲突本质上都是针对自己的冲突？"
         */
        "Correct. You and (--) lack individual existence as you’re not singular entities with the capacity for self-production. Instead, both of you are compositions of the same universal nature, comprising of countless physical and non-physical elements, rather than originating autonomously.\nYour origin and essence are identical, and any perceived distinctions do not belong to any individual; they are relative and arise from your mind's conceptualizations. Recognizing this, any action against (--) is essentially an action against yourself, and vice versa.\n\nDo you now recognize that any conflict between you two, or anyone else, is essentially a conflict against oneself?",
        
        /**
         E: Take a moment to reflect profoundly on each question. Envision the presented information without the influence of preconceived notions to grasp life’s facts and the truth of this conclusion.
         A: خد لحظة للتفكير بعمق في كل سؤال. تخيل المعلومات المقدمة بدون تأثيرات الأفكار المسبقة عليها من أجل فهم حقائق الحياة و من أجل فهم حقيقة هذه الخلاصة.
         H: הקדישו רגע להרהור מעמיק בכל שאלה. דמיינו את המידע המוצג ללא השפעה של דעות קדומות כדי להבין את עובדות החיים ואת אמיתות מסקנה זו.
         C: 花一点时间深刻反思每个问题。摒弃先入为主的观念的影响，设想所呈现的信息，以把握生活的事实和这一结论的真相。
         */
        "Take a moment to reflect profoundly on each question. Envision the presented information without the influence of preconceived notions to grasp life’s facts and the truth of this conclusion."
    ]
    
    let alertMsg: [String] = [
        /**
         
         */
        "Correct. You use the label of \"person\" only for convenience's sake, thus what you see is not a person but countless and nameless parts. Naming something that is not a person a \"person\" makes sense, and that is what you did.\nCongratulations! You have completed Step #3.",
        
        /**
         E: We understand this is not easy. Please try again.
         A: احنا عارفين إنه الاشي مش بسيط. عشان هيك، خلينا نوضح بطريقة تانية
         H:  אנחנו מבינים שזה לא קל. ננסה להבין בדרך אחרת
         C: 我們知道這不容易。 讓我們換個方式試試。
         */
        "We understand this is not easy. Please try again.",
        
        /**
         E: We understand this is not easy. Please repeat Step #1.
         A: نحن نتفهم أن هذا ليس سهلاً. يُرجى تكرار الخطوة الأولى.
         H: אנו מבינים שזה לא קל. אנא חזרו על שלב 1.
         C: 我们知道这不容易。请重复步骤1。
         */
        "We understand this is not easy. Please repeat Step #1.",
        
        /**
         E: We understand this is not easy. Please repeat Step #1.
         A: نحن نتفهم أن هذا ليس سهلاً. يُرجى تكرار الخطوة الأولى.
         H: אנו מבינים שזה לא קל. אנא חזרו על שלב 1.
         C: 我们知道这不容易。请重复步骤1。
         */
        "We understand this is not easy. Please repeat Step #1."
        ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        btnPoint1.isHidden = true
        btnPoint2.isHidden = true
        btnPoint3.isHidden = false
        btnStartOver.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .white
        
        /**
         E: SUMMARY:\nWhat you have discovered:
         A: الملخص:\nهذا ما الذي اكتشفتَه:
         H: הנה התקציר:\nסיכום של מה שהתגלה:
         C: 摘要：\n這裡對所發現之事物的總結是：
         */
        label.text = "SUMMARY:\nWhat you have discovered:".localized
        self.navigationItem.titleView = label
        
//        questionLabel.text = getQuestion(questions[indexOfQuestions])
        questionTextView.text = getQuestion(questions[indexOfQuestions].localized)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onShareAction))
    }
    
    @IBAction func rephrase(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PopupOpenAiVC") as? PopupOpenAiVC else { return }
        vc.rephraseQuestion = getQuestion(questions[indexOfQuestions].localized)
        vc.isRephrase = true
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @IBAction func onYes(_ sender: Any) {
        switch indexOfQuestions {
        case 0: // P9
            self.indexOfQuestions = 1
            self.updateQuestion()
            break
        case 1: // P12
            updateQuestion()
            break
        case 2: // P13
            gotoNext()
            break
        default:
            break
        }
    }
    
    @IBAction func onNo(_ sender: Any) {
        switch indexOfQuestions {
        case 0: // P9
            showAlert(title: Constants.APPNAME, message: alertMsg[1].localized, positive: R.btnOK.localized, negative: nil, positiveAction: { (_) in
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
            break
        case 1: // P12
            showAlert(title: Constants.APPNAME, message: alertMsg[2].localized, positive: R.btnPoint1.localized, negative: nil, positiveAction: { (_) in
                self.goBackStep1()
            }, negativeAction: nil, completion: nil)
            break
        case 2: // P13
            showAlert(title: Constants.APPNAME, message: alertMsg[3].localized, positive: R.btnOK.localized, negative: nil, positiveAction: { (_) in
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
            break
        default:
            break
        }
    }

    private func updateQuestion() {
        indexOfQuestions += 1
//        questionLabel.text = getQuestion(questions[indexOfQuestions])
        questionTextView.text = getQuestion(questions[indexOfQuestions].localized)
        
        btnPoint1.isHidden = true
        btnPoint2.isHidden = true
        btnPoint3.isHidden = true
        btnStartOver.isHidden = true
        
        yesNoStackView.isHidden = false
        
        switch indexOfQuestions {
        case 0:
            btnPoint3.isHidden = false
            break
        case 1:
            btnPoint1.isHidden = false
        case 2:
            break
        case 3:
            btnPoint1.isHidden = false
            btnPoint2.isHidden = false
            btnPoint3.isHidden = false
            btnStartOver.isHidden = false
            
            yesNoStackView.isHidden = true
            break
        default:
            break
        }
    }
    
    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "Summary3VC") as! Summary3VC
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func onPoint1(_ sender: Any) {
        goBackStep1()
    }
    
    @IBAction func onPoint2(_ sender: Any) {
        goBackStep2()
    }
    
    @IBAction func onPoint3(_ sender: Any) {
        goBackStep3()
    }
    
    @IBAction func onStartOver(_ sender: Any) {
        goBackStartOver()
    }

    @IBAction func sideMenu(_ sender: Any) {
        IntroVC.showSideMenuVC(self)
    }
}
