//
//  OrderVC.swift
//  CEO
//
//  Created by iStart17 on 1/21/21.
//

import UIKit

class OrderVC: BaseViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        /**
         E: To confirm that (--) and you are two different existences, each of you must be truly one self-generated entity and exist as different without your mind's labels of \"(--)\" and \"you\".\nThese three qualities are necessary for (--) and you as a genuine claim of individual existence.
         A:  من أجل التأكد على أن (--) و أنت تمتلكان وجودكما الخاص بكما، يجب الاعتبار بهته الخاصيات الأساسية الثلاثة. هته الخاصيات ضرورية من أجل المطالبة بوجودكما الفردي. هذا يعني بأن كل واحد منكما يجب أن يكون كائن مفرد و إنتاجاً ذاتياً، و يجب الوجود كفردين مختلفين بدون ملصقات عقلكما الباطنين مثل \“(--)\” و "أنت".
         H: כדי לאמת ש- (--) ואתה מחזיקים בקיום עצמאי, שקול את שלושת התכונות החיוניים האלו. אלו התכונות הנחוצות לטענה אמיתית על קיומך האישי.   זה אומר שכל אחד מכם צריך להיות ישות יחידה ובעייצור עצמי, ולהתקיים כיישות שונה ללא תוויות המוח שלך כגון \"(--)\" ו\"אתה\".
         C:  为了确认(--)和你拥有自己的存在，请考虑这三个关键性质。这些性质是对于(--)和你，作为个体存在的真实断言的必要条件。这意味着你们每个人都需要是一个单一而自行产生的实体，并且作为不同的存在而不被你的头脑贴上比如 \"(--)\" 和“你”的标签。
        */
        "To confirm that (--) and you are two different existences, each of you must be truly one self-generated entity and exist as different without your mind's labels of \"(--)\" and \"you\".\nThese three qualities are necessary for (--) and you as a genuine claim of individual existence.".localized,
        
        /*
         E: 1. If she is not one entity, she cannot be regarded as one. If she is not one, there can't be a second or third entity,etc.\n2. If she is a product of everything else and their essence, she does not have an individual essence.\n3.The body you perceive can exist without the label ‘person.’ You treat it as a person not because it is a person, but because you created the concept of ‘person,’ projected it onto the body, and then believed your projection to be real.
         A:  كيانًا واحدًا. وإن لم تكن كيانًا واحدًا، فلا يمكن أن يكون هناك كيان ثانٍ أو ثالث.\n\n٢. تفتقر إلى طبيعتها الخاصة التي تُولّدها إلى الوجود، بل هي نتاج طبيعة كونية كأي شيء آخر، وبالتالي فهي مليئة بجوهر كوني لا جوهرها الخاص.\n\n٣. الجسد الذي تدركه يمكن أن يوجد دون تسمية \"شخص\". أنت تعامله كشخص ليس لأنه شخص، ولكن لأنك خلقت مفهوم \"الشخص\"، وأسقطته على الجسد، ثم اعتقدت أن إسقاطك حقيقي.
         H: 1. אם היא אינה ישות אחת, לא ניתן להתייחס אליה כישות אחת. אם היא אינה ישות אחת, גם לא יכולה להיות ישות שנייה או שלישית.\n\n2. חסר לה טבע משלה שיכול ליצור אותה, במקום זאת היא תוצר של טבע אוניברסלי כמו כל דבר אחר, ולכן היא מלאה במהות אוניברסלית ולא שלה.\n\n3. הגוף שאתה תופס יכול להתקיים ללא התווית 'אדם'. אתה מתייחס אליו כאדם לא משום שהוא אדם, אלא משום שיצרת את מושג ה'אדם', הקרנת אותו על הגוף, ואז האמנת שההשלכה שלך אמיתית.
         C: 1. 如果她不是一个实体，她就不能被视为一个实体。如果她不是一个实体，也不可能有第二个或第三个实体。\n\n2. 她缺乏自身能够产生存在的本性，而是像其他一切事物一样，是宇宙本性的产物，因此她充满了宇宙的本质，而非自身的本质。\n\n3. 你所感知的身体可以不带“人”的标签而存在。你把它当作人，并不是因为它是人，而是因为你创造了“人”的概念，把它投射到身体上，然后相信你的投射是真实的。
        */
        "1. If she is not one entity, she cannot be regarded as one. If she is not one, there can't be a second or third entity,etc.\n2. If she is a product of everything else and their essence, she does not have an individual essence.\n3.The body you perceive can exist without the label ‘person.’ You treat it as a person not because it is a person, but because you created the concept of ‘person,’ projected it onto the body, and then believed your projection to be real.".localized
    ]
    
    /*
     E: We understand this is not easy; however, your answer is incorrect.
     A: نحن ندرك أن هذا ليس بالأمر السهل، ولكن إجابتك غير صحيحة.
     H: אנחנו מבינים שזה לא קל; עם זאת, התשובה שלך שגויה.
     C: 我们知道这并不容易；但是，您的答案是错误的。
     */
    let alertMsg = "We understand this is not easy; however, your answer is incorrect.".localized
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionLabel.text = getQuestion(questions[indexOfQuestions]).localized
    }
    
    @IBAction func rephrase(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PopupOpenAiVC") as? PopupOpenAiVC else { return }
        vc.rephraseQuestion = getQuestion(questions[indexOfQuestions])
        vc.isRephrase = true
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @IBAction func onNo(_ sender: Any) {
        if indexOfQuestions == 0 {
            indexOfQuestions = 1
            questionLabel.text = getQuestion(questions[1]).localized
        } else {
            showAlert(title: Constants.APPNAME, message: alertMsg, positive: R.btnOK, negative: nil, positiveAction: { (_) in
                self.navigationController?.popViewController(animated: true)
            }, negativeAction: nil, completion: nil)
        }
        
    }
    
    @IBAction func onYes(_ sender: Any) {
        gotoNext()
    }
    
    @IBAction func sideMenu(_ sender: Any) {
        OrderVC.showSideMenuVC(self)
    }

    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ToNumber1VC") as! ToNumber1VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
