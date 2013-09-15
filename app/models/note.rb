class Note < ActiveRecord::Base
  attr_accessible :description

  belongs_to :ticket

  after_create { |note| note.msg 'create' }
  after_update { |note| note.msg 'update' }
  after_destroy { |note| note.msg 'destroy' }

  def msg action
  	msg = { resource: 'notes',
  			action: action,
  			id: self.id,
  			object: self
  		}

  	$redis.publish 'rt-change', msg.to_json
  end

end
