import Foundation
import UIKit

// Clears text fields for further inputs
func clear (firstTextField: UITextField, secondTextField: UITextField) {
    firstTextField.text = ""
    secondTextField.text = ""
}

// Converts date from UIDatePicker to String
func dateExtract(datePicker: UIDatePicker) -> String {
    let date = datePicker.date
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/YY"
    
    return dateFormatter.string(from: date)
}

// Creates an emoji according to Income/Expense option
func iconChanger(incomeOrExpense: String)-> String {
    incomeOrExpense == "Income" ? "🟢" : "🔴"
}

// Fills new stack of income/expense
func fillNewExpenseRow(icon: UILabel, amount: UILabel, category: UILabel, date: UILabel, newItem: spend, stack: UIStackView) {
    icon.text = iconChanger(incomeOrExpense: newItem.incomeOrExpense)
    amount.text = String(newItem.amount)
    category.text = newItem.category
    date.text = newItem.date
    stack.backgroundColor = UIColor.systemTeal
    
}

func switchRows(prevIcon: UILabel, currentIcon: UILabel, prevAmount: UILabel, currentAmount: UILabel, prevCategory: UILabel, currentCategory: UILabel, prevDate: UILabel, currentDate: UILabel, currentStack: UIStackView) {
    
    currentIcon.text = prevIcon.text
    currentAmount.text = prevAmount.text
    currentCategory.text = prevCategory.text
    currentDate.text = prevDate.text
    currentStack.backgroundColor = UIColor.systemTeal
}

func balanceChanges(balance: Double, item: spend)-> Double {
    var newBalance = balance
    
    if item.incomeOrExpense == "Income" {
        newBalance += item.amount }
    else { newBalance -= item.amount }
    
    return newBalance
}
