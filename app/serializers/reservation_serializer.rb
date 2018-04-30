class ReservationSerializer < ActiveModel::Serializer
  attributes :reserve_date, :client, :confirmed
end
