#   Copyright (c) 2010, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3.  See
#   the COPYRIGHT file.


MongoMapper.connection = Mongo::Connection.new('flame.mongohq.com', 27050)

MongoMapper.database = "diaspora-#{Rails.env}"
MongoMapper.database.authenticate('diaspora-user', 'sekretp4ssword')

if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.connection.connect_to_master if forked
   end
end

