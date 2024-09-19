class Solution {
    var memo = [Int: Int]()
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
        var arr = [(Int, Int)]()
        for i in lo...hi {
            arr.append((i, cal(i)))
        }
        arr.sort { $0.1 < $1.1 }
        return arr[k-1].0
    }

    func cal(_ n: Int) -> Int {
        if n == 1 {
            return 0
        }
        if let val = memo[n] {
            return val
        }
        let res = n % 2 == 0 ? cal(n/2)+1 : cal(3*n+1)+1
        memo[n] = res
        return res
    }
}