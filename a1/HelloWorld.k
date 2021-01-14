code Hello

  -- This is the "hello world" program, for use in Project 1.

  function main ()
      var c: char
      print ("Hello, world...\n")
      --foo (10)
      while (true)
        c = GetChar()
        printChar(c)
      endWhile
    endFunction

  function foo (x: int)
      bar (x+1)
    endFunction

  function bar (a: int)
    var b: int
      b = a + 1
      print ("The value of b is ")
      printInt (b)
      nl ()
      debug
      bar (b)
    endFunction

endCode
