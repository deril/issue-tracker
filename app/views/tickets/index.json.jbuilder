json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :subject, :body, :status
  json.url ticket_url(ticket, format: :json)
end
