# this tasks build a graphql schema dump to easily see diffs on PRs
# see https://rmosolgo.github.io/ruby/graphql/2017/03/16/tracking-schema-changes-with-graphql-ruby

task dump_schema: :environment do
  schema_defn = MyUnsplashApiSchema.to_definition
  schema_path = 'app/graphql/schema.graphql'
  # Write the schema dump to that file:
  File.write(Rails.root.join(schema_path), schema_defn)
  puts "Updated #{schema_path}"
end
