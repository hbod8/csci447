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
    
  endFunction

  class GameParlorMonitor
    superclass Object
    fields
      dice: int
      dmutex: Mutex
      donecond: Condition
    methods
      Init()
      Request(numberOfDice: int)
      Return(numberOfDice: int)
  endClass


endCode
