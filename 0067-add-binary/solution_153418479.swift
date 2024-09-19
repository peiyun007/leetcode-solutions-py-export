private extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.endIndex, offsetBy: -index-1)]
    }
}
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var carry = 0
        let aChars = Array(a), bChars = Array(b)
        var i = aChars.count - 1, j = bChars.count - 1
        var result = ""
        while i >= 0 || j >= 0 || carry > 0 {
            var sum = carry
            if i >= 0 {
               sum += Int(String(aChars[i])) ?? 0
                i -= 1
            }
            if j >= 0 {
                sum += Int(String(bChars[j])) ?? 0
                j -= 1
            }
            print("sum = \(sum)")
            carry = sum / 2
            sum = sum % 2
            result = String(sum) + result
        }
        return result
    }
}