defmodule OTP.Echo do
 
    def start_link do
        pid = spawn_link(__MODULE__, :loop, [])
        {:ok, pid}
    end
    
    def send(pid, msg) do
        Kernel.send(pid, {msg, self()})
    end
    
    def loop do
        receive do
        {msg, caller} when is_pid(caller) ->
        Kernel.send(caller, msg)
        loop()
        end
    end

end