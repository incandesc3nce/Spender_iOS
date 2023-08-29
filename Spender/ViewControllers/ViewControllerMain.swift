import UIKit

class ViewControllerMain: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var balanceValue: UILabel!
    
    // All of the expense rows.
    @IBOutlet weak var icon1: UILabel!
    @IBOutlet weak var amount1: UILabel!
    @IBOutlet weak var category1: UILabel!
    @IBOutlet weak var date1: UILabel!
    @IBOutlet weak var stack1: UIStackView!
    
    @IBOutlet weak var icon2: UILabel!
    @IBOutlet weak var amount2: UILabel!
    @IBOutlet weak var category2: UILabel!
    @IBOutlet weak var date2: UILabel!
    @IBOutlet weak var stack2: UIStackView!
    
    @IBOutlet weak var icon3: UILabel!
    @IBOutlet weak var amount3: UILabel!
    @IBOutlet weak var category3: UILabel!
    @IBOutlet weak var date3: UILabel!
    @IBOutlet weak var stack3: UIStackView!
    
    
    @IBOutlet weak var incomeExpenseButton: UIButton!
    @IBOutlet weak var categoryInput: UITextField!
    @IBOutlet weak var amountInput: UITextField!
    @IBOutlet weak var dateInput: UIDatePicker!
    
    var enteredValue: String?
    var incomeOrExpense: String = ""
    var balance: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Additional setup for a user
        balanceValue.text = enteredValue
        balance = Double(balanceValue.text!)!
        
        let stackColor = UIColor(hex: "#3B4655")
        
        // Turning all stacks of expenses/incomes to blank
        // and setting a color of VStack
        icon1.text = ""
        amount1.text = ""
        category1.text = ""
        date1.text = ""
        stack1.backgroundColor = stackColor
        
        icon2.text = ""
        amount2.text = ""
        category2.text = ""
        date2.text = ""
        stack2.backgroundColor = stackColor
        
        icon3.text = ""
        amount3.text = ""
        category3.text = ""
        date3.text = ""
        stack3.backgroundColor = stackColor
        
        // Drop down menu setup
        let incomeOption = UIAction(title: "Income") { action in
            self.incomeOrExpense = action.title
            self.incomeExpenseButton.setTitle("Income", for: .normal)
        }
        let expenseOption = UIAction(title: "Expense") { action in
            self.incomeOrExpense = action.title
            self.incomeExpenseButton.setTitle("Expense", for: .normal)
        }
        
        let menu = UIMenu(title: "Select an option", children: [incomeOption, expenseOption])
        incomeExpenseButton.menu = menu
        
    }
    
    @IBAction func incomeAction(_ sender: Any) {
        
    }
    
    
    @IBAction func addNewItem(_ sender: UIButton) {
        if Double(amountInput.text!) == nil || Double(amountInput.text!)! < 0 {
            let alertController = UIAlertController(title: "Error", message: "Budget value is incorrect", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { action in
                
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        
        let newItem = spend(incomeOrExpense: incomeOrExpense, category: categoryInput.text!, amount: Double(amountInput.text!)!, date: dateExtract(datePicker: dateInput))
        
        if icon1.text == "" {
            
            fillNewExpenseRow(icon: icon1, amount: amount1, category: category1, date: date1, newItem: newItem, stack: stack1)
            
            
        } else if icon2.text == "" {
            
            switchRows(prevIcon: icon1, currentIcon: icon2, prevAmount: amount1, currentAmount: amount2, prevCategory: category1, currentCategory: category2, prevDate: date1, currentDate: date2, currentStack: stack2)
            
            fillNewExpenseRow(icon: icon1, amount: amount1, category: category1, date: date1, newItem: newItem, stack: stack1)
            
            
        } else {
            
            switchRows(prevIcon: icon2, currentIcon: icon3, prevAmount: amount2, currentAmount: amount3, prevCategory: category2, currentCategory: category3, prevDate: date2, currentDate: date3, currentStack: stack3)
            switchRows(prevIcon: icon1, currentIcon: icon2, prevAmount: amount1, currentAmount: amount2, prevCategory: category1, currentCategory: category2, prevDate: date1, currentDate: date2, currentStack: stack2)
            
            fillNewExpenseRow(icon: icon1, amount: amount1, category: category1, date: date1, newItem: newItem, stack: stack1)
            
            
        }
        balance = balanceChanges(balance: balance, item: newItem)
        balanceValue.text = String(balance)
        
        clear(firstTextField: categoryInput, secondTextField: amountInput)
    }
}

