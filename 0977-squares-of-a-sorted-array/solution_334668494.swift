class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var i = 0, j = 0
        while j < A.count && A[j] < 0 {
            j += 1
        }
        i = j - 1
        
        var t = 0
        let N = A.count
        var res = [Int](repeating: 0, count: N)
        
        while i >= 0 && j < N {
            if A[i] * A[i] < A[j] * A[j] {
                res[t] = A[i] * A[i]
                i -= 1
            } else {
                res[t] = A[j] * A[j]
                j += 1
            }
            t += 1
        }
        while i >= 0 {
            res[t] = A[i] * A[i]
            i -= 1
            t += 1
        }
        while j < N {
            res[t] = A[j] * A[j]
            j += 1
            t += 1
        }
        return res
    }
}