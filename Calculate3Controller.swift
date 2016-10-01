
import UIKit

class Calculate3Controller: UIViewController , UITextFieldDelegate {
    @IBOutlet weak var Player1Name: UITextField!
    @IBOutlet weak var Player2Name: UITextField!
    @IBOutlet weak var Player3Name: UITextField!
   
    
    @IBOutlet weak var Score1: UITextField!
    @IBOutlet weak var Score2: UITextField!
    @IBOutlet weak var Score3: UITextField!
    
    @IBOutlet weak var Result1: UILabel!
    @IBOutlet weak var Result2: UILabel!
    @IBOutlet weak var Result3: UILabel!
    
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    @IBOutlet weak var Image3: UIImageView!
    
    @IBOutlet weak var CalculateButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    
    @IBOutlet weak var keisannlabel: UILabel!
    @IBOutlet weak var ContLabel: UILabel!
    
    @IBOutlet weak var addScroll1: UIScrollView!
    @IBOutlet weak var addScroll2: UIScrollView!
    @IBOutlet weak var addScroll3: UIScrollView!
    
    var ScoreValue1:Int = 0
    var ScoreValue2:Int = 0
    var ScoreValue3:Int = 0
    
    
    var Result_Value1:Int = 0
    var Result_Value2:Int = 0
    var Result_Value3:Int = 0
    
    
    var Result_Value1_Save = 0
    var Result_Value2_Save = 0
    var Result_Value3_Save = 0
    
    
    var Result_Value1_Save2 = 0
    var Result_Value2_Save2 = 0
    var Result_Value3_Save2 = 0
    
    
    var member_number = 3
    
    var Max1 = 0
    var Max2 = 0
    var Max3 = 0
   
    
    var Flag1 = 1
    var Flag2 = 1
    var Flag3 = 1
   
    var Point: [Int] = []
    
    var Result: [Int] = []
    var i = 0
    var j = 0
    var t = 0
    var count = 0
    var first = 0
    var second = 0
    var third = 0
    
    var count_string = "0"
    
    var beforeResult1 = 0
    var beforeResult2 = 0
    var beforeResult3 = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Player1Name.delegate = self
        Player2Name.delegate = self
        Player3Name.delegate = self
        
        Score1.delegate = self
        Score2.delegate = self
        Score3.delegate = self
        
        Score1.keyboardType = UIKeyboardType.NumberPad
        Score2.keyboardType = UIKeyboardType.NumberPad
        Score3.keyboardType = UIKeyboardType.NumberPad
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        
        if let ResultSave1 = userDefaults.stringForKey("Result1_3") {
            Result1.text = ResultSave1
        }
        if let ResultSave2 = userDefaults.stringForKey("Result2_3") {
            Result2.text = ResultSave2
        }
        if let ResultSave3 = userDefaults.stringForKey("Result3_3") {
            Result3.text = ResultSave3
        }

        
        if let PlayerNameSave1 = userDefaults.stringForKey("PlayerName1_3") {
            Player1Name.text = PlayerNameSave1
        }
        if let PlayerNameSave2 = userDefaults.stringForKey("PlayerName2_3") {
            Player2Name.text = PlayerNameSave2
        }
        if let PlayerNameSave3 = userDefaults.stringForKey("PlayerName3_3") {
            Player3Name.text = PlayerNameSave3
        }
        
        if let keisannlabelSave4 = userDefaults.stringForKey("keisannlavel_3") {
            keisannlabel.text = keisannlabelSave4
        }
        if let ContLabelSave4 = userDefaults.stringForKey("ContLabel_3") {
            ContLabel.text = ContLabelSave4
        }
        if let count1 = userDefaults.stringForKey("count_3") {
            count_string = count1
        }
        
        
        CalculateButton.layer.cornerRadius = 2
        CalculateButton.layer.masksToBounds = true
        CalculateButton.layer.borderWidth = 2
        CalculateButton.layer.borderColor = UIColor.orangeColor().CGColor
        
        ResetButton.layer.cornerRadius = 2
        ResetButton.layer.masksToBounds = true
        ResetButton.layer.borderWidth = 2
        ResetButton.layer.borderColor = UIColor.orangeColor().CGColor
        
        
        
        Player1Name.placeholder = "名前"
        Score1.placeholder = "得点"
        
        count += Int(count_string)!
        
        
        Player1Name.addUnderline(2.0, color: UIColor.grayColor())
        Player2Name.addUnderline(2.0, color: UIColor.grayColor())
        Player3Name.addUnderline(2.0, color: UIColor.grayColor())
       
        
        Score1.addUnderline(2.0, color: UIColor.grayColor())
        Score2.addUnderline(2.0, color: UIColor.grayColor())
        Score3.addUnderline(2.0, color: UIColor.grayColor())
        
    }
    
    @IBAction func CalculateAction(sender: AnyObject) {
        
        Image1.image = UIImage()
        Image2.image = UIImage()
        Image3.image = UIImage()
        
        
        if(Score1.text == ""){
            Score1.text = "0"
        }
        if(Score2.text == ""){
            Score2.text = "0"
        }
        if(Score3.text == ""){
            Score3.text = "0"
        }
        
        
        self.ScoreValue1 = Int(Score1.text!)!
        self.ScoreValue2 = Int(Score2.text!)!
        self.ScoreValue3 = Int(Score3.text!)!
        
        
        self.beforeResult1 = Int(Result1.text!)!
        self.beforeResult2 = Int(Result2.text!)!
        self.beforeResult3 = Int(Result3.text!)!
        
        
        self.Result_Value1 = self.ScoreValue1 * (member_number-1) - (self.ScoreValue2 + self.ScoreValue3) + self.beforeResult1
        self.Result_Value2 = self.ScoreValue2 * (member_number-1) - (self.ScoreValue1 + self.ScoreValue3) + self.beforeResult2
        self.Result_Value3 = self.ScoreValue3 * (member_number-1) - (self.ScoreValue1 + self.ScoreValue2) + self.beforeResult3
        
        
        Result1.text = String(self.Result_Value1)
        Result2.text = String(self.Result_Value2)
        Result3.text = String(self.Result_Value3)
       
        
        Point = [self.Result_Value1, self.Result_Value2, self.Result_Value3]
        
        for i in 0 ... 2 {
            for j in 0 ... 2 {
                if(Point[i] > Point[j]){
                    t = Point[i]
                    Point[i] = Point[j]
                    Point[j] = t
                }
            }
        }
        
        first = Point[0]
        second = Point[1]
        third = Point[2]
       
        
        if(first == second){
            if(first == self.Result_Value1 && second == self.Result_Value2){
                Image1.image = UIImage(named: "Gold.png")
                Image2.image = UIImage(named: "Gold.png")
            }else if(first == self.Result_Value1 && second == self.Result_Value3){
                Image1.image = UIImage(named: "Gold.png")
                Image3.image = UIImage(named: "Gold.png")
            }else if(first == self.Result_Value2 && second == self.Result_Value3){
                Image2.image = UIImage(named: "Gold.png")
                Image3.image = UIImage(named: "Gold.png")
            }
            
            if(first == third){
                
                if(third == self.Result_Value1){
                    Image1.image = UIImage(named: "Gold.png")
                }
                if(third == self.Result_Value2){
                    Image2.image = UIImage(named: "Gold.png")
                }
                if(third == self.Result_Value3){
                    Image3.image = UIImage(named: "Gold.png")
                }
            }else{
                if(third == self.Result_Value1){
                    Image1.image = UIImage(named: "Silver.png")
                }
                if(third == self.Result_Value2){
                    Image2.image = UIImage(named: "Silver.png")
                }
                if(third == self.Result_Value3){
                    Image3.image = UIImage(named: "Silver.png")
                }
            }
        }else{
            if(first == self.Result_Value1 && second == self.Result_Value2){
                Image1.image = UIImage(named: "Gold.png")
                Image2.image = UIImage(named: "Silver.png")
            }else if(first == self.Result_Value2 && second == self.Result_Value1){
                Image2.image = UIImage(named: "Gold.png")
                Image1.image = UIImage(named: "Silver.png")
            }else if(first == self.Result_Value1 && second == self.Result_Value3){
                Image1.image = UIImage(named: "Gold.png")
                Image3.image = UIImage(named: "Silver.png")
            }else if(first == self.Result_Value3 && second == self.Result_Value1){
                Image3.image = UIImage(named: "Gold.png")
                Image1.image = UIImage(named: "Silver.png")
            }else if(first == self.Result_Value2 && second == self.Result_Value3){
                Image2.image = UIImage(named: "Gold.png")
                Image3.image = UIImage(named: "Silver.png")
            }else if(first == self.Result_Value3 && second == self.Result_Value2){
                Image3.image = UIImage(named: "Gold.png")
                Image2.image = UIImage(named: "Silver.png")
            }
            
            if(second == third){
                if(third == self.Result_Value1){
                    Image1.image = UIImage(named: "Silver.png")
                }
                if(third == self.Result_Value2){
                    Image2.image = UIImage(named: "Silver.png")
                }
                if(third == self.Result_Value3){
                    Image3.image = UIImage(named: "Silver.png")
                }
            }else{
                if(third == self.Result_Value1){
                    Image1.image = UIImage(named: "Bronze.png")
                }
                if(third == self.Result_Value2){
                    Image2.image = UIImage(named: "Bronze.png")
                }
                if(third == self.Result_Value3){
                    Image3.image = UIImage(named: "Bronze.png")
                }
            }
        }
        
        count++
        
        keisannlabel.text = "計算ボタンは"
        ContLabel.text = String(count) + "回押されました"
        count_string = String(count);
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(Score1.text, forKey: "Score1_3")
        userDefaults.setObject(Score2.text, forKey: "Score2_3")
        userDefaults.setObject(Score3.text, forKey: "Score3_3")
        
        
        userDefaults.setObject(Result1.text, forKey: "Result1_3")
        userDefaults.setObject(Result2.text, forKey: "Result2_3")
        userDefaults.setObject(Result3.text, forKey: "Result3_3")
        
        userDefaults.setObject(Player1Name.text, forKey: "PlayerName1_3")
        userDefaults.setObject(Player2Name.text, forKey: "PlayerName2_3")
        userDefaults.setObject(Player3Name.text, forKey: "PlayerName3_3")

        userDefaults.setObject(keisannlabel.text, forKey: "keisannlavel_3")
        userDefaults.setObject(ContLabel.text, forKey: "ContLabel_3")
        userDefaults.setObject(count_string, forKey: "count_3")
        
        userDefaults.synchronize()
        
        
        Score1.text = ""
        Score2.text = ""
        Score3.text = ""

    }
    
    
    
    @IBAction func ResetAction(sender: AnyObject) {
        Result1.text = "0"
        Result2.text = "0"
        Result3.text = "0"
        
        Score1.text = ""
        Score2.text = ""
        Score3.text = ""
        
        
        Image1.image = UIImage()
        Image2.image = UIImage()
        Image3.image = UIImage()
        
        
        count = 0
        
        keisannlabel.text = ""
        ContLabel.text = ""
        count_string = "0"
        
        self.Result_Value1_Save = 0
        self.Result_Value2_Save = 0
        self.Result_Value3_Save = 0
       
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(Score1.text, forKey: "Score1_3")
        userDefaults.setObject(Score2.text, forKey: "Score2_3")
        userDefaults.setObject(Score3.text, forKey: "Score3_3")
        
        
        userDefaults.setObject(Result1.text, forKey: "Result1_3")
        userDefaults.setObject(Result2.text, forKey: "Result2_3")
        userDefaults.setObject(Result3.text, forKey: "Result3_3")
        
        
        userDefaults.setObject(Player1Name.text, forKey: "PlayerName1_3")
        userDefaults.setObject(Player2Name.text, forKey: "PlayerName2_3")
        userDefaults.setObject(Player3Name.text, forKey: "PlayerName3_3")
        
        
        userDefaults.setObject(keisannlabel.text, forKey: "keisannlavel_3")
        userDefaults.setObject(ContLabel.text, forKey: "ContLabel_3")
        userDefaults.setObject(count_string, forKey: "count_3")
        
        userDefaults.synchronize()

    }
    
    @IBAction func TapAction(sender: AnyObject) {
        addScroll1.endEditing(true)
        addScroll2.endEditing(true)
        addScroll3.endEditing(true)

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

