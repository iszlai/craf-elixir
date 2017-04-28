defmodule OTP.EchoTest do #module compund functions
    use ExUnit.Case, async: true 


    alias OTP.Echo #if you don't specify than the last element is used
    #in this case OTP.Echo -> Echo

test "echo" do
 {:ok, pid} = Echo.start_link() #assume echo module
 #returns touple , ok -simbol , pid - will be assigned 

 Echo.send(pid, :hello)
 assert_receive :hello
 
 Echo.send(pid, :hi)
 assert_receive :hi

 Echo.send(pid, 2)
 assert_receive 2
 end
end