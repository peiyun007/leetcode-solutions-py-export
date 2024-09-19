class Solution {
    func solve(_ arr: [Int], _ i: Int, _ j: Int, _ dp: inout [[Int]]) -> Int {
        if j >= arr.count || i >= j {
            return 0
        }
        if dp[i][j] != -1 {
            return dp[i][j]
        }
        var x = 0
        var l = j+1, r = arr.count-1
        while l<=r {
            let mid = (l+r)/2
            if arr[mid] == arr[i]+arr[j] {
                x=1+solve(arr,j,mid,&dp)
                break
            } else if arr[mid] < arr[i]+arr[j] {
                l=mid+1
            } else {
                r=mid-1
            }
        }
        dp[i][j]=x
        return x
    }

    func lenLongestFibSubseq(_ arr: [Int]) -> Int {
        guard arr.count >= 3 else {
            return 0
        }
        var dp = Array(repeating: Array(repeating: -1, count: arr.count), count: arr.count)
        var map = [Int: Int]()
        for (i, num) in arr.enumerated() {
            map[num] = i
        }
        var ans = 0
        for i in 0..<arr.count {
            for j in i+1..<arr.count {
                if map[arr[i]+arr[j]] != nil {
                    ans = max(ans, 2+solve(arr, i, j, &dp))
                }
            }
        }
        return ans
    }
}