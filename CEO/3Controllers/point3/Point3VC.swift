//
//  Point3VC.swift
//  CEO
//
//  Created by iStart17 on 1/25/21.
//

import UIKit

class Point3VC: BaseViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        /**
         E: Can this person exist as (--) without your mind's label of \"(--)\"?
         A: هل يمكن لـ(--) الوجود كـ \"(--)\" بدون تسميات عقلك الباطني؟
         H: האם אדם זה יכול להתקיים כ (--) ללא התווית של דעתך של \"(--)\"?
         C: (--)需要被命名嗎?
         */
        "Can this person exist as (--) without your mind's label of \"(--)\"?",
        
        /**
         E: If you did not name this person \"(--)\", would they exist to you as (--)?
         A: إذا لم تسمي هذا الشخص بـ \"(--)\"، هل كانوا ليوجدون بالنسبة إليك كـ(--)؟
         H: אם לא היית קורא לאדם זה  \"(--)\", האם הוא היה קיים אצלך בתור (--)?
         C: 如果你不把这个人命名为\“(--)\”，他们对你而言会以(--)的身份存在吗？
         */
        "If you did not name this person \"(--)\", would they exist to you as (--)?",
        
        /**
         E: If this person was already (--), would it make sense to label what is already (--) as \"(--)\" again?
         A: إذا هذاالشخص كان (--) من قبل، هل من المنطق تسميت هذا الشخص بـ"\(--)"\مجددا؟
         H: אם האדם הזה כבר היה (--), האם זה הגיוני לתייג את מהינו כבר (--) כ-  \"(--)\" שוב?
         C: 如果这个人已经是(--)，再把已经是(--)的东西标为\“(--)\”有意义吗？
         */
        "If this person was already (--), would it make sense to label what is already (--) as \"(--)\" again?",
        
        /**
         E: This person has been existing without any label until the label \"(--)\" was created and projected by your mind for convenience's sake.\nThis way, everybody can function in concepts as \"(--)\" and \"you\".
         A: "كان هذا الشخص موجوداً بدون أية تسمية حتى خُلقت تسمية \\\"(--)\\\" وعُرضت من قبل عقلك الباطني من أجل راحة البال.\nهكذا، الجميع يوجد كـ\\\"(--)\\\" و\"أنت\" في مفاهيم، وذلك فقط لعدم وجود فروقات أخرى بين أي أحد."
         H:   אדם זה היה קיים ללא תווית כלשהי עד שהתווית \"(--)\" נוצרה והוקרנה על ידי דעתך מטעמי נוחות. בדרך זו, כל אחד יכול לתפקד במושגים כמו \"(--)\" ו"\אתה\".
         C: 在你的大脑为了方便而创造并投射出\\\"(--)\\\"这个标签之前，这个人一直是没有任何标签的。\n这样，每个人都可以在概念中以\\\"(--)\\\"和\\\"你\\\"的概念中发挥作用。
         */
        "This person has been existing without any label until the label \"(--)\" was created and projected by your mind for convenience's sake.\nThis way, everybody can function in concepts as \"(--)\" and \"you\"."
    ]
    
    let alertMsg: [String] = [
        /**
         E: Correct. In Step 3, you explored the facts of your mind's labeling and discovered that the person in the photo cannot exist as (--) without your mind's label of \"(--)\".\nThis realization extends to your own existence, emphasizing the role of mental labels in shaping perceptions and experiences.\nPlease remember, that the label \"(--)\" is merely a construct of your mind. All labels originate from your mind rather than from the side of any physical forms you are experiencing.\nRecognizing this challenges the notion of separate existences, as human distinctions exist only in labels.\nReflect on how your experience may contradict this fundamental truth.\n\nCongratulations. You have completed Step #3.
         A: مزبوط! عشان تسهل/ي عحالك، انت/ي سميت/ي الشخص اللي في الصورة \\\"(--)\\\" بالزبط زي ما سميت/ي حالك \\\"(==)\\\". عشان هيك، (--) بيحتاج/بتحتاج لاسمه/ـا عشان يعيش/تعيش كـ \\\"(--)\\\". هذا الشخص ما بيقدر يوجد كيانه زي (--) من غير الإسم.\n\nمبروووك! أنت هيك خلصت نقطة 3
         H: נכון. בשלב 3, חקרת את העובדות של תיוג המוח שלך וגילית שהאדם בתמונה לא יכול להתקיים בתור (--) ללא תווית המוח שלך של \\\"(--)\\\".\n ההבנה הזו משתרעת על הקיום שלך, תוך שימת דגש על תפקידן של תוויות מנטליות בעיצוב תפיסות וחוויות\n אנא זכור ש-\\\"(--)\\\" הוא רק תווית בראש שלך ואינו נמצא בצד התמונה או כל צורה פיזית שאתה תופס או חווה\n הבנה זו מוכיחה שקיימים נפרדים היא שקרית מכיוון שכולם זהים במהות ובמקור ושונים רק בתוויות המוח שלנו\n\n מזל טוב. השלמת את שלב מס .3\n     מזל טוב! השלמת שלב מס 3 \n
         C: 正确。在步骤3中，你探索了你大脑贴标签的事实，并发现，如果没有你的脑海当中的\\\"(--)\\\"标签，照片中的那个人就不能作为(--)存在。\n这种认识延伸到了你自身的存在，强调了心理标签在塑造感知和体验中的作用。\n请记住，\\\"(--)\\\"这个标签仅仅是你头脑中的一个构造。所有的标签都源于你的头脑，而不是你正在经历的任何物理形式的一面。\n认识到这一点会对独立存在的概念提出挑战，因为人类的区别只存在于标签中。\n反思一下你的经验会如何与这一基本真理相矛盾。\n\n恭喜你。你完成了步骤 #3.
         */
        "Correct. In Step 3, you explored the facts of your mind's labeling and discovered that the person in the photo cannot exist as (--) without your mind's label of \"(--)\".\nThis realization extends to your own existence, emphasizing the role of mental labels in shaping perceptions and experiences.\nPlease remember, that the label \"(--)\" is merely a construct of your mind. All labels originate from your mind rather than from the side of any physical forms you are experiencing.\nRecognizing this challenges the notion of separate existences, as human distinctions exist only in labels.\nReflect on how your experience may contradict this fundamental truth.\n\nCongratulations. You have completed Step #3.",
        
        /**
         E: We understand this is not easy. Please try again.
         A: نتفهم أن الأمر ليس سهلاً. يُرجى المحاولة مرة أخرى.
         H: אנו מבינים שזה לא קל. אנא נסה שוב.
         C: 我们知道这不容易。请再试一次。
         */
        "We understand this is not easy. Please try again."
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
         E: Can (--) exist as \"(--)\" without your mind's label?
         A: هل يمكن لـ(--) الوجود كـ \"(--)\" بدون تسميات عقلك الباطني؟
         H: האם אדם זה יכול להתקיים כ (--) ללא התווית של דעתך של \"(--)\"?
         C: (--)需要被命名嗎?
         */
        label.text = "3. \(getQuestion("Can (--) exist as \"(--)\" without your mind's label?".localized))" // "3.Is your mind's label needed?"
        self.navigationItem.titleView = label
        questionLabel.text = getQuestion(questions[indexOfQuestions].localized)
        
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
    
    @IBAction func onNo(_ sender: Any) {
        switch indexOfQuestions {
        case 0, 1, 2:
            showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[0].localized), positive: R.btnConclusion.localized, negative: nil, positiveAction: { (_) in
                self.gotoNext()
            }, negativeAction: nil, completion: nil)
            break
        case 3:
            showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[1].localized), positive: R.btnOK.localized, negative: nil, positiveAction: { (_) in
                self.moveTo()
            }, negativeAction: nil, completion: nil)
            break
        default:
            break
        }
    }

    @IBAction func onYes(_ sender: Any) {
        switch indexOfQuestions {
        case 0, 1, 2:
            showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[1].localized), positive: R.btnOK.localized, negative: nil, positiveAction: { (_) in
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
            break
        case 3:
            showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[0].localized), positive: R.btnConclusion.localized, negative: nil, positiveAction: { (_) in
                self.gotoNext()
            }, negativeAction: nil, completion: nil)
            break
        default:
            break
        }
    }
    
    private func updateQuestion() {
        indexOfQuestions += 1
        questionLabel.text = getQuestion(questions[indexOfQuestions].localized)
    }

    private func moveTo() {
        /**
         E: Incorrect. Please consider reviewing.
         A: غير صحيح. يُرجى مراجعة ذلك.
         H: שגוי. אנא שקול לבדוק.
         C: 不正确。请考虑审核。
         */
        let alert = UIAlertController(title: Constants.APPNAME, message: "Incorrect. Please consider reviewing.".localized, preferredStyle: .alert)
        
        /**
         E: Step #3
         A: الخطوة رقم 3
         H: שלב מס' 3
         C: 步骤＃3
         */
        alert.addAction(UIAlertAction(title: "Step #3".localized, style: .default, handler: { (_) in
            self.indexOfQuestions = -1
            self.updateQuestion()
        }))
        
        /**
         E: Step #2
         A: الخطوة رقم 2
         H: שלב מס' 2
         C: 步骤＃2
         */
        alert.addAction(UIAlertAction(title: "Step #2".localized, style: .default, handler: { (_) in
            self.goBackStep2()
        }))
        
        /**
         E: Step #1
         A: الخطوة رقم 1
         H: שלב מס' 1
         C: 步骤＃1
         */
        alert.addAction(UIAlertAction(title: "Step #1".localized, style: .default, handler: { (_) in
            self.goBackStep1()
        }))
        
        /**
         E: Start Over
         A: ابدأ من جديد
         H: התחל מחדש
         C: 步骤#3
         */
        alert.addAction(UIAlertAction(title: "Start Over".localized, style: .default, handler: { (_) in
            self.goBackStartOver()
        }))
        
        alert.view.tintColor = .link
        self.present(alert, animated: true, completion: nil)
    }
    
    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "Summary1VC") as! Summary1VC
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func sideMenu(_ sender: Any) {
        IntroVC.showSideMenuVC(self)
    }
}
