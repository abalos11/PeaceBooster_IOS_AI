//
//  OnboardingVC.swift
//  WCWC
//
//  Created by SD on 14/05/2025.
//  Copyright © 2025 iStart17. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    private let items: [Onboarding] = [
        
        /*
         en: Let’s begin
         ar: لنبدأ
         he: בואו נתחיל
         chin: 讓我們開始吧
         
         ------------------
         
         en: Welcome to Peace Booster
         ar: مرحباً بكم في Peace Booster
         he: ברוכים הבאים ל-Peace Booster
         chin: 欢迎来到 Peace Booster
         
         ------------------
         
         en: True peace does not need more concepts or effort. You’re here to remember the deep calm and quiet strength that have always been yours.
         ar: السلام الحقيقي لا يتطلب مزيدًا من الأفكار أو الجهود. أنت هنا لتتذكر قوة السلام والهدوء العميقين اللذين لطالما امتلكتهما.
         he: שלום אמיתי אינו זקוק ליותר מושגים או מאמץ. אתה כאן כדי לזכור את השלווה העמוקה והכוח השקט שתמיד היו שלך.
         chin: 真正的宁静不需要更多概念或努力。你来到这里是为了重拾那份一直属于你的深层平静和沉静的力量。
        */
        
        Onboarding(image: "Page1",
                   topTitle: "Let’s begin".localized,
                   title: "Welcome to Peace Booster".localized,
                   subTitle: "True peace does not need more concepts or effort. You’re here to remember the deep calm and quiet strength that have always been yours.".localized),
        
        /*
         en: Let’s go deeper
         ar: دعونا نذهب أعمق
         he: בואו נעמיק
         chin: 讓我們更深入地了解
         
         ------------------
         
         en: It’s More Than Just Calm
         ar: إنه أكثر من مجرد هدوء
         he: זה יותר מסתם רוגע
         chin: 这不仅仅是平静
         
         ------------------
         
         en: Real peace isn’t just the absence of conflict—it’s the presence of unshakable clarity and wisdom that dissolve anxiety, conflict, and fear at the roots.
         ar: السلام الحقيقي لا يعني مجرد غياب الصراع، بل هو وجود الوضوح والحكمة الراسخة التي تذيب القلق والصراع والخوف من جذورها.
         he: שלום אמיתי אינו רק היעדר קונפליקט - זוהי נוכחות של בהירות וחוכמה בלתי מעורערות שממיסות חרדה, קונפליקט ופחד מהשורשים.
         chin: 真正的宁静不只是没有冲突——而是拥有不可动摇的清明和智慧，从根源上化解焦虑、冲突和恐惧。
         */
        
        Onboarding(image: "Page2",
                   topTitle: "Let’s go deeper".localized,
                   title: "It’s More Than Just Calm".localized,
                   subTitle: "Real peace isn’t just the absence of conflict—it’s the presence of unshakable clarity and wisdom that dissolve anxiety, conflict, and fear at the roots.".localized),
        
        /*
         en: A Daily Ritual for Peace
         ar: طقوس يومية من أجل السلام
         he: טקס יומי לשלום
         chin: 日常宁静惯例
         
         en: Each day, you’ll be guided to gently release old patterns and illusions. Watch them dissolve—and feel your natural calm return.
         ar: كل يوم، ستُرشدك للتخلص من الأنماط والأوهام القديمة بلطف. شاهدها تتلاشى، واشعر بعودة هدوئك الطبيعي.
         he: בכל יום, תונחו לשחרר בעדינות דפוסים ואשליות ישנות. צפו בהם מתמוססים - והרגישו את השלווה הטבעית שלכם חוזרת.
         chin: 内容：每天，你将被引导温和地释放旧的模式和幻象。看着它们消散——感受你天然的平静回归。
        */
        
        Onboarding(image: "Page3",
                   title: "A Daily Ritual for Peace".localized,
                   subTitle: "Each day, you’ll be guided to gently release old patterns and illusions. Watch them dissolve—and feel your natural calm return.".localized),
        
        /*
         en: Start Now
         ar: ابدأ الآن
         he: התחל עכשיו
         chin: 立即開始
         
         en: A Path to Global Calm
         ar: الطريق إلى الهدوء العالمي
         he: דרך לשקט עולמי
         chin: 通向全球平静之路
         
         en: True peace begins within and radiates outward. Offered in 4 languages—so you can find clarity wherever you are and help resolve conflict at every level.
         ar: السلام الحقيقي يبدأ من الداخل وينتشر إلى الخارج. متوفر بأربع لغات، لتجد الوضوح أينما كنت، وتساعد في حل النزاعات على جميع المستويات.
         he: שלום אמיתי מתחיל מבפנים וקורן החוצה. מוצע ב-4 שפות - כך שתוכלו למצוא בהירות בכל מקום שאתם נמצאים ולעזור לפתור סכסוכים בכל רמה.
         chin: 真正的宁静始于内心，向外辐射。提供4种语言版本——让你无论身在何处都能找到清明，并帮助在各个层面化解冲突。
        */
        
        Onboarding(image: "Page4",
                   topTitle: "Start Now".localized,
                   title: "A Path to Global Calm".localized,
                   subTitle: "True peace begins within and radiates outward. Offered in 4 languages—so you can find clarity wherever you are and help resolve conflict at every level.".localized),
        
        /*
         en: Begin the journey
         ar: ابدأ الرحلة
         he: התחל את המסע
         chin: 最终邀请
         
         en: Your Calm Changes Everything
         ar: هدوؤك يغير كل شيء
         he: השלווה שלך משנה הכל
         chin: 你的平静改变一切
         
         en: Each day, you’ll be guided to gently release old patterns and illusions. Watch them dissolve—and feel your natural calm return.
         ar: كل يوم، ستُرشدك للتخلص من الأنماط والأوهام القديمة بلطف. شاهدها تتلاشى، واشعر بعودة هدوئك الطبيعي.
         he: בכל יום, תונחו לשחרר בעדינות דפוסים ואשליות ישנות. צפו בהם מתמוססים - והרגישו את השלווה הטבעית שלכם חוזרת.
         chin: 当你看透分离的幻象时，恐惧会消退，宁静会扩展。你的平静成为触动整个世界的浪潮。
        */
        
        Onboarding(image: "Page5",
                   topTitle: "Begin the journey".localized,
                   title: "Your Calm Changes Everything".localized,
                   subTitle: "Each day, you’ll be guided to gently release old patterns and illusions. Watch them dissolve—and feel your natural calm return.".localized)
    ]
    private var currentPage: Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == items.count - 1 {
                nextButton.setTitle("Get started".localized, for: .normal)
            } else {
                nextButton.setTitle("Next".localized, for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCollectionView()
    }
    
    @IBAction func next(_ sender: Any) {
        if currentPage == items.count - 1 {
            WindowManager.shared.show(.main, animated: true, withReset: false)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func skip(_ sender: Any) {
        WindowManager.shared.show(.main, animated: true, withReset: false)
    }
}

extension OnboardingVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    private func setupCollectionView() {
        collectionView.registerCell(id: OnboardingCollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = items.count
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionCell.identifier, for: indexPath) as! OnboardingCollectionCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

extension UICollectionViewFlowLayout {
    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return Language.current.isRTL
    }
}

extension OnboardingVC: Storyboarded {
    static var storyboardName: StoryboardName = .onboarding
}
