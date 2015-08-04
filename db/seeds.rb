# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


Stock.delete_all

Stock.create(:company_name => 'Google', :ticker => "GOOGL", :quote => 657.50, :price_change => -7.06, :percentage_change => -1.06)
Stock.create(:company_name => 'Twitter', :ticker => "TWTR", :quote => 31.00, :price_change => -0.47, :percentage_change => -1.48)
Stock.create(:company_name => 'Ralph Lauren Corp', :ticker => "RL", :quote => 125.89, :price_change => -1.23, :percentage_change => -0.97)
Stock.create(:company_name => 'Lumber Liquidators Holdings', :ticker => "LL", :quote => 19.30, :price_change => 0.16, :percentage_change => 0.84)
Stock.create(:company_name => 'Titan Pharmaceuticals', :ticker => "TTNP", :quote => 0.78, :price_change => 0.001, :percentage_change => 0.13)
