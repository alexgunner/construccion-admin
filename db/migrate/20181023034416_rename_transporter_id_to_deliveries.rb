class RenameTransporterIdToDeliveries < ActiveRecord::Migration[5.1]
  def change
    rename_column :deliveries, :transporter_id, :transport_id
  end
end
