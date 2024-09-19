class Solution {
    func judgePoint24(_ cards: [Int]) -> Bool {
        let kAdd = 0, kMul = 1, kSub = 2, kDiv = 3
        let kEpsilon = 1e-6
        let target: Double = 24
        let nums = cards.map { Double($0) }
        return solve(nums)

        func solve(_ list: [Double]) -> Bool {
            if list.count == 0 {
                return false
            }
            if list.count == 1 {
                return abs(list[0]-target) < kEpsilon
            }
            let size = list.count
            for i in 0..<size {
                for j in 0..<size {
                    if i != j {
                        var list2 = [Double]()
                        for k in 0..<size {
                            if k != i && k != j {
                                list2.append(list[k])
                            }
                        }
                        for k in 0..<4 {
                            if k < 2 && i > j { continue }
                            if k == kAdd {
                                list2.append(list[i]+list[j])
                            } else if k == kMul {
                                list2.append(list[i]*list[j])
                            } else if k == kSub {
                                list2.append(list[i]-list[j])
                            } else if k == kDiv {
                                if abs(list[j]) < kEpsilon { continue }
                                list2.append(list[i]/list[j])
                            }
                            if solve(list2) {
                                return true
                            }
                            list2.remove(at: list2.count-1)
                        }
                        
                    }
                }
            }
            return false
        }
    }
}