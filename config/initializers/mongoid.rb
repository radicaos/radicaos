if Rails.env.to_sym == :production
  Mongoid.load!(Rails.root.join("radicaos.yml"), :mongodb)
else
  Mongoid.load!(Rails.root.join("config/mongoid.yml"), Rails.env)
end