class AddRoomLinkToConsultations < ActiveRecord::Migration[7.0]
  def change
    add_column :consultations, :room_link, :string
  end
end
