# db/seeds.rb

data = [
  { code: 'MCCB', name: 'Cầu dao MCCB', category: 'ECM' },
  { code: 'DINC', name: 'Cầu dao DIN', category: 'ECM' },
  { code: 'ELB', name: 'Cầu dao ELB', category: 'ECM' },
  { code: 'SPD', name: 'Thiết bị chống sét lan truyền', category: 'ECM' },
  { code: 'NEPAI', name: 'Phụ kiện bút thử điện', category: 'ECM' },
  { code: 'PUMP', name: 'Bơm nước', category: 'HA' },
  { code: 'NPUMP', name: 'Bơm nước', category: 'HA' },
  { code: 'TAPETW', name: 'Băng keo điện', category: 'ECM' },
  { code: 'TAPECN', name: 'Băng keo điện', category: 'ECM' },
  { code: 'CABLE', name: 'Dây cáp', category: 'ECM' },
  { code: 'CF', name: 'Quạt trần', category: 'HA' },
  { code: 'CHIME', name: 'Chuông điện', category: 'ECM' },
  { code: 'DH', name: 'Máy hút ẩm', category: 'HA' },
  { code: 'IC', name: 'Bếp điện từ', category: 'HA' },
  { code: 'PCE', name: 'Thiết bị điện công nghiệp', category: 'ECM' },
  { code: 'OUTDOORS', name: 'Đèn ngoài trời', category: 'LT'},
  { code: 'OUTDOOR', name: 'Đèn ngoài trời', category: 'LT' },
  { code: 'NWD', name: 'Cầu chì, dimmer, đèn báo', category: 'ECM' },
  { code: 'DU', name: 'Ổ cắm âm sàn', category: 'ECM' },
  { code: 'EF', name: 'Quạt điện', category: 'HA' },
  { code: 'FLEX', name: 'Ống gân', category: 'ECM' },
  { code: 'FPA', name: 'Phụ kiện ống thẳng', category: 'ECM' },
  { code: 'FPC', name: 'Ống thẳng', category: 'ECM' },
  { code: 'HB', name: 'Cầu dao HB', category: 'ECM' },
  { code: 'HSWGT', name: 'Máy nước nóng', category: 'HA' },
  { code: 'VJY', name: 'Máy sấy tay', category: 'HA' },
  { code: 'HSWTT', name: 'Máy nước nóng', category: 'HA' },
  { code: 'VF', name: 'Quạt hút', category: 'HA' },
  { code: 'AP', name: 'Máy lọc không khí', category: 'HA' },
  { code: 'PDBOX', name: 'Tủ điện', category: 'ECM' },
  { code: 'NAE', name: 'Đui đèn E27', category: 'ECM' },
  { code: 'NCD', name: 'Tủ sấy quần áo', category: 'HA' },
  { code: 'NDOWL', name: 'Đèn downlight', category: 'LT' },
  { code: 'APAI', name: 'Phụ kiện bảo hành', category: 'HA' },
  { code: 'BD', name: 'Quạt hút', category: 'HA' },
  { code: 'BOX', name: 'Phụ kiện TBĐ', category: 'ECM' },
  { code: 'IS', name: 'Isolator', category: 'ECM' },
  { code: 'SFLIGHT', name: 'Đèn pha solar', category: 'LT' },
  { code: 'NVF', name: 'Quạt hút', category: 'HA' },
  { code: 'NRF', name: 'Quạt sạc', category: 'HA' },
  { code: 'NRECHAR', name: 'Đèn đội đầu', category: 'LT' },
  { code: 'NKT', name: 'Bình đun siêu tốc', category: 'HA' },
  { code: 'NIC', name: 'Bếp điện từ', category: 'HA' },
  { code: 'NES', name: 'Ổ cắm có dây', category: 'ECM' },
  { code: 'NEP', name: 'Bút thử điện', category: 'ECM' },
  { code: 'NEMLA', name: 'Phụ kiện Đèn', category: 'LT' },
  { code: 'NEML', name: 'Đèn khẩn cấp', category: 'LT' },
  { code: 'NEF', name: 'Quạt điện', category: 'HA' },
  { code: 'NDL3S', name: 'Đèn downlight', category: 'LT' },
  { code: 'NDESK', name: 'Đèn bàn', category: 'LT' },
  { code: 'NCHIMEAI', name: 'Phụ kiện chuông điện', category: 'ECM' },
  { code: 'NCHIME', name: 'Chuông điện', category: 'ECM' },
  { code: 'NCEIL', name: 'Đèn ốp trần', category: 'LT' },
  { code: 'NBULB', name: 'Bóng bulb trụ', category: 'LT' },
  { code: 'HIGHBAY', name: 'Đèn nhà xưởng', category: 'LT' },
  { code: 'FLIGHT', name: 'Đèn pha', category: 'LT' },
  { code: 'ECO', name: 'Đèn downlight', category: 'LT' },
  { code: 'DB', name: 'Tủ điện', category: 'ECM' },
  { code: 'CBULB', name: 'Bóng Bulb chanh', category: 'LT' },
  { code: 'ABULB', name: 'Bóng Bulb', category: 'LT' },
  { code: 'PANEL-A', name: 'Phụ kiện Đèn', category: 'LT' },
  { code: 'NNV', name: 'Nẹp vuông', category: 'ECM' },
  { code: 'FULW', name: 'Thiết bị điện Full', category: 'ECM' },
  { code: 'NPS', name: 'Phích ổ đơn', category: 'ECM' },
  { code: 'NMAG', name: 'Đèn pha nam châm', category: 'LT' },
  { code: 'NMAGA', name: 'Phụ kiện đèn pha nam châm', category: 'LT' },
  { code: 'NMOS', name: 'Đèn bắt muỗi', category: 'LT' },
  { code: 'NHERA', name: 'Đèn downlight', category: 'LT' },
  { code: 'OPANEL', name: 'Đèn tấm', category: 'LT' },
  { code: 'NMR', name: 'Vợt muỗi', category: 'ECM' },
  { code: 'PANEL', name: 'Đèn panel ốp trần', category: 'LT' },
  { code: 'NSLIMDL', name: 'Đèn downlight', category: 'LT' },
  { code: 'STRIPLV', name: 'Đèn led dây', category: 'LT' },
  { code: 'T8', name: 'Đèn tuýp', category: 'LT' },
  { code: 'TRACK', name: 'Đèn spotlight gắn ray', category: 'LT' },
  { code: 'T8FIX', name: 'Máng đèn tuýp', category: 'LT' },
  { code: 'TBA', name: 'Công tắc đồng hồ', category: 'ECM' },
  { code: 'TB', name: 'Công tắc đồng hồ', category: 'ECM' },
  { code: 'WPL', name: 'Máng đèn kín nước', category: 'LT' },
  { code: 'NSHOP', name: 'Đèn bán nguyệt', category: 'LT' },
  { code: 'REFINA', name: 'Thiết bị điện Refina', category: 'ECM' },
  { code: 'WIDC', name: 'Thiết bị điện Wide', category: 'ECM' },
  { code: 'WIDE', name: 'Thiết bị điện Wide', category: 'ECM' },
  { code: 'ALIGHT', name: 'Phụ kiện đèn', category: 'LT' },
  { code: 'WDJ', name: 'Thiết bị điện công nghiệp', category: 'ECM' },
  { code: 'NSURDL', name: 'Đèn LED Downlight trụ', category: 'LT' },
  { code: 'STRIP', name: 'Đèn led dây', category: 'LT' },
  { code: 'STRIPA', name: 'Phụ kiện Đèn', category: 'LT' },
  { code: 'TRACKA', name: 'Phụ kiện Đèn', category: 'LT' },
  { code: 'MINERVA', name: 'Thiết bị điện Minerva', category: 'ECM' },
  { code: 'GEN-X', name: 'Thiết bị điện Gen-X', category: 'ECM' },
  { code: 'HALUMIE', name: 'Thiết bị điện Wide', category: 'ECM' },
  { code: 'MODERVA', name: 'Thiết bị điện Moderva', category: 'ECM' },
  { code: 'F2W', name: 'Cầu chì, dimmer, đèn báo', category: 'ECM' },
  { code: 'NLSBAND', name: 'Vòng đeo tay có đèn', category: 'LT' },
  { code: 'NSURDLA', name: 'Đèn downlight trụ', category: 'LT' },
  { code: 'NMIRA', name: 'Đèn panel ốp trần', category: 'LT' },
  { code: 'NCW', name: 'Bộ nồi', category: 'HA' },
  { code: 'NCF', name: 'Quạt trần', category: 'HA' },
  { code: 'STRIPEX', name: 'Đèn led dây', category: 'LT' }
]
puts '🌱 Seeding admin user...'

User.find_or_create_by(email_address: 'admin@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.user_type = :superadmin
end

puts '✅ Seeding admin user completed!'

puts '✅ Seeding admin user completed!'

puts '🌱 Seeding Product Groups and Subgroups ...'
data.each do |item|
  product_group = ProductGroup.find_or_create_by(code: item[:category]) do |pg|
    pg.name = item[:category]
  end

  # Tạo Subgroup thuộc về ProductGroup
  Subgroup.find_or_create_by(code: item[:code], product_group: product_group) do |sg|
    sg.name = item[:name]
    sg.description = (item[:name]).to_s
  end
end

puts '✅ Product Groups and Subgroups completed!'
