//
//  Point1VC.swift
//  CEO
//
//  Created by iStart17 on 1/21/21.
//

import UIKit

class Point1VC: BaseViewController {

    @IBOutlet weak var mVerticalLineStackView: UIStackView!
    @IBOutlet weak var mChoppedCollView: UICollectionView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        /**
         E: Can you see that the person is not one entity, but is composed of parts?
         A:  هل يمكنك رؤية (--) على أنه ليس كائن واحد؟
         H: האם אתה רואה ש- (--) הוא לא יחיד אלא מורכב מחלקים?
         C: 你能看出(--)不是一个实体吗？
         */
        "Can you see that the person is not one entity, but is composed of parts?",
        
        /**
         E: Do you see the red squares indicating the parts?
         A: هل يمكنك رؤية المربعات الحمراء التي تشير إلى الأجزاء؟
         H: האם אתה רואה את הריבועים האדומים שמציינים את החלקים?
         C: 您看到红色方格标记的部分了吗？
         */
        "Do you see the red squares indicating the parts?"
    ]
    
    let alertMsg: [String] = [
        /**
         E: Correct! In Step 1 you’ve recognized that (--) is not one entity but a composite of various parts and halves.\nBy acknowledging this, you’ve taken the first step towards understanding the true nature of existence.\nRemember, (--) is not one entity, and this realization sets the foundation for the next steps in discovering the profound sameness and interconnectedness we all share.\n\nCongratulations. You have completed Step #1.
         A: صحيح! لقد تعرفت في الخطوة 1 على أن (--) ليس كائناً مفردًا ولكن مركب من أجزاء وأنصاف عديدة.\nبالاعتراف بهذا، لقد اتخذت الخطوة الأولى اتجاه فهم الطبيعة الحقيقية للوجود.\nتذكر، (--) ليس كائناً مفردًا، وهذا الإدراك يضع القاعدة الرئيسية للخطوات التالية في اكتشاف التماثل العميق والترابط الذي نشاركه كلنا.\n\nتهانينا! لقد أكملت الخطوة #1.
         H: נכון! זיהית ש-(--) אינו ישות יחידה אלא חיבור של חלקים וחצאים שונים.\nעל ידי הכרה בכך, עשית את הצעד הראשון לקראת הבנת הטבע האמיתי של הקיום.\nזכרו, (--) איננה ישות אחת, וההבנה הזו מציבה את הבסיס לשלבים הבאים בגילוי האחדות העמוקה והקישוריות שכולנו חולקים.\n\nמזל טוב! סיימת נקודה 1
         C: "是，做对了！在第 1 步中，你已经认识到(--)不是一个单一的实体，而是由不同部分和半部分组成的复合体。\n通过承认这一点，你迈出了理解存在的真正本质的第一步。\n记住，(--)不是一个单一的实体，这种认识为下一步发现我们所有人共有的深刻的同一性和相互关联性奠定了基础。\n\n祝贺你！你已经完成了第一步。"
         */
        "Correct! In Step 1 you’ve recognized that (--) is not one entity but a composite of various parts and halves.\nBy acknowledging this, you’ve taken the first step towards understanding the true nature of existence.\nRemember, (--) is not one entity, and this realization sets the foundation for the next steps in discovering the profound sameness and interconnectedness we all share.\n\nCongratulations. You have completed Step #1.",
        
        /**
         E: Really? In that case, something is not right with your phone's display, but please keep going.
         A: حقا؟ في هته الحالة، هناك شيء لا يُعرض بشكل صحيح على هاتفك، ولكن الرجاء تابع المحاولة.
         H: באמת? במקרה כזה, משהו לא בסדר עם תצוגת הטלפון שלך, אבל בבקשה המשך.
         C: 真的吗？这样的话，您手机上的某些内容显示不正确，但请继续。
         */
        "Really? In that case, something is not right with your phone's display, but please keep going.",
        
        /**
         E: We understand this is not easy; however, your answer is incorrect.
         A:  نحن نفهم بأن هذا صعب، ولكن إجابتك غير صحيحة.
         H:  אנו מבינים שזה לא קל. אבל, תשובתך אינה נכונה
         C: 我们理解这很有挑战性；但是，您的答案是错误的。
         */
        "We understand this is not easy; however, your answer is incorrect."
        ]
    
    let tiles = UIImage(named: g_pictureName)?.divide()
    var imgProcessiongFinishedObserver: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .white
        
        /**
         E: 1. Is (--) one entity?
         A: هل (--)  كيان واحد؟
         H: האם (--) הינו/הינה יישות אחת?
         C: (--)是单个实体吗？
         */
        label.text = getQuestion("1. Is (--) one entity?".localized)
        self.navigationItem.titleView = label
        
        questionLabel.text = getQuestion(questions[indexOfQuestions].localized)
        
        mChoppedCollView.delegate = self
        mChoppedCollView.dataSource = self
        mChoppedCollView.forceLeftToRight()
        mChoppedCollView.reloadData()
        
        imgProcessiongFinishedObserver = NotificationCenter.default.addObserver(forName: .processiongFinished, object: nil, queue: .main, using: { (notiCenter) in
            self.mChoppedCollView.isHidden = false
            
            /**
             E: Notice
             A: ملاحظة
             H: הערה
             C: 注意
             */
            
            /**
             E: Click on the photo.
             A: انقر على الصورة.
             H: לחץ על התמונה.
             C: 点击照片。
             */
            self.showAlert(title: "Notice".localized, message: "Click on the photo.".localized, positive: R.btnOK.localized, negative: nil)
        })
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onShareAction))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ImgProcessingVC") as! ImgProcessingVC
        self.present(vc, animated: true, completion: nil)
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
    
    @IBAction func sideMenu(_ sender: Any) {
        IntroVC.showSideMenuVC(self)
    }
    
    @IBAction func onNo(_ sender: Any) {
        if indexOfQuestions == 0 {
            showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[1].localized), positive: R.btnOK.localized, negative: nil, positiveAction: { (_) in
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
        } else {
            showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[2].localized), positive: R.btnOK.localized, negative: nil, positiveAction: { (_) in
                self.goBackStartOver()
            }, negativeAction: nil, completion: nil)
        }
    }
    
    @IBAction func onYes(_ sender: Any) {
        showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[0].localized), positive: R.btnPoint2.localized, negative: nil, positiveAction: { (_) in
            self.gotoNext()
        }, negativeAction: nil, completion: nil)
        /*
        if indexOfQuestions == 0 {
            showAlert(title: Constants.APPNAME, message: alertMsg[0], positive: R.btnPoint2, negative: nil, positiveAction: { (_) in
                self.gotoNext()
            }, negativeAction: nil, completion: nil)
        } else {
            showAlert(title: Constants.APPNAME, message: alertMsg[0], positive: R.btnPoint2, negative: nil, positiveAction: { (_) in
                self.gotoNext()
            }, negativeAction: nil, completion: nil)
        }*/
    }
    
    private func updateQuestion() {
        indexOfQuestions += 1
        questionLabel.text = getQuestion(questions[indexOfQuestions].localized)
    }

    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "Point2VC") as! Point2VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Collection view data source
extension Point1VC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return g_rows * g_cols
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChopCell", for: indexPath as IndexPath) as! ChopCell
        cell.setCell(tile: tiles![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ImgShowVC") as! ImgShowVC
        g_chopImage = tiles![indexPath.row].tile
        tiles![indexPath.row].clicked = !tiles![indexPath.row].clicked
        collectionView.reloadItems(at: [indexPath])
        present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collWidth = SCREEN_WIDTH
        
        let contentWidth  = collWidth/8
        let contentHeight = contentWidth
        
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    
}

extension UIView {
    func forceLeftToRight() {
        semanticContentAttribute = .forceLeftToRight
        subviews.forEach { (view) in
            view.forceLeftToRight()
        }
        if let textFiled = self as? UITextField {
            textFiled.textAlignment = .left
        }
        if let label = self as? UILabel {
            label.textAlignment = .left
        }
    }
}
