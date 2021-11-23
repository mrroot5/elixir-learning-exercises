defmodule FreelancerRates do
  @hourly_rate_on_daily_rate 8.0
  @monthly_billable_days 22

  def daily_rate(hourly_rate) do
    hourly_rate * @hourly_rate_on_daily_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (100.0 - discount) / 100
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate)
    |> apply_discount(discount)
    |> Kernel.*(@monthly_billable_days)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount), 1)
  end
end
