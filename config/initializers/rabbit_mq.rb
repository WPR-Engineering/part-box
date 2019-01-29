require 'bunny'

if CONFIG[:LABEL_PRINTING][:ENABLED]
  # Get config vars we need
  server = CONFIG[:LABEL_PRINTING][:RABBIT_MQ]

  # Connect to rabbit mq server
  PRINT_RABBIT_MQ = Bunny.new "amqp://#{server[:USER]}:#{server[:PASS]}@#{server[:HOST]}:#{server[:PORT]}"
  PRINT_RABBIT_MQ.start

  # Setup exchange and  channel
  PRINT_CHANNEL = PRINT_RABBIT_MQ.create_channel
  PRINT_EXCHANGE = PRINT_CHANNEL.topic "partbox", :auto_delete => true

  # Reset config var
  server = nil
end
