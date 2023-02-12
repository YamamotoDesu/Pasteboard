# Pasteboard
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

<img width="735" alt="" src="https://user-images.githubusercontent.com/47273077/218298151-94c43208-d5c0-47a9-a7e2-ae475b2377af.png">
