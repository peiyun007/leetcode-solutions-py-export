MOUSE_TURN, CAT_TURN = 0, 1
UNKNOWN, MOUSE_WIN, CAT_WIN = 0, 1, 2
MAX_MOVES = 1000
WALL = '#'
CAT, MOUSE, FOOD = 'C', 'M', 'F'
dirs = ((-1, 0), (1, 0), (0, -1), (0, 1))

class Solution:
    def canMouseWin(self, grid: List[str], catJump: int, mouseJump: int) -> bool:
        self.__rows = len(grid)
        self.__cols = len(grid[0])
        self.__grid = grid
        self.__catJump = catJump
        self.__mouseJump = mouseJump
        mouseStart, catStart = -1, -1
        for i in range(0, self.__rows):
            for j in range(0, self.__cols):
                c = grid[i][j]
                if c == CAT:
                    catStart = self.__getPos(i, j)
                elif c == MOUSE:
                    mouseStart = self.__getPos(i, j)
                elif c == FOOD:
                    food = self.__getPos(i, j)
        total = self.__rows * self.__cols
        self.__degrees = [[[0, 0] for _ in range(total)] for _ in range(total)]
        self.__results = [[[0, 0] for _ in range(total)] for _ in range(total)]
        self.__steps = [[[0, 0] for _ in range(total)] for _ in range(total)]
        q = deque()
        for mouse in range(0, total):
            mouseRow, mouseCol = mouse // self.__cols, mouse % self.__cols
            if grid[mouseRow][mouseCol] == WALL:
                continue
            for cat in range(0, total):
                catRow, catCol = cat // self.__cols, cat % self.__cols
                if grid[catRow][catCol] == WALL:
                    continue
                self.__degrees[mouse][cat][MOUSE_TURN] += 1
                self.__degrees[mouse][cat][CAT_TURN] += 1
                for dir in dirs:
                    row, col, jump = mouseRow + dir[0], mouseCol + dir[1], 1
                    while row >= 0 and row < self.__rows and col >= 0 and col < self.__cols and grid[row][col] != WALL and jump <= mouseJump:
                        nextMouse, nextCat = self.__getPos(row, col), self.__getPos(catRow, catCol)
                        self.__degrees[nextMouse][nextCat][MOUSE_TURN] += 1
                        row, col, jump = row + dir[0], col + dir[1], jump + 1
                    row, col, jump = catRow + dir[0], catCol + dir[1], 1
                    while row >= 0 and row < self.__rows and col >= 0 and col < self.__cols and grid[row][col] != WALL and jump <= catJump:
                        nextMouse, nextCat = self.__getPos(mouseRow, mouseCol), self.__getPos(row, col)
                        self.__degrees[nextMouse][nextCat][CAT_TURN] += 1
                        row, col, jump = row + dir[0], col + dir[1], jump + 1
        for pos in range(0, total):
            if pos == food:
                continue
            row, col = pos // self.__cols, pos % self.__cols
            if grid[row][col] == WALL:
                continue
            self.__results[pos][pos][MOUSE_TURN] = CAT_WIN
            self.__steps[pos][pos][MOUSE_TURN] = 0
            self.__results[pos][pos][CAT_TURN] = CAT_WIN
            self.__steps[pos][pos][CAT_TURN] = 0
            q.append((pos, pos, MOUSE_TURN))
            q.append((pos, pos, CAT_TURN))
        for mouse in range(0, total):
            mouseRow, mouseCol = mouse // self.__cols, mouse % self.__cols
            if grid[mouseRow][mouseCol] == WALL or mouse == food:
                continue
            self.__results[mouse][food][MOUSE_TURN] = CAT_WIN
            self.__steps[mouse][food][MOUSE_TURN] = 0
            self.__results[mouse][food][CAT_TURN] = CAT_WIN
            self.__steps[mouse][food][CAT_TURN] = 0
            q.append((mouse, food, MOUSE_TURN))
            q.append((mouse, food, CAT_TURN))
        for cat in range(0, total):
            catRow, catCol = cat // self.__cols, cat % self.__cols
            if grid[catRow][catCol] == WALL or cat == food:
                continue
            self.__results[food][cat][MOUSE_TURN] = MOUSE_WIN
            self.__steps[food][cat][MOUSE_TURN] = 0
            self.__results[food][cat][CAT_TURN] = MOUSE_WIN
            self.__steps[food][cat][CAT_TURN] = 0
            q.append((food, cat, MOUSE_TURN))
            q.append((food, cat, CAT_TURN))
        # print(f"{self.__results}")
        # print(f"{self.__degrees}")
        while q:
            state = q.popleft()
            mouse, cat, turn = state
            result = self.__results[mouse][cat][turn]
            steps = self.__steps[mouse][cat][turn]
            prevStates = self.__getPrevStates(mouse, cat, turn)
            print(f"{prevStates}")
            for prevState in prevStates:
                prevMouse, prevCat, prevTurn = prevState
                if self.__results[prevMouse][prevCat][prevTurn] == UNKNOWN:
                    winState = (result == MOUSE_WIN and prevTurn == MOUSE_TURN) or (result == CAT_WIN and prevTurn == CAT_TURN)
                    if winState:
                        self.__results[prevMouse][prevCat][prevTurn] = result
                        self.__steps[prevMouse][prevCat][prevTurn] = steps + 1
                        q.append((prevMouse, prevCat, prevTurn))
                    else:
                        self.__degrees[prevMouse][prevCat][prevTurn] -= 1
                        if self.__degrees[prevMouse][prevCat][prevTurn] == 0:
                            self.__results[prevMouse][prevCat][prevTurn] = result
                            self.__steps[prevMouse][prevCat][prevTurn] = steps + 1
                            q.append((prevMouse, prevCat, prevTurn))
        return self.__results[mouseStart][catStart][MOUSE_TURN] == MOUSE_WIN and self.__steps[mouseStart][catStart][MOUSE_TURN] <= MAX_MOVES

    def __getPrevStates(self, mouse, cat, turn) -> List[tuple]:
        prevStates = []
        mouseRow, mouseCol = mouse // self.__cols, mouse % self.__cols
        catRow, catCol = cat // self.__cols, cat % self.__cols
        prevTurn = CAT_TURN if turn == MOUSE_TURN else MOUSE_TURN
        maxAump = self.__mouseJump if prevTurn == MOUSE_TURN else self.__catJump
        startRow = mouseRow if prevTurn == MOUSE_TURN else catRow
        startCol = mouseCol if prevTurn == MOUSE_TURN else catCol
        prevStates.append((mouse, cat, prevTurn))
        for dir in dirs:
            i, j, jump = startRow + dir[0], startCol + dir[1], 1
            while i >= 0 and i < self.__rows and j >= 0 and j < self.__cols and self.__grid[i][j] != WALL and jump <= maxAump:
                prevMouseRow = i if prevTurn == MOUSE_TURN else mouseRow
                prevMouseCol = j if prevTurn == MOUSE_TURN else mouseCol
                prevCatRow = catRow if prevTurn == MOUSE_TURN else i
                prevCatCol = catCol if prevTurn == MOUSE_TURN else j
                prevMouse = self.__getPos(prevMouseRow, prevMouseCol)
                prevCat = self.__getPos(prevCatRow, prevCatCol)
                prevStates.append((prevMouse, prevCat, prevTurn))
                i, j, jump = i + dir[0], j + dir[1], jump + 1
        return prevStates

    def __getPos(self, row, col) -> int:
        return row * self.__cols + col
