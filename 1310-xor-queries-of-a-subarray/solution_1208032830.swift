class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var xors = Array(repeating: 0, count: arr.count+1)
        for i in 0..<arr.count {
            xors[i+1] = xors[i] ^ arr[i]
        }
        var ans = [Int]()
        for query in queries {
            let l = query[0]
            let r = query[1]
            ans.append(xors[r+1] ^ xors[l])
        }
        return ans
    }
}