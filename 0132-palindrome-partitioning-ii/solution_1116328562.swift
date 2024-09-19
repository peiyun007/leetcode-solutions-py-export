// extension String {
//     subscript(idx: Int) -> Character {
//         return self[self.index(self.startIndex, offsetBy: idx)]
//     }
    
//     var isPalindrome: Bool {
//         var i = 0
//         var j = self.count - 1
//         while i < j {
//             if self[i] != self[j] {
//                 return false
//             }
//             i += 1
//             j -= 1
//         }
//         return true
//     }
// }

class Solution {
    func isPalindrome(_ arr: [Character], _ l: Int, _ r: Int) -> Bool {
        if l >= r {
            return true
        }
        if arr[l] != arr[r] {
            return false
        }
        return isPalindrome(arr, l+1, r-1)
    }

    func minCut(_ s: String) -> Int {
        let arr = Array(s)
        var dp = Array(repeating: 1, count: arr.count+1)
        dp[arr.count] = 0
        for i in (0..<arr.count).reversed() {
            var ans = Int.max
            for j in i..<arr.count {
                if isPalindrome(arr, i, j) {
                    ans = min(dp[j+1] + 1, ans)
                }
            }
            dp[i] = ans
        }
        return dp[0] - 1
    }
}