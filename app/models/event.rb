class Event < ActiveRecord::Base
  belongs_to :event_type
  has_many :event_details

  accepts_nested_attributes_for :event_details

  validates :name, :event_date, presence: true


  def self.generate_report
    events = Event.all
    data_hash = {}
    events.each do|event|
      event_data = [event.name, event.event_date, event.location, event.total_amount]
      data_hash[event_data] = get_event_details(event)
    end
    data_hash
  end

  def self.get_event_details(event)
    data_list = []
    event_details = EventDetail.joins(:user).where(event_id: event.id).order("paid_amount DESC")
    total_payee_count = event_details.count
    divided_amt = event.total_amount/total_payee_count
    max_payee = event_details.first
    max_payee_name = max_payee.user.name

    Rails.logger.info "###########{max_payee.inspect}"

    from = event_details.pluck("users.name")
    from.delete(max_payee_name)
    data_list << "#{ max_payee_name } has taken amount $#{(divided_amt - (max_payee.paid_amount)*-1).round(2) rescue 0} from #{from.join(", ")}"

    event_details.each do|event_detail|
      balance_amt = (divided_amt - (event_detail.paid_amount)) rescue 0
      data_list << "#{ event_detail.user.name } has paid amount $#{balance_amt.round(2)} to #{max_payee_name}" unless event_detail.id == max_payee.id
    end

    data_list
  end



end
