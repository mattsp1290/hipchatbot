class Workers
  def self.work
  	workers_list = [RedditWorker, Janitor]
  	workers_list.each do |worker|
  		worker.work
  	end
  end
end