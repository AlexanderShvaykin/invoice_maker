module Invoices
  module Decorators
    class Show < ::Decorators::Base
      Position = Struct.new(:name, :price, :count) do
        def sum
          price * count
        end
      end
      delegate :organization, to: :object
      delegate :address, :phone, :inn, to: :citizen, prefix: :user
      delegate :name, :inn, :address, :phone, to: :organization

      def position_count
        positions.size
      end

      def position_sum
        object.items.sum("count * price")
      end

      def human_sum
        "#{position_sum.to_i.humanize(locale: I18n.locale)} рублей 00 копеек".capitalize
      end

      def user_signature
        "#{citizen.last_name} #{citizen.name.first}. #{citizen.middle_name.first}."
      end

      def user_name
        "#{citizen.last_name} #{citizen.name} #{citizen.middle_name}"
      end

      def positions
        @positions ||= object.items.map do |i|
          Position.new(*i.as_json.values_at("name", "price", "count"))
        end
      end
    end
  end
end
