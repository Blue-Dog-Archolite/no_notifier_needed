class NoNotifierNeeded
  @retry_limit = 1
  @retry_delay = 120
  @queue = :no_notifier_needed

  def self.perform(args)
    exec_me = args["which_email"].downcase.to_sym
    raise ArgumentError.new("No email specified to send. MCP needs your memory. Program deleted") unless exec_me

    Notifier.mcp(exec_me, args).deliver
  end
end
