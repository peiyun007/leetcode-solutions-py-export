
class TopVotedCandidate {
    private var tops = [Int]()
    private let times: [Int]
    init(_ persons: [Int], _ times: [Int]) {
        self.times = times

        var cnt = [Int: Int]()
        var top = -1
        cnt[top] = 0
        for p in persons {
            cnt[p, default: 0] += 1
            if cnt[p, default: 0] >= cnt[top, default: 0] {
                top = p
            }
            tops.append(top)
        }
    }
    
    func q(_ t: Int) -> Int {
        var left = 0, right = times.count
        while left < right {
            let mid = left + (right - left) / 2
            if times[mid] <= t {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return tops[left-1]
    }
}

/**
 * Your TopVotedCandidate object will be instantiated and called as such:
 * let obj = TopVotedCandidate(persons, times)
 * let ret_1: Int = obj.q(t)
 */