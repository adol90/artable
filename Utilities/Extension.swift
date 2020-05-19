//
//  Extension.swift
//  artable
//
//  Created by Adel Kazme on 26/09/1441 AH.
//  Copyright © 1441 Adel Kazme. All rights reserved.
//

import UIKit
import Firebase



extension UIViewController {
    
    func handleFireAuthError(error : Error) {
        
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            
            let alert = UIAlertController(title: "حدث خطأ", message: errorCode.errorMessage , preferredStyle: .alert)
            let action = UIAlertAction(title: "حسناً", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func simpleAlert(title : String , msg : String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
}


//error.localizedDescription .. هذا طريقة استخراج الكود في الدي بج بطريقة مقروئه
//error ((( ._code ))) ... هذا رقم الكود للخطا في قاعدة بيانات الفاير بيس
// ومن خلاله راح نسحب الرساله حقته ونبدلها برساله من عندنا عن طريق سويتش


extension AuthErrorCode {
    var errorMessage : String {
        switch self {
        case .emailAlreadyInUse:
            return "هذا الايميل مسجل مسبقا بالفعل"
        case .userNotFound:
            return "المستخدم غير موجود ، الرجاء التأكد والمحاولة مره اخرى"
        case .userDisabled:
            return "تم اغلاق الحساب ، تواصل معنا"
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "الايميل غير صحيح"
        case .networkError:
            return "تأكد من اتصالك بالانترنت وحاولمره اخرى"
        case .weakPassword:
            return "كلمة السر ضعيفه، تاكد من ان تكون كلمة السر من ٦ خانات فاكثر"
        case .wrongPassword:
            return "الايميل او كلمة المرور غير صحيحه"
            
        default:
            return "المعذره، حدث خطأ ما."
            
        }
    }
    
}




