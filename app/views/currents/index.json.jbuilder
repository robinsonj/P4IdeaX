json.array!(@currents) do |current|
  json.extract! current, :id
  json.url current_url(current, format: :json)
end
