//
//  Summary3VC.swift
//  CEO
//
//  Created by iStart17 on 1/29/21.
//

import UIKit

class Summary3VC: BaseViewController {

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onShareAction))
        
        /**
         E: By navigating the fundamental aspects of existence, you’ve grasped that (--) and you share the same origin and essence, devoid of any individual nature.\nAny distinctions between you and others arise from the shared universal nature, and not from your individual essence. These distinctions are not true differences, as they belong to the whole of nature rather than any one person. They are relative and exist only as labels we assign.\nUnderstanding the sameness we all share eliminates the basis for conflicts and unhappiness.\nRecognizing this reality is pivotal, as any conflict between you two or anyone else is fundamentally a conflict against oneself.\nA true peace and happiness await those who comprehend and practice this profound understanding.
         A: !\n\nمن خلال التنقل عبر الجوانب الأساسية للوجود، لقد أدركت بأن (--) و أنت تشتركان نفس الأصل و الجوهر، و تفتقران لأية طبيعة فردية.\nأي تميزات بينكما لا تنتمي إليكما بل تنتمي للكون و توجد في تسميات لا أكثر.\nفهم التماثل الذي نتشاركه كلنا يقضي على أساس الصراعات و الحزن.\nالتعرف على هذا الواقع أمر ضروري، لأن أي نزاع بينكما أو بين أي أحد اخر هو في الأساس نزاع ضد نفسك.\nالسلام و السعادة الحقيقية تنتظر الذين يفهمون و يمارسون هذا المفهوم العميق.
         H:  ניווט בהיבטים הבסיסיים של הקיום, הבנתם את זה (--) ואתם חולקים את אותו המקור והמהות, ללא שום אופי אינדיבידואלי.\nכל הבדלים ביניכם הם יחסיים ומתקיימים בתוויות בלבד.\nהבנת האחדות שכולנו חולקים מבטלת את הבסיס לקונפליקטים.\nההכרה במציאות הזו היא חיונית, שכן כל עימות בינכם או כל אחד אחר מתנגש ביסודו נגד עצמו.\nשלווה ואושר אמיתיים מחכים לאלה שמבינים ומתרגלים את ההבנה העמוקה הזו.
         C: 正确，恭喜！\n\n通过探索存在的基本方面，你已经掌握了(--)和你拥有相同的起源和本质，没有任何个体本质。\n你与他人之间的任何区别都源于共同的普遍本性，而不是来自你的个体本质。\n这些区别并非真正的差异，因为它们属于整个自然界，而不属于任何个人。\n它们是相对的，只是作为我们赋予的标签而存在。\n理解我们所有人共有的同一性，就消除了冲突和不幸的基础。\n认识到这一现实至关重要，因为你们俩或其他人之间的任何冲突从根本上说都是与自己的冲突。\n真正的和平与幸福正等待着那些理解并实践这一深刻理解的人。
         */
        descriptionTextView.text = getQuestion("By navigating the fundamental aspects of existence, you’ve grasped that (--) and you share the same origin and essence, devoid of any individual nature.\nAny distinctions between you and others arise from the shared universal nature, and not from your individual essence. These distinctions are not true differences, as they belong to the whole of nature rather than any one person. They are relative and exist only as labels we assign.\nUnderstanding the sameness we all share eliminates the basis for conflicts and unhappiness.\nRecognizing this reality is pivotal, as any conflict between you two or anyone else is fundamentally a conflict against oneself.\nA true peace and happiness await those who comprehend and practice this profound understanding.".localized)
    }
    
    @IBAction func rephrase(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PopupOpenAiVC") as? PopupOpenAiVC else { return }
        vc.rephraseQuestion = descriptionTextView.text
        vc.isRephrase = true
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }

    @IBAction func sideMenu(_ sender: Any) {
        IntroVC.showSideMenuVC(self)
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
