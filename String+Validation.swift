import Foundation

public extension String {

    public func isEmail() -> Bool {
        return match(Regex.email.pattern)
    }

    public func isNumber() -> Bool {
        return match(Regex.number.pattern)
    }
    
    public func isFullName() -> Bool {
        return match(Regex.fullNames.pattern)
    }

    public func isPasswordValid() -> Bool {
        return match(Regex.validPassword.pattern)
    }
    
    public func haveAtleaseOneSpecialSymbol() -> Bool {
        return match(Regex.haveAtleaseOneSpecialSymbol.pattern)
    }
    
    func haveAtleaseOneUppercase() -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: self)
    }
    
    func containsEightDigits() -> Bool {
        return match(Regex.containsEightDigits.pattern)
    }
    
    func haveAtleaseOneLowercase() -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", "(.*[a-z].*)").evaluate(with: self)
    }
    
    public func haveAtleaseOneDigit() -> Bool {
        return match(Regex.atleaseOneNumber.pattern)
    }
}
