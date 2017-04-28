defmodule OTP.Echo do
 
    def start_link do
        #m ,f a (module function argument)
        pid = spawn_link(__MODULE__, :loop, [])
        {:ok, pid}
    end
    
    def send(pid, msg) do
        Kernel.send(pid, {msg, self()})
    end
    
    def loop do #zero arity (number of args)
        receive do
        {msg, caller}  ->
        Kernel.send(caller, msg)
        loop()#levrages effective recursion
        end
    end

end