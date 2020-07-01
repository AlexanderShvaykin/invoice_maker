module Invoices
  module Forms
    module Create
      module_function

      def call(user:, organization:, item_data:)
        bank = user.citizen.bank
        user.invoices.create!(
          number: generate_number(user), organization: organization, bank: bank, items_attributes: [item_data]
        )
      end

      def generate_number(user)
        count = user.invoices.last&.id.to_i
        "#{Time.current.year}/#{count.next}"
      end
    end
  end
end
