class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        var ans = [Character]()
        var found = false
        for c in word {
            if !found {
                ans.insert(c, at: 0)
            } else {
                ans.append(c)
            }
            if c == ch {
                found = true
            }
        }
        if !found {
            return word
        } else {
            return String(ans)
        }
    }
}