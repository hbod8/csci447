code Game

  -- OS Class: Project 2
  --
  -- Harry Saliba
  --

  var
    monitor: GameParlorMonitor

  function main ()

      InitializeScheduler ()

      -- Implement a Game Parlor
      GameParlor ()

      ThreadFinish ()

    endFunction

  -- Add your code here

  function GameParlor()
    var
      group: array [8] of Thread = new array of Thread { 8 of new Thread }

    monitor = new GameParlorMonitor
    monitor.Init()

    group[0].Init("A")
    group[0].Fork(ThreadBody, 4)

    group[1].Init("B")
    group[1].Fork(ThreadBody, 4)
    
    group[2].Init("C")
    group[2].Fork(ThreadBody, 5)
    
    group[3].Init("D")
    group[3].Fork(ThreadBody, 5)
    
    group[4].Init("E")
    group[4].Fork(ThreadBody, 2)
    
    group[5].Init("F")
    group[5].Fork(ThreadBody, 2)
    
    group[6].Init("G")
    group[6].Fork(ThreadBody, 1)
    
    group[7].Init("H")
    group[7].Fork(ThreadBody, 1)
  endFunction

  function ThreadBody(numberOfDice: int)
    var
      i: int
    for i = 1 to 5 by 1
      monitor.Request(numberOfDice)
      currentThread.Yield()
      monitor.Return(numberOfDice)
      currentThread.Yield()
    endFor
  endFunction

  class GameParlorMonitor
    superclass Object
    fields
      dice: int
      groupq: List [Thread]
      dmutex: Mutex
      donecond: Condition
    methods
      Init()
      Request(numberOfDice: int)
      Return(numberOfDice: int)
  endClass

  behavior GameParlorMonitor

    method Init()
      dice = 8
      groupq = new List [Thread]
      dmutex = new Mutex
      dmutex.Init()
      donecond = new Condition
      donecond.Init()
    endMethod

    method Request(numberOfDice: int)
      var
        qh: ptr to Thread
      dmutex.Lock()
      print(currentThread.name)
      print(" requests ")
      printInt(numberOfDice)
      print("\n")
      if !groupq.IsEmpty() || numberOfDice > dice
        groupq.AddToEnd(currentThread)
        while groupq.first != currentThread || numberOfDice > dice
          donecond.Wait(&dmutex)
        endWhile
        qh = groupq.Remove()
      endIf
      dice = dice - numberOfDice
      print(currentThread.name)
      print(" proceeds with ")
      printInt(numberOfDice)
      print("\n")
      dmutex.Unlock()
    endMethod

    method Return(numberOfDice: int)
      dmutex.Lock()
      dice = dice + numberOfDice
      print(currentThread.name)
      print(" releases and adds back ")
      printInt(numberOfDice)
      print("\n")
      donecond.Broadcast(&dmutex)
      dmutex.Unlock()
    endMethod

  endBehavior
endCode
