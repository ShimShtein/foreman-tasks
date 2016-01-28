FactoryGirl.define do
  factory :triggering, :class => ForemanTasks::Triggering do
    mode :immediate

    trait :future do
      time = Time.now
      mode :future
      start_at time
      start_at_raw(time.strftime(ForemanTasks::Triggering::TIME_FORMAT))
    end

    trait :recurring do
      mode :recurring
      input_type :cronline
      cronline '* * * * *'
    end

    trait :end_time_limited do
      end_time_limited true
      end_time(Time.now + 60)
    end
  end

end
