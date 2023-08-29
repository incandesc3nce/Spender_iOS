
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var budgetEntry: UIButton!
    
    @IBOutlet weak var budgetValue: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    
    @IBAction func budgetEnter(_ sender: UIButton) {
        /* 
         This condition checks if text field on 1st VC
         has proper value (Double) that can be used as a
         budget. Keyboard is a number pad, but still,
         someone can get letters here.
         */
        if Double(budgetValue.text!) != nil && Double(budgetValue.text!)! >= 0{
            /* If yes, then we are permanently navigated
             to main VC.
             */
            let mainVC = storyboard?.instantiateViewController(withIdentifier: "ViewControllerMain") as! ViewControllerMain
            
            // Transfers enterred budget value to main VC
            mainVC.enteredValue = budgetValue.text
            
            mainVC.modalPresentationStyle = .fullScreen
            present(mainVC, animated: true)
            
        } else {
            // Error message, duh.
            let alertController = UIAlertController(title: "Error", message: "Budget value is incorrect", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { action in
                
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}

