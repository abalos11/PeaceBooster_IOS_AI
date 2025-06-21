//
//  Summary1VC.swift
//  CEO
//
//  Created by iStart17 on 1/27/21.
//

import UIKit

class Summary1VC: BaseViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        /**
         E: In the beginning, you said that you perceive and experience (--)'s existence and yours as two different existences.
         A: في البداية، قلت أنك تعتبر و تختبر وجود (--) و وجودك على أنهما مختلفان.
         H: בהתחלה אמרת שאתה תופס וחווה את קיומו של (--) ושלך כשני קיומים שונים.
         C: 一开始，你说你感知和体验到(--)的存在和你的存在是两个不同的存在。
         */
        "In the beginning, you said that you perceive and experience (--)'s existence and yours as two different existences.",
        
        /**
         E: To claim a true individual existence (--) and you need to be two different existences where each of you is:\n\n1. One entity.\n2. Able to self-generate.\n3. Existing as (--) and you without your mind's labels.\n\nHowever, you successfully completed all 3 Steps and found the opposite to be true about (--) and you.
         A: من أجل المطالبة بوجود فردي على (--) و أنت أن تكونا وُجودين مختلفين، لذلك كل واحد منكما يجب أن يكون:\n1. كائن واحد.\n2. قابل على التوليد الذاتي.\n3. أن توجدا كـ (--) و أنت بدون تسميات عقلكما الباطني.
         H: כדי לתבוע קיום אינדיבידואלי אמיתי (--) ואתה צריך להיות שני קיום שונים, ולכן כל אחד מכם צריך להיות\n1. ישות אחת\n2. מסוגל ליצור את עצמך\n3. קיים כ (--) ו- \\\"אתה\\\" ללא תוויות\n\nעם זאת, השלמת בהצלחה את כל 3 השלבים ומצאת שההפך נכון לגבי (--) ואליך.
         C: 要宣称真正的个体存在，(--)和你必须是两个不同的存在，因此你们每个都必须是：\n\n1. 一个实体。\n2. 能够自我生成。\n3. 作为(--)和你而存在，没有你脑海中的标签。\n\n然而，你成功地完成了这三个步骤，却发现(--)和你的情况恰恰相反。
         */
        "To claim a true individual existence (--) and you need to be two different existences where each of you is:\n\n1. One entity.\n2. Able to self-generate.\n3. Existing as (--) and you without your mind's labels.\n\nHowever, you successfully completed all 3 Steps and found the opposite to be true about (--) and you.",
        
        /**
         E: You discovered that (--) and you are:\n1. Not singular entities.\n2. Not able to generate yourselves.\n3. In need of your mind's labels of \"(--)\" and \"you\" to exist as (--) and you.\n\nThis proves that (--) and you are not two different existences, and your senses are not showing this fact correctly.
         A:  (--):\n1. ليس كائن واحد.\n2. غير قادرين على توليد أنفسكم.\n3. بحاجة إلى تسميات عقلكما الباطني لـ\"(--)\" و \"أنت\" للوجود كـ (--) و أنت.\n\nهذا يثبت أن (--) و أنت بدون وجودكما الخاص، وحواسك لا تعرض هذه الحقيقة بشكل صحيح.
         H: :\n1. לא ישות יחידה\n2. אינו מסוגל לייצור עצמי, אלא מיוצרים על ידי אותם חלקים אוניברסליים משותפים\n3. זקוק לתווית של מוחך עבור  \"(--)\" ו- \"אתה\" כדי להתקיים כ- (--) ואתה\n\nזה מוכיח ש(--) ואתם אינם שני קיום שונים, והחושים שלכם אינם מראים את העובדה הזו בצורה נכונה.
         C: 你发现(--)和你：\n1. 不是一个实体。\n2. 无法自我生成。\n3. 需要你的脑海中\\\"(--)\\\"和\\\"你\\\"的标签，来作为(--)和你存在。\n\n这证明(--)和你没有自己的存在，而你的感官没有正确地显示这个事实。
         */
        "You discovered that (--) and you are:\n1. Not singular entities.\n2. Not able to generate yourselves.\n3. In need of your mind's labels of \"(--)\" and \"you\" to exist as (--) and you.\n\nThis proves that (--) and you are not two different existences, and your senses are not showing this fact correctly.",
        
        /**
         E: Conclusion: it appears to your mind that (--) and you possess different existences, but when examined, (--) and you do not.\nThis proves that your senses are lying to you because (--) and you appear to possess individual existence, but that is not true.
         A: الخلاصة: يبدوا لعقلك الباطني بأن (--) و أنت تملكان وجودين مختلفين، ولكن عندما فُحصت، (--) و أنت لا تملكان وجودين مختلفين.\n\nهذا يُثبت أن حواسك تكذب عليك لأن (--) و أنت تظهران كأنكما تملكان وجودكما الخاص، ولكن هذا ليس صحيح.
         H: מסקנה: נראה לך שמוחך כי ל-(--) ולך יש קיום משלכם, אך כאשר זה נבדק, מסתבר של-(--) ולך אין קיום עצמאי.\nזה מוכיח שהחושים שלך משקרים לך מכיוון של-(--) ולך נראה שאתם מחזיקים בקיום משלכם, אבל זה לא נכון.
         C: 结论：在你看来，(--)和你似乎拥有不同的存在，但检验的时候，(--)和你并不如此。\n\n这证明了你的感官在欺骗你，因为(--)和你似乎拥有各自的存在，但事实并非如此。
         */
        "Conclusion: it appears to your mind that (--) and you possess different existences, but when examined, (--) and you do not.\nThis proves that your senses are lying to you because (--) and you appear to possess individual existence, but that is not true.",
        
        /**
         E: Since you and (--) share the same existence, why do humans believe in many different existences and experience them as real?
         A:  بما أنك و (--) تشتركان نفس الوجود، لماذا يؤمن البشر في العديد من الوجودات المختلفة و يختبرونهم كأنهم حقيقة؟
         H:  מכיוון שאתה ו-(--) חולקים באותו קיום, למה בני אדם מאמינים בקיומים רבים שונים וחווים אותם כממשיים?
         C: 既然你和(--)都有相同的存在，为什么人类相信许多不同的存在，并把它们当作真实的体验?
         */
        "Since you and (--) share the same existence, why do humans believe in many different existences and experience them as real?"
    ]
    
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
        if indexOfQuestions == questions.count-1 {
            gotoNext()
        } else {
            updateQuestion()
        }
    }
    
    private func updateQuestion() {
        indexOfQuestions += 1
//        questionLabel.text = getQuestion(questions[indexOfQuestions])
        questionTextView.text = getQuestion(questions[indexOfQuestions].localized)
    }
    
    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "Summary2VC") as! Summary2VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sideMenu(_ sender: Any) {
        IntroVC.showSideMenuVC(self)
    }
}
