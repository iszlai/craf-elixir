defmodule OTP.EchoTest do #module compund functions
    use ExUnit.Case, async: true 


    alias OTP.Echo #if you don't specify than the last element is used
    #in this case OTP.Echo -> Echo

test "echo" do
 {:ok, pid} = Echo.start_link() #assume echo module
 #returns touple , ok -simbol , pid - will be assigned 

 Echo.async_send(pid, :hello)
 assert_receive :hello
 
 Echo.async_send(pid, :hi)
 assert_receive :hi

 Echo.async_send(pid, 2)
 assert_receive 2
 
 send(pid, :another_msg )
 assert Process.alive?(pid)
end

test "times out after 50ms" do
    {:ok, pid} = Echo.start_link()
    Process.sleep(51)
    refute Process.alive?(pid)
end

test "sync echo" do
    {:ok,pid} = Echo.start_link()
    assert :hello = Echo.sync_send(pid, :hello)
end

end