require 'active_record'

###
# Active record database configuration
###
ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

###
# Active record migrator configuration
###
if ActiveRecord.version.release() < Gem::Version.new('5.2.0')
  ActiveRecord::Migrator.migrate 'spec/db/migrate'
elsif ActiveRecord.version.release == Gem::Version.new('6.0.0')
  ActiveRecord::MigrationContext.new('spec/db/migrate', ActiveRecord::SchemaMigration).migrate
else
  ActiveRecord::MigrationContext.new('spec/db/migrate').migrate
end
