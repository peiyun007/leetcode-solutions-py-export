class Solution {
    func scoreOfParentheses(_ s: String) -> Int {
        return score(Array(s), 0, s.count-1)
    }

    func score(_ arr: [Character], _ l: Int, _ r: Int) -> Int {
        if r - l == 1 {
            return 1
        }
        var b = 0
        for i in l..<r {
            if arr[i] == "(" {
                b += 1
            }
            if arr[i] == ")" {
                b -= 1
            }
            if b == 0 {
                return score(arr, l, i) + score(arr, i+1, r)
            }
        }
        return 2 * score(arr, l+1, r-1)
    }
}