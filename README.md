# Why should you clear your pasteboard when exiting your app?
<img width="300" src="https://user-images.githubusercontent.com/47273077/218298094-9fd9434a-b373-4b9d-b2cc-0c77302704ca.gif">

```swift
class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pasteboardText = UIPasteboard.general.string ?? "Pasteboard is empty"
        textView.text = pasteboardText
    }


}
```

## By enableing Secure Text Entry
<img width="735" alt="" src="https://user-images.githubusercontent.com/47273077/218298151-94c43208-d5c0-47a9-a7e2-ae475b2377af.png">

<img width="300" src="https://user-images.githubusercontent.com/47273077/218298535-087b6806-cc60-4a6f-bf1f-b939e42399aa.gif">

## Clear UIPasteBoard
```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        UIPasteboard.general.items = [[String: Any]()]
    }
```

<img width="300" src="https://user-images.githubusercontent.com/47273077/218298796-e175e0a2-af11-4096-b90c-b2933910a594.gif">

## Prepare your UI for the app snapshot
https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_background
<img width="721" alt="スクリーンショット_2023_02_12_18_14" src="https://user-images.githubusercontent.com/47273077/218302472-61033623-c214-45b5-a86a-31cda6418fc5.png">
<img width="996" alt="スクリーンショット_2023_02_12_18_11" src="https://user-images.githubusercontent.com/47273077/218302455-5a77b9ba-1ce4-4009-bb95-56c664bfd0bc.png">

