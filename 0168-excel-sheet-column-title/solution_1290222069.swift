class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        var x = columnNumber
        var ans = [Character]()
        while x > 0 {
            let rem = x % 26
            if rem == 0 {
                x -= 1
            }
            ans.insert(getCh(rem), at: 0)
            x = x / 26
        }
        return String(ans)
    }

    func getCh(_ x: Int) -> Character {
        if x == 0 {
            return "Z"
        }
        let arr = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        return arr[x-1]
    }
}