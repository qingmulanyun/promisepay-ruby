module Promisepay
  # Manage Batch Transacations
  class BatchTransaction < BaseModel
    # @return [Array<Promisepay::Item>]
    def items
      response = JSON.parse(@client.get("batch_transactions/#{send(:id)}/items?limit=100").body)
      items = response.key?('items') ? response['items'] : []
      items.map { |attributes| Promisepay::Item.new(@client, attributes) }
    end
  end
end
