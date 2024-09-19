class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        let m = mat.count
        let n = mat[0].count
        var arr = [(Int, Int)]()
        for i in 0..<m {
            var cnt = 0
            for j in 0..<n {
                if mat[i][j] == 1 {
                    cnt += 1
                }
            }
            arr.append((cnt, i))
        }
        arr.sort { 
            if $0.0 == $1.0 {
                return $0.1 < $1.1
            } else {
                return $0.0 < $1.0
            }
        }
        return Array(arr.map { $0.1 }[0..<min(k, arr.count)])
    }
}