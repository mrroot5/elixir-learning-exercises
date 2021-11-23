defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    number_of_hourly_rates_on_daily_rate = 8.0
    hourly_rate * number_of_hourly_rates_on_daily_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * ((100.0 - discount) / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    number_of_daily_rate_on_monthly_rate = 22
    cond do
      discount == 100.0 or discount == 100 -> 0.0
      discount == 0.0 or discount == 0 -> trunc(Float.ceil(daily_rate(hourly_rate) * number_of_daily_rate_on_monthly_rate))
      true -> trunc(Float.ceil(apply_discount(daily_rate(hourly_rate), discount) * number_of_daily_rate_on_monthly_rate))
    end
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount), 1)
  end
end
