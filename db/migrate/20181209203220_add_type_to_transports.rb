class AddTypeToTransports < ActiveRecord::Migration[5.1]
  def change
    add_column :transports, :typetransport, :string
  end
end
