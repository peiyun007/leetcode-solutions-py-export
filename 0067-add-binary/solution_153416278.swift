private extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.endIndex, offsetBy: -index-1)]
    }
}
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var addition = 0
        var i = 0
        var result = ""
        while(true) {
            if i >= a.count && i >= b.count {
                if addition != 0 {
                    result.insert(Character(String(addition)), at: result.startIndex)
                }
                break
            }
            let x = i < a.count ? (Int(String(a[i])) ?? 0) : 0
            let y = i < b.count ? (Int(String(b[i])) ?? 0) : 0
            print("x = \(x), y = \(y)")
            let sum = (x + y + addition) % 2
            addition = (x + y + addition) / 2
            result.insert(Character(String(sum)), at: result.startIndex)
            i += 1
        }
        return result
    }
}