class Solution {
    func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
        let seatsSorted = seats.sorted()
        let studentsSorted = students.sorted()
        return zip(seatsSorted, studentsSorted).reduce(0) { $0 + abs($1.0-$1.1) }
    }
}