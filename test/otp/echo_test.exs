defmodule OTP.EchoTest do #module compund functions
    use ExUnit.Case, async: true 


    alias OTP.Echo

test "echo" do
 {:ok, pid} = Echo.start_link()
 Echo.send(pid, :hello)
 assert_receive :hello
 Echo.send(pid, :hi)
 assert_receive :hi
 end
end